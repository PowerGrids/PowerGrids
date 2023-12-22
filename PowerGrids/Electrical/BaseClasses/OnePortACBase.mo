within PowerGrids.Electrical.BaseClasses;

partial model OnePortACBase "Base class for AC components with one port"
  import PowerGrids.Types.Choices.LocalInitializationOption;
  extends OnePortACVI(
    final isOnePortAC = true,
    redeclare replaceable connector TerminalAC = PowerGrids.Interfaces.TerminalACBase,
    terminalAC(
      final computePF = computePF,
      terminalACPF(v = vPF, i = iPF)));
  parameter LocalInitializationOption localInit = LocalInitializationOption.none "Initialize the component locally in steady state from port start values" annotation(
    Evaluate = true, Dialog(tab = "Initialization"));
  parameter Boolean hasSubPF = false "= true, if the model contains a sub-network with its own embedded PF; set to final in usable components" annotation(Evaluate = true);

  replaceable BaseComponents.OnePortACPFDummy componentPF if computePF and not hasSubPF constrainedby OnePortACPF "component to be used to compute the embedded PF" ;

  Types.ComplexVoltage vPF "Phase-to-ground voltage phasor of embedded power flow model";
  Types.ComplexCurrent iPF "Line current phasor of embedded power flow model";

initial equation
  if computePF then
    // set default values for PStart and QStart based on embedded power flow solution
    UStartPF = CM.abs(vPF)*sqrt(3);
    UPhaseStartPF = CM.arg(vPF);
    PStartPF = 3*CM.real(vPF*CM.conj(iPF));
    QStartPF = 3*CM.imag(vPF*CM.conj(iPF));
  else
    // set dummy values for PStartPF and QStartPF which  (not used)
    UStartPF = 0;
    UPhaseStartPF = 0;
    PStartPF = 0;
    QStartPF = 0;
  end if;  
  
equation
  // Connect the terminalACPF sub-connector to the terminalAC connector of the 
  // embedded power flow component (if activated)
  connect(terminalAC.terminalACPF, componentPF.terminalAC);
 
  // Set appropriate relationships between connector and port voltage and currents
  // based on the selected initializatio option 
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
    // In all other cases, the port voltage and current are identically equal to
    // the connector voltage and current
    port.v = terminalAC.v;
    port.i = terminalAC.i;
  end if;

  // if the embedded power flow is not computed, set unused vPF and iPF to dummy values
  if not computePF then
    vPF = Complex(0) "Dummy value";
    iPF = Complex(0) "Dummy value";
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
        textString = DynamicSelect("P", if showDataOnDiagramsPu then String(port.PPu, format = "6.3f")
                                        elseif showDataOnDiagramsSI then String(port.P/1e6, format = "9.3f")
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={0,-179},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if showDataOnDiagramsPu then String(port.QPu, format = "6.3f")
                                        elseif showDataOnDiagramsSI then String(port.Q/1e6, format = "9.3f")
                                        else ""))}));
end OnePortACBase;
