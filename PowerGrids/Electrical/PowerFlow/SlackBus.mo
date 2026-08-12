within PowerGrids.Electrical.PowerFlow;

model SlackBus "Slack Bus"
  extends Icons.BusPQ(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase, PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends BaseClasses.OnePortACPF(final isSlackBus = true);
  parameter Types.Voltage U = UNom "Voltage magnitude, phase-to-phase";
  parameter Types.Angle UPhase = 0 "Phase of voltage phasor";
  parameter Boolean setVoltage = true "= true, if the initial voltage and phase has to be set, if false then a voltage reference must be placed on another bus";
  parameter Boolean setPhaseOnly = false "= true, if setVoltage = true and only the initial voltage phase has to be set";
  final parameter Types.ComplexPerUnit nStart = CM.fromPolar(1, UPhase) "Unit phasor with angle UPhaseStart";
  Types.ActivePower PSlack "slack active power leaving system through bus";
  Types.ReactivePower QSlack "slack reactive power leaving system through bus";

equation
  // NOTE: if the flag setVoltage is set to false then the reference voltage and phase to the network
  // MUST be set by using the VoltageReferenceBusPF connected to another bus.
  // For this reason if the flag setVoltage is set to false this component cannot be balanced,
  // it has two fewer equations than variables.

  if setVoltage then
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
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {82, 42}, extent = {{-26, 20}, {34, -40}}, textString = DynamicSelect("RS", if setVoltage then "RS" else "S"))}),
    Documentation(info = "<html>
<p>Slack bus: prescribes voltage magnitude and phase (default zero).</p>
<p>Exactly one slack bus is required in each interconnected AC system. If the system is isolated, the active and reactive power flows <code>port.P</code> and <code>port.Q</code> should be small, ideally zero; they are not if the system is not balanced in terms of active and reactive power production and consumption.</p>
</html>"));

end SlackBus;