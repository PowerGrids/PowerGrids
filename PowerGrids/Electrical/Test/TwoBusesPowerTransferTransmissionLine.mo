within PowerGrids.Electrical.Test;

model TwoBusesPowerTransferTransmissionLine
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBusA(SNom = 1e+08, UNom = 10000, portVariablesPhases = true, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance transmissionLine(R = 0, SNom = 1e+08, UNom = 10000, X = 1, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBusB(SNom = 1e+08, UNom = 10000, portVariablesPhases = true, portVariablesPu = true, theta = 0) annotation(
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
    Documentation(info = "<html><head></head><body><p>This model demonstrates the transmission of active power through a purely inductive transmission line, connected to two infinite buses with a phase-to-phase voltage of 10 kV. The generator at portA of the line has 30 deg phase, the other one has 0 deg phase. The reactance of each conductor is 1 Ohm.</p><p>The active power flow from portA to portB is</p><p>P = 3(VA*VB)/X*sin(delta)= UA*UB/X*sin(delta) = 50 MW.</p><p>By choosing a base power of 100 MW and a base voltage of 10 kV, the active power flow from portA to portB is 0.5 p.u.</p>
</body></html>"));
end TwoBusesPowerTransferTransmissionLine;
