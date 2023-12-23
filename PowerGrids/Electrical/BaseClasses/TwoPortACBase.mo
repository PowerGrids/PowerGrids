within PowerGrids.Electrical.BaseClasses;

partial model TwoPortACBase "Base class for two-port AC components"
  extends TwoPortACVI(
    final isTwoPortAC = true,
    redeclare replaceable connector TerminalAC_a = PowerGrids.Interfaces.TerminalAC_a,
    redeclare replaceable connector TerminalAC_b = PowerGrids.Interfaces.TerminalAC_b,
    terminalAC_a(
      final computePF = computePF,
      terminalACPF(v = vPF_a, i = iPF_a)),
    terminalAC_b(
      final computePF = computePF,
      terminalACPF(v = vPF_b, i = iPF_b)));

  parameter Boolean hasSubPF = false "= true if the model contains a sub-network with its own embedded PF";

  replaceable BaseComponents.TwoPortACPFDummy componentPF if computePF and not hasSubPF constrainedby TwoPortACPF "component to be used to compute the embedded PF";

  Types.ComplexVoltage vPF_a "Phase-to-ground voltage phasor of embedded power flow model - portA";
  Types.ComplexCurrent iPF_a "Line current phasor of embedded power flow model - portA";
  Types.ComplexVoltage vPF_b "Phase-to-ground voltage phasor of embedded power flow model - portB";
  Types.ComplexCurrent iPF_b "Line current phasor of embedded power flow model - PortB";

  Types.ComplexPower Sbal = portA.S + portB.S if computePowerBalance "Complex power balance";
  outer Electrical.System systemPowerGrids "Reference to system object";
initial equation
  if computePF then
    // set values of initialization parameters based on EPF solution
    UStartAPF = CM.abs(vPF_a)*sqrt(3);
    UPhaseStartAPF = CM.arg(vPF_a);
    UStartBPF = CM.abs(vPF_b)*sqrt(3);
    UPhaseStartBPF = CM.arg(vPF_b);
    PStartAPF = 3*CM.real(vPF_a*CM.conj(iPF_a));
    QStartAPF = 3*CM.imag(vPF_a*CM.conj(iPF_a));
    PStartBPF = 3*CM.real(vPF_b*CM.conj(iPF_b));
    QStartBPF = 3*CM.imag(vPF_b*CM.conj(iPF_b));
  else
    // set dummy values (not used)
    UStartAPF = 0;
    UPhaseStartAPF = 0;
    UStartBPF = 0;
    UPhaseStartBPF = 0;
    PStartAPF = 0;
    QStartAPF = 0;
    PStartBPF = 0;
    QStartBPF = 0;
  end if; 
  
equation
  // The port voltages and currents are the same as their corresponding connectors'
  portA.v = terminalAC_a.v;
  portA.i = terminalAC_a.i;
  portB.v = terminalAC_b.v;
  portB.i = terminalAC_b.i;

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
        textString = DynamicSelect("P", if showDataOnDiagramsPu then String(portA.PPu, format = "6.3f")
                                        elseif showDataOnDiagramsSI then String(portA.P/1e6, format = "9.3f")
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-100,-64},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if showDataOnDiagramsPu then String(portA.QPu, format = "6.3f")
                                        elseif showDataOnDiagramsSI then String(portA.Q/1e6, format = "9.3f")
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={100,-30},
        extent={{-76,15},{76,-15}},
        textColor = {238,46,47},
        textString = DynamicSelect("P", if showDataOnDiagramsPu then String(portB.PPu, format = "6.3f")
                                        elseif showDataOnDiagramsSI then String(portB.P/1e6, format = "9.3f")
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={100,-64},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if showDataOnDiagramsPu then String(portB.QPu, format = "6.3f")
                                        elseif showDataOnDiagramsSI then String(portB.Q/1e6, format = "9.3f")
                                        else ""))}));
end TwoPortACBase;
