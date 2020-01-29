within PowerGrids.Electrical.Buses;

model ReferenceBus "Reference bus for an isolated grid"
  extends PowerGrids.Electrical.BaseClasses.OnePortAC;
  extends Icons.Bus;
  import PowerGrids.Types.Choices.InitializationOption;
  parameter InitializationOption initOpt = systemPowerGrids.initOpt "Initialization option";
  parameter Types.Voltage UStart = UNom "Initial voltage magnitude, phase-to-phase";
  parameter Types.Angle thetaStart = 0 "Initial phase of voltage phasor";
  final parameter Types.ActivePower PSlack(fixed = false) "Constant slack active power leaving system through bus";
  final parameter Types.ReactivePower QSlack(fixed = false) "Constant slack reactive power leaving system through bus";
initial equation
// Set the initial voltage angle to zero
  port.u = CM.fromPolar(UStart, thetaStart) "Initial bus voltage, phase-to-ground";
equation
  port.P = PSlack;
  port.Q = QSlack;
  annotation(
    Documentation(info = "<html><head></head><body><p>When an isolated synchronous grid is initialized in steady state, the reference angle remains undefined. In order to make the angles well defined, this ReferenceBus component should be used in the position where the power flow problem has the slack node.</p>
<p>The purpose of this component when the grid is initialized in steady state is twofold:
</p><ul>
<li>Set the initial voltage of the node to the same value as in the power flow model</li>
<li>Absorb the excess active power <code>PSlack</code> and reactive power <code>QSlack</code> that allow to balance the power flows at the nominal value of frequency. These two values correspond to the active and reactive power flows into the slack node of the power flow model. <code>PSlack</code> and <code>QSlack</code> then remain constant throughout the simulation. If the power flow is correcty balanced, those two values are nearly zero, so the Reference Bus is not absorbing any significant active or reactive power during the simulation.</li>
</ul>
<p></p>
<p>When the grid is not initialized in steady state, the ReferenceBus absorbs zero complex power, and thus behaves as a regular Bus component.</p>
</body></html>"),
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {130, 10}, extent = {{-30, 20}, {30, -40}}, textString = "R")}));
end ReferenceBus;
