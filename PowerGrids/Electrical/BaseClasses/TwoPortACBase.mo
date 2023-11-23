within PowerGrids.Electrical.BaseClasses;

partial model TwoPortACBase "Base class for two-port AC components"
  extends TwoPortACVI(
    redeclare PowerGrids.Interfaces.TerminalAC_a terminalAC_a(
      final computePF = computePF,
      v(re(start = portA.vStart.re), im(start = portA.vStart.im)),
      i(re(start = portA.iStart.re), im(start = portA.iStart.im)),
      terminalACPF(v = vPF_a, i = iPF_a)),
    redeclare PowerGrids.Interfaces.TerminalAC_b terminalAC_b(
      final computePF = computePF,
      v(re(start = portB.vStart.re), im(start = portB.vStart.im)),
      i(re(start = portB.iStart.re), im(start = portB.iStart.im)),
      terminalACPF(v = vPF_b, i = iPF_b)),
    portA(final v = terminalAC_a.v, final i = terminalAC_a.i,
          final UNom = UNomA, final SNom = SNom,
          final portVariablesPhases = portVariablesPhases,
          final generatorConvention = false,
          final UStart = UStartA,
          final UPhaseStart = UPhaseStartA,
          final PStart = PStartA,
          final QStart = QStartA),
    portB(final v = terminalAC_b.v, final i = terminalAC_b.i,
          final UNom = UNomB, final SNom = SNom,
          final portVariablesPhases = portVariablesPhases,
          final generatorConvention = false,
          final UStart = UStartB,
          final UPhaseStart = UPhaseStartB,
          final PStart = PStartB,
          final QStart = QStartB));

  parameter Boolean showDataOnDiagramsPu = systemPowerGrids.showDataOnDiagramsPu "=true, P,Q,V and phase are shown on the diagrams in per-unit (it overrides the SI format" annotation(Dialog(tab = "Visualization"));
  parameter Boolean showDataOnDiagramsSI = systemPowerGrids.showDataOnDiagramsSI "=true, P,Q,V and phase are shown on the diagrams in kV, MW, Mvar" annotation(Dialog(tab = "Visualization"));
  parameter Integer dataOnDiagramDigits = systemPowerGrids.dataOnDiagramDigits "number of digits for data on diagrams" annotation(Dialog(tab = "Visualization"));
  parameter Boolean portVariablesPhases = systemPowerGrids.portVariablesPhases "Compute voltage and current phases for monitoring purposes only" annotation(Evaluate = true, Dialog(tab = "Visualization"));
  parameter Boolean computePowerBalance = true "Compute net balance of complex power entering the component" annotation(Dialog(tab = "Visualization"));
  parameter Types.ActivePower PStartA = if computePF then PStartAPF else SNom "Start value of active power flowing into port A" annotation(
    Dialog(tab = "Initialization", enable = not computePF));
  parameter Types.ReactivePower QStartA = if computePF then QStartAPF else 0 "Start value of reactive power flowing into port A" annotation(
    Dialog(tab = "Initialization", enable = not computePF));
  parameter Types.ActivePower PStartB = if computePF then PStartBPF else -SNom "Start value of active power flowing into port B" annotation(
    Dialog(tab = "Initialization", enable = not computePF));
  parameter Types.ReactivePower QStartB = if computePF then QStartBPF else 0 "Start value of reactive power flowing into port B" annotation(
    Dialog(tab = "Initialization", enable = not computePF));

  final parameter Types.Voltage UStartA(fixed = false) "Start value of phase-to-phase voltage phasor at port A, absolute value" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.Angle UPhaseStartA(fixed = false) "Start value of phase-to-phase voltage phasor at port A, phase angle" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.Voltage UStartB(fixed = false) "Start value of phase-to-phase voltage phasor at port B, absolute value" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.Angle UPhaseStartB(fixed = false) "Start value of phase-to-phase voltage phasor at port B, phase angle" annotation(
    Dialog(tab = "Initialization"));
  final parameter Boolean computePF = systemPowerGrids.computePF "= true, computes the start value with the embedded power flow" annotation(
    Evaluate = true);
  parameter Boolean hasSubPF = false "= true if the model contains a sub-network with its own embedded PF";

  final parameter Types.ActivePower PStartAPF(fixed = false) "Start value of active power flowing into the portA, computed by the embedded PF";
  final parameter Types.ReactivePower QStartAPF(fixed = false) "Start value of reactive power flowing into the portA, computed by the embedded PF";
  final parameter Types.ActivePower PStartBPF(fixed = false) "Start value of active power flowing into the portB, computed by the embedded PF";
  final parameter Types.ReactivePower QStartBPF(fixed = false) "Start value of reactive power flowing into the portB, computed by the embedded PF";

  Types.ComplexVoltage vPF_a "Phase-to-ground voltage phasor of embedded power flow model - portA";
  Types.ComplexCurrent iPF_a "Line current phasor of embedded power flow model - portA";
  Types.ComplexVoltage vPF_b "Phase-to-ground voltage phasor of embedded power flow model - portB";
  Types.ComplexCurrent iPF_b "Line current phasor of embedded power flow model - PortB";

  replaceable TwoPortACPF componentPF if computePF and not hasSubPF "component to be used to compute the embedded PF";
  Types.ComplexPower Sbal = portA.S + portB.S if computePowerBalance "Complex power balance";
  outer Electrical.System systemPowerGrids "Reference to system object";
