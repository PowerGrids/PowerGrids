within PowerGrids.Electrical.PowerFlow;

model SlackBus "Slack Bus"
  extends Icons.BusPQ(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase, PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends BaseClasses.OnePortACPF(final isSlackBus = true);
  parameter Types.Voltage U = UNom "Voltage magnitude, phase-to-phase";
  parameter Types.Angle UPhase = 0 "Phase of voltage phasor";
  parameter Boolean setPhase = true "= true, if the initial phase has to be set, if false then a phase reference must be placed on another bus";
  parameter Boolean setPhaseOnly = false "= true, if setPhase = true and only the initial phase has to be set";
  final parameter Types.ComplexPerUnit nStart = CM.fromPolar(1, UPhase) "Unit phasor with angle UPhaseStart";
  Types.ActivePower PSlack "slack active power leaving system through bus";
  Types.ReactivePower QSlack "slack reactive power leaving system through bus";

equation
  // NOTE: if the flag setPhase is set to false then the reference voltage and phase to the network
  // MUST be set by using the PhaseReferenceBusPF connected to another bus.
  // For this reason if the flag setPhase is set to false this component cannot be balanced,
  // it has two fewer equations than variables.

  if setPhase then
    if not setPhaseOnly then
      port.u = CM.fromPolar(U, UPhase) "Set initial bus voltage, phase-to-phase";
    else
      port.u.re*nStart.im = port.u.im*nStart.re "port.u has the same phase as nStart";
      QSlack = 0 "No reactive power leaving system through bus";
    end if;
  end if;

  port.P = PSlack;
  port.Q = QSlack;

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {82, 42}, extent = {{-26, 20}, {34, -40}}, textString = DynamicSelect("RS", if setPhase then "RS" else "S"))}),
    Documentation(info = "<html>
<body>
<p>Slack bus: prescribes voltage magnitude and phase (default zero).</p>
<p>Exactly one slack bus is required in the power-flow of each interconnected AC system. If the system is isolated, the active and reactive power flows <code>port.P</code> and <code>port.Q</code> should be small, ideally zero; they are not if the system is not balanced in terms of active and reactive power production and consumption.</p>
<p>Generally the slack bus prescribes also the reference angle but in some cases (for example if the slack is connected to a generator node) the reference angle shall be moved to another node, possibly to the same node wich prescribes the reference angle in the dynamic model. This can be achieved by setting the flag <code>setPhase = false</code> an by inserting a <a href=\"modelica://PowerGrids.Electrical.PowerFlow.PhaseReferenceBusPF\">PhaseReferenceBusPF</a> in the same place of the reference bus in the dynamic model.</p>

Note that if one node prescribes the angle and another node the <i>slack</i> power, both the PF components result unbalanced by two equations  (two equations more in the <a href=\"modelica://PowerGrids.Electrical.PowerFlow.PhaseReferenceBusPF\">PhaseReferenceBusPF</a> an two equations fewer in the <a href=\"modelica://PowerGrids.Electrical.PowerFlow.SlackBus\">SlackBus</a>) but the overall power-flow model is still balanced.
</p>
</body>
</html>"));

end SlackBus;