within PowerGrids.Electrical.BaseClasses;

partial model OnePortACBus
  import PowerGrids.Types.Choices.LocalInitializationOption;
  parameter Boolean showDataOnDiagramsPu = systemPowerGrids.showDataOnDiagramsPu "=true, P,Q,V and phase are shown on the diagrams in per-unit (it overrides the SI format";
  parameter Boolean showDataOnDiagramsSI = systemPowerGrids.showDataOnDiagramsSI "=true, P,Q,V and phase are shown on the diagrams in kV, MW, Mvar";  
  parameter Integer dataOnDiagramDigits = systemPowerGrids.dataOnDiagramDigits "number of digits for data on diagrams";  
  parameter LocalInitializationOption localInit = LocalInitializationOption.none "Initialize the component locally in steady state from port start values" annotation(Evaluate = true);
  parameter Types.Voltage UStart = UNom "Start value of phase-to-phase voltage phasor, absolute value" annotation(
    Dialog(tab = "Initialization"));
  parameter Types.Angle UPhaseStart = 0 "Start value of phase-to-phase voltage phasor, phase angle" annotation(
    Dialog(tab = "Initialization"));
  parameter Types.ActivePower PStart = SNom "Start value of active power flowing into the port" annotation(
    Dialog(tab = "Initialization"));
  parameter Types.ReactivePower QStart = 0 "Start value of reactive power flowing into the port" annotation(
    Dialog(tab = "Initialization"));

  extends OnePortACVI(
    redeclare PowerGrids.Interfaces.TerminalACBus terminalAC(
      UStart = UStart, UPhaseStart = UPhaseStart,
      v(re(start = port.vStart.re), im(start = port.vStart.im)),
      i(re(start = port.iStart.re), im(start = port.iStart.im))),
    port(final UNom = UNom, final SNom = SNom,
         final portVariablesPhases = portVariablesPhases,
         final generatorConvention = generatorConvention,
         final UStart = UStart,
         final UPhaseStart = UPhaseStart,
         final PStart = PStart,
         final QStart = QStart));
  replaceable OnePortACPF componentPF if computePF "component to be used to compute the embedded PF";
  outer Electrical.System systemPowerGrids "Reference to system object";
  
equation
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
  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the components with an AC terminal. It contains a corresponding <code>PortAC</code> component to compute useful quantities for modelling and monitoring purposes.</p>
</html>"),
     Icon(graphics={  
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-184, 17},
        extent={{-76,15},{76,-15}},
        textColor = {28,108,200},
        textString = DynamicSelect("V", if (port.U>=0) and showDataOnDiagramsPu then String(port.VPu, significantDigits=dataOnDiagramDigits)
                                        elseif (port.U>=0) and showDataOnDiagramsSI then String(port.U/1e3, significantDigits=dataOnDiagramDigits)
                                        elseif (port.U>=0) then ""
                                        elseif (port.U<0) and showDataOnDiagramsPu then String(port.VPu, significantDigits=dataOnDiagramDigits)
                                        elseif (port.U<0) and showDataOnDiagramsSI then String(port.U/1e3, significantDigits=dataOnDiagramDigits)
                                        else "")),        
        

       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-184, -17},
        extent={{-76,15},{76,-15}},
        textColor = {0,0,255},
        textString = DynamicSelect("Uph", if port.UPhase > 0 then String(port.UPhase*180/3.14159265359, significantDigits=dataOnDiagramDigits)+"°"
                                                             else String(port.UPhase*180/3.14159265359, significantDigits=dataOnDiagramDigits)+"°"))}));
end OnePortACBus;
