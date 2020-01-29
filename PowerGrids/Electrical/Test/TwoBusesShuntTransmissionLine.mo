within PowerGrids.Electrical.Test;

model TwoBusesShuntTransmissionLine
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBusA(SNom = 1e+07, UNom = 10000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {-54, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance transmissionLine(B = 0.01, G = 0.01, R = 1e8, SNom = 1e+07, UNom = 10000, X = 0, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBusB(SNom = 1e+07, UNom = 10000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
equation
  connect(infiniteBusA.terminal, transmissionLine.terminalA) annotation(
    Line(points = {{-40, 0}, {-10, 0}}));
  connect(transmissionLine.terminalB, infiniteBusB.terminal) annotation(
    Line(points = {{10, 0}, {40, 0}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p>This model demonstrates the effect of the shunt admittance of the transmission line, connected to two infinite buses, with phase-to-phase voltage U = 10 kV and 30 deg phase. The line resistance is very high, so there is practically no current flowing through. The shunt admittance and susceptance are both 0.01 Ohm.</p>
<p>As a consequence, the two currents flowing into the line from each port are rotated by 45 deg with respect to the 30 deg voltage angle. The active power on each side is 0.5 MW and the reactive power is -0.5 MVA, which correspond to 0.05 and -0.05 pu with the chosen base quantities.</p>
</body></html>"));
end TwoBusesShuntTransmissionLine;
