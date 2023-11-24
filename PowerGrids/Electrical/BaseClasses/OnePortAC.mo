within PowerGrids.Electrical.BaseClasses;

partial model OnePortAC "Base class for AC components with one port"
  import PowerGrids.Types.Choices.LocalInitializationOption;
  extends OnePortACVI(
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC(
      final computePF = computePF,
      v(re(start = port.vStart.re), im(start = port.vStart.im)),
      i(re(start = port.iStart.re), im(start = port.iStart.im)),
      terminalACPF(v = vPF, i = iPF)),
    port(final UNom = UNom, final SNom = SNom,
         final portVariablesPhases = portVariablesPhases,
         final generatorConvention = generatorConvention,
         final UStart = UStart,
         final UPhaseStart = UPhaseStart,
         final PStart = PStart,
         final QStart = QStart));

  parameter Boolean showDataOnDiagramsPu = systemPowerGrids.showDataOnDiagramsPu "=true, P,Q,V and phase are shown on the diagrams in per-unit (it overrides the SI format)" annotation(Dialog(tab = "Visualization"));
  parameter Boolean showDataOnDiagramsSI = systemPowerGrids.showDataOnDiagramsSI "=true, P,Q,V and phase are shown on the diagrams in kV, MW, Mvar" annotation(Dialog(tab = "Visualization"));
  parameter Integer dataOnDiagramDigits = systemPowerGrids.dataOnDiagramDigits "number of digits for data on diagrams" annotation(Dialog(tab = "Visualization"));
  parameter LocalInitializationOption localInit = LocalInitializationOption.none "Initialize the component locally in steady state from port start values" annotation(
    Evaluate = true, Dialog(tab = "Initialization"));
  parameter Types.ActivePower PStart = if computePF then PStartPF else SNom "Start value of active power flowing into the port" annotation(
    Dialog(tab = "Initialization", enable = not computePF));
  parameter Types.ReactivePower QStart = if computePF then QStartPF else 0 "Start value of reactive power flowing into the port" annotation(
    Dialog(tab = "Initialization", enable = not computePF));
  parameter Boolean hasSubPF = false "= true, if the model contains a sub-network with its own embedded PF; set to final in usable components";

  final parameter Types.Voltage UStart(fixed = false) "Start value of phase-to-phase voltage phasor, absolute value" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.Angle UPhaseStart(fixed = false) "Start value of phase-to-phase voltage phasor, phase angle" annotation(
    Dialog(tab = "Initialization"));
  final parameter Boolean computePF = systemPowerGrids.computePF "= true, computes the start value with the embedded power flow" annotation(
    Evaluate = true);  
  final parameter Types.ActivePower PStartPF(fixed = false) "Start value of active power flowing into the port, computed by the embedded PF";
  final parameter Types.ReactivePower QStartPF(fixed = false) "Start value of reactive power flowing into the port, computed by the embedded PF";

  replaceable OnePortACPF componentPF if computePF and not hasSubPF "component to be used to compute the embedded PF";
  outer Electrical.System systemPowerGrids "Reference to system object";

  Types.ComplexVoltage vPF "Phase-to-ground voltage phasor of embedded power flow model";
  Types.ComplexCurrent iPF "Line current phasor of embedded power flow model";

initial equation
  UStart = terminalAC.UStart;
  UPhaseStart = terminalAC.UPhaseStart;
  
  if computePF then
    // set values of initialization parameters based on EPF solution
    PStartPF = 3*CM.real(vPF*CM.conj(iPF));
    QStartPF = 3*CM.imag(vPF*CM.conj(iPF));
  else
    // set dummy values (not used)
    PStartPF = 0;
    QStartPF = 0;
  end if;  
  
equation
  if not computePF then
    vPF = Complex(0) "Dummy value";
    iPF = Complex(0) "Dummy value";
  end if;
  connect(terminalAC.terminalACPF, componentPF.terminalAC);
  
  if initial() and localInit == LocalInitializationOption.PV then
    // During local initialization, P,V is enforced at the connector towards
    // the grid, while Q,phase(V) is enforced at the port towards the component
    // Further two initial equations will be needed (e.g. in the controller)
    // to enforce P,V at the port or achieve actuator saturation if that is not possible
    CM.real(terminalAC.v*CM.conj(terminalAC.i)) = port.PStart;
    CM.abs(terminalAC.v) = port.VStart;
    port.Q = port.QStart;
    port.v.re*port.vStart.im = port.v.im*port.vStart.re;
  elseif initial() and localInit == LocalInitializationOption.PQ then
    // During local initialization, P,Q is enforced at the connector towards
    // the grid, while phase(V), phase(I) is enforced at the port towards the component
    // Further two initial equations will be needed (e.g. in the controller)
    // to enforce P,Q at the port or achieve actuator saturation if that is not possible
    terminalAC.v*CM.conj(terminalAC.i) = Complex(port.PStart, port.QStart);
    port.v.re*port.vStart.im = port.v.im*port.vStart.re;
    port.i.re*port.iStart.im = port.i.im*port.iStart.re;
  else
    // In all other cases, the port voltage and current are equal to
    // the connector voltage and current
    port.v = terminalAC.v;
    port.i = terminalAC.i;
  end if;
  annotation (
    Documentation(info = "<html>
<p>This is the base class for all the components with an AC terminal. It contains a corresponding <code>PortAC</code> component to compute useful quantities for modelling and monitoring purposes.</p>
</html>"), 
     Icon(graphics={  
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={0,-145},
        extent={{-76,15},{76,-15}},
        textColor = {238,46,47},
        textString = DynamicSelect("P", if (port.P>=0) and showDataOnDiagramsPu then String(port.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (port.P>=0) and showDataOnDiagramsSI then String(port.P/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (port.P>=0) then ""
                                        elseif (port.P<0) and showDataOnDiagramsPu then String(port.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (port.P<0) and showDataOnDiagramsSI then String(port.P/1e6, significantDigits=dataOnDiagramDigits)
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={0,-179},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if (port.Q>=0) and showDataOnDiagramsPu then String(port.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (port.Q>=0) and showDataOnDiagramsSI then String(port.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (port.Q>=0) then ""
                                        elseif (port.Q<0) and showDataOnDiagramsPu then String(port.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (port.Q<0) and showDataOnDiagramsSI then String(port.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        else ""))}));
end OnePortAC;
