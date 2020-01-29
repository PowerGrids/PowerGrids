within PowerGrids.Electrical.Test;

model TwoBusesResistiveTransmissionLineFault
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBusA(SNom = 1e+07, UNom = 10000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedanceFault transmissionLine(R = 1, RFault = 0.3, SNom = 1e+07, UNom = 10000, X = 0, XFault = 0, faultLocationPu = 0.7, portVariablesPhases = true, portVariablesPu = true, startTime = 0.4, stopTime = 0.6) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBusB(SNom = 1e+07, UNom = 9000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {38, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
equation
  connect(infiniteBusA.terminal, transmissionLine.terminalA) annotation(
    Line(points = {{-40, 0}, {-10, 0}}));
  connect(transmissionLine.terminalB, infiniteBusB.terminal) annotation(
    Line(points = {{10, 0}, {38, 0}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p>This model demonstrates the behaviour of a purely resistive transmission line with a purely resistive intermediate fault.</p>
<p>At the beginning of the transient, a current flows from bus A (phase to phase voltage 10 kV) to bus B (phase-to-phase voltage 9 kV) through a resistance of 1 Ohm.</p>
<p>As a consequence, the current flowing in each conductor is</p>
<p>I = (VA - VB)/R = ((UA-UB)/sqrt3)/R = 577.35 A.</p>
<p>When the fault is activated, the analytical computation of the current flowing into the fault yields a current of 10.5215 kA, which corresponds to the simulation result.</p>
<p>At time = 0.6 the fault is cleared and the current through the line returns to the original value.</p>
</body></html>"));
end TwoBusesResistiveTransmissionLineFault;
