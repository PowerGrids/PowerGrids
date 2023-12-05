within PowerGrids.Examples.ENTSOE;

model PowerFlow
  extends Modelica.Icons.Example;
  inner Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.PVBus GEN(UNom = 21000, SNom = 500000000, P = -475000000)  annotation(
    Placement(transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.BusPF NTLV(UNom = 21000)  annotation(
    Placement(transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Electrical.PowerFlow.TransformerFixedRatioPF TGEN(UNomA = 21000, UNomB = 419000, SNom = 500000000, rFixed = 419/21, R = 0.15e-2*419^2/500, X = 16e-2*419^2/500)  annotation(
    Placement(transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}})));
  Electrical.PowerFlow.SlackBus GRID(UNom = 380000, SNom = 500000000, U = 1.05*380e3)  annotation(
    Placement(transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}})));
  Electrical.PowerFlow.PQBus GRIDL(UNom = 380000, SNom = 500000000, P = 475000000, Q = 76000000)  annotation(
    Placement(transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}})));equation
  connect(GEN.terminalAC, NTLV.terminalAC) annotation(
    Line(points = {{-30, 0}, {-30, -20}, {0, -20}}));
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation(
    Line(points = {{0, -20}, {10, -20}}));
  connect(TGEN.terminalAC_b, GRID.terminalAC) annotation(
    Line(points = {{30, -20}, {50, -20}, {50, 0}}));
  connect(GRIDL.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{50, -30}, {50, 0}}));
annotation(
    Diagram(coordinateSystem(extent = {{-40, 60}, {80, -60}})));
end PowerFlow;