initial equation
  UStartA = terminalAC_a.UStart;
  UPhaseStartA = terminalAC_a.UPhaseStart;
  UStartB = terminalAC_b.UStart;
  UPhaseStartB = terminalAC_b.UPhaseStart;
  
  if computePF then
    // set values of initialization parameters based on EPF solution
    PStartAPF = 3*CM.real(vPF_a*CM.conj(iPF_a));
    QStartAPF = 3*CM.imag(vPF_a*CM.conj(iPF_a));
    PStartBPF = 3*CM.real(vPF_b*CM.conj(iPF_b));
    QStartBPF = 3*CM.imag(vPF_b*CM.conj(iPF_b));
  else
    // set dummy values (not used)
    PStartAPF = 0;
    QStartAPF = 0;
    PStartBPF = 0;
    QStartBPF = 0;
  end if; 
  
equation
  if not computePF then
     vPF_a = Complex(0) "Dummy value";
     iPF_a = Complex(0) "Dummy value";
     vPF_b = Complex(0) "Dummy value";
     iPF_b = Complex(0) "Dummy value";
  end if;
  connect(terminalAC_a.terminalACPF, componentPF.terminalAC_a);
  connect(terminalAC_b.terminalACPF, componentPF.terminalAC_b);
  annotation (
    Documentation(info = "<html><head></head><body><p>This is the base class for all the components with two AC terminals. It contains two corresponding <code>PortAC</code> components to compute useful quantities for modelling and monitoring purposes.</p>
    </body></html>"),
     Icon(graphics={  
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-100,-30},
        extent={{-76,15},{76,-15}},
        textColor = {238,46,47},
        textString = DynamicSelect("P", if (portA.P>=0) and showDataOnDiagramsPu then String(portA.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.P>=0) and showDataOnDiagramsSI then String(portA.P/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.P>=0) then ""
                                        elseif (portA.P<0) and showDataOnDiagramsPu then String(portA.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.P<0) and showDataOnDiagramsSI then String(portA.P/1e6, significantDigits=dataOnDiagramDigits)
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-100,-58},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if (portA.Q>=0) and showDataOnDiagramsPu then String(portA.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.Q>=0) and showDataOnDiagramsSI then String(portA.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.Q>=0) then ""
                                        elseif (portA.Q<0) and showDataOnDiagramsPu then String(portA.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.Q<0) and showDataOnDiagramsSI then String(portA.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={100,-30},
        extent={{-76,15},{76,-15}},
        textColor = {238,46,47},
        textString = DynamicSelect("P", if (portB.P>=0) and showDataOnDiagramsPu then String(portB.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.P>=0) and showDataOnDiagramsSI then String(portB.P/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.P>=0) then ""
                                        elseif (portB.P<0) and showDataOnDiagramsPu then String(portB.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.P<0) and showDataOnDiagramsSI then String(portB.P/1e6, significantDigits=dataOnDiagramDigits)
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={100,-58},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if (portB.Q>=0) and showDataOnDiagramsPu then String(portB.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.Q>=0) and showDataOnDiagramsSI then String(portB.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.Q>=0) then ""
                                        elseif (portB.Q<0) and showDataOnDiagramsPu then String(portB.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.Q<0) and showDataOnDiagramsSI then String(portB.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        else ""))}));
end TwoPortACBase;
