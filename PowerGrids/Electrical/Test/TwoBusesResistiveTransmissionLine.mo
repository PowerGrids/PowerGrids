within PowerGrids.Electrical.Test;

model TwoBusesResistiveTransmissionLine
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBusA(SNom = 1e+07, UNom = 10000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance transmissionLine(R = 1, SNom = 1e+07, UNom = 10000, X = 0, portVariablesPhases = true, portVariablesPu = true) annotation(
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
    Documentation(info = "<html><head></head><body><p>This model demonstrates the dissipation of active power of a purely resistive transmission line, connected to two infinite buses, one with a phase-to-phase voltage U = 10 kV, one with a phase-to-phase voltage U = 9 kV, both with a 30 deg phase. The resistance of each conductor is 1 Ohm. </p>
<p>As a consequence, the current flowing in each conductor is</p>
<p>I = (VA - VB)/R = ((UA-UB)/sqrt3)/R = 577.35 A.</p>
<p>The reactive power flow in the line is zero. The active power entering the line from portA is</p>
<p>3*VA*I = UA*(UA - UB)/R = 10 MW</p>
<p>while the active power dissipated by the transmission line is</p>
<p>portA.P + portB.P = 3*(VA - VB)*I = (UA - UB)^2/R = 1 kW</p> 
<p>By choosing a base power of 10 MW and a base voltage of 10 kV, the current flowing through the line is 1 p.u., the active power entering portA of the line is 1 p.u. and the active power leaving portB of the line is 0.9 p.u. All currents and voltages have 30 deg phase.</p>
</body></html>"));
end TwoBusesResistiveTransmissionLine;
