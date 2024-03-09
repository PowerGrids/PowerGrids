within PowerGrids.Electrical.Buses;

model ReferenceBus "Reference bus for an isolated grid"
  extends Icons.BusPQ(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase, PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare ComponentPF componentPF);

  replaceable model ComponentPF = PowerGrids.Electrical.PowerFlow.SlackBus(
    UNom = UNom,
    SNom = SNom,
    U = UPF,
    UPhase = UPhasePF,
    setPhaseOnly = setPhaseOnly)
  constrainedby PowerGrids.Electrical.BaseClasses.OnePortACPF
  annotation(choices(choice(redeclare replaceable model ComponentPF = PowerGrids.Electrical.PowerFlow.BusPF
                            "to be used if the slack bus is embedded in another component")));

  import PowerGrids.Types.Choices.InitializationOption;
  parameter Boolean setPhaseOnly = false "= true if only the initial voltage phase is to be set";
  parameter InitializationOption initOpt = systemPowerGrids.initOpt "Initialization option";
  parameter Types.Voltage UPF = UNom "Phase-to-phase voltage to be used to compute the embedded PF" annotation(
    Dialog(group = "Embedded PF", enable = computePF));
  parameter Types.Angle UPhasePF = 0 "Voltage phase to be used to compute the embedded PF" annotation(
    Dialog(group = "Embedded PF", enable = computePF));
  parameter Boolean forceSlackPowerToZero = false "=true, if PSlack and QSlack shall be forced to zero during the initialization"  annotation(
    Dialog(tab = "Initialization", enable = computePF));
  final parameter Types.ComplexPerUnit nStart = CM.fromPolar(1, UPhaseStart) "Unit phasor with angle UPhaseStart";
  final parameter Types.ActivePower PSlack(fixed = false) "Constant slack active power leaving system through bus";
  final parameter Types.ReactivePower QSlack(fixed = false) "Constant slack reactive power leaving system through bus";

  final Boolean isSlackBusPFicon = isSlackBusPF "isSlackBus state for dynamic visualisation on the icon";

protected
  Modelica.Blocks.Interfaces.BooleanInput isSlackBusPF "input to get the value of the isSlackBus flag from the PF component";
  
initial equation
  if not setPhaseOnly then
    port.u = CM.fromPolar(UStart, UPhaseStart) "Set initial bus voltage, phase-to-phase";
  else
    port.u.re*nStart.im = port.u.im*nStart.re "port.u has the same phase as nStart";
    QSlack = 0 "No reactive power leaving system through bus";
  end if;

  if forceSlackPowerToZero then
    PSlack=0;
    QSlack=0;
  end if;
  
  assert(abs(PSlack)/SNom < 0.01, "The active power flowing into or out of the reference bus is above 0.01 pu.\n"+
    "You probably need a better balancing of the active power generators in the system.\n" +
    "Please check the documentation of ReferenceBus for further reference", AssertionLevel.warning);
  assert(abs(QSlack)/SNom < 0.01, "The reactive power flowing into or out of the reference bus is above 0.01 pu.\n"+
    "You probably need a better setup of excitation voltages, or you can set setPhaseOnly = true on the reference bus.\n" +
    "Please check the documentation of ReferenceBus for further reference", AssertionLevel.warning);

equation
  port.P = PSlack;
  port.Q = QSlack;

  connect(isSlackBusPF, componentPF.isSlackBusOut);
  if not computePF then
    isSlackBusPF = false;
  end if;

  annotation(
    Documentation(info = "<html><head></head><body><p>When an isolated synchronous grid is initialized in steady state, the reference angle remains undefined. In order to make the angles well defined, this ReferenceBus component should be used in the position where the power flow problem has the slack node.</p>
<p>The purpose of this component when the grid is initialized in steady state is twofold:</p>
<ul>
<li>Set the initial voltage of the node to the same value as in the power flow model, i.e. with magnitude <code>UStart</code> and phase <code>UPhaseStart</code></li>
<li>Absorb the excess active power <code>PSlack</code> and reactive power <code>QSlack</code> that allow to balance the power flows at the nominal value of frequency. These two values correspond to the active and reactive power flows into the slack node of the power flow model. <code>PSlack</code> and <code>QSlack</code> then remain constant throughout the simulation. If the power flow is correcty balanced, those two values are nearly zero, so the Reference Bus is not absorbing any significant active or reactive power during the simulation.</li>
</ul>
<p>If <code>setPhaseOnly</code> is set to true, then only the initial phase of the bus voltage is set to the same value of the power flow, i.e., <code>UPhaseStart</code>. The initial voltage magnitude is computed to ensure zero reactive power flow <code>QSlack</code>.</p>
<p><b>Embedded Power Flow (EPF)</b>
<p>If the EPF is activated the refrence node uses the <a href=\"modelica://PowerGrids.Electrical.PowerFlow.SlackBus\">SlackBus</a> as default EPF component in order to fix both the voltage and the voltage phase at the reference node. The EPF component can be redeclared, the most common use of this feature is to move the slack node to another place, for example to the node of a strong generator, in this case the reference bus normally works as generic bus for the EPF calculation (proposed choice).</p>
<p>If the slack bus is moved to another node than two extra initial equatons can be activated, by set the flag <code>forceSlackPowerToZero</code> = <code>true</code>, in order to force to zero both the <code>PSlack</code> and <code>QSlack</code> values. This requires that two degree of freedom for the initialisation system are provided by other components, for example by adding two <a href=\"modelica://PowerGrids.Controls.FreeOffset\">free offset</a> in order to calculate some generators set points.</p>
<p>If the EPF component is redeclared then the user shall provide all the necessary parameters either by using the GUI or in textual form.</p>
</body></html>"),
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {60, 42}, extent = {{-40, 20}, {40, -40}}, horizontalAlignment = TextAlignment.Right, textString = DynamicSelect("R", if isSlackBusPFicon then "RS" else "R"))}));
end ReferenceBus;
