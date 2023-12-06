within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model SimpleGrid
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.SimpleGenerator GEN(SNom = 5e+08, UNom = 21000, PPF = -475000000, PNom = 5e8, H = 10, rPu = 0.01) annotation(
    Placement(transformation(origin = {-74, -12}, extent = {{-10, -10}, {10, 10}}, rotation = -0)));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.LoadPQ GRIDL(SNom = 5e+08, UNom = 21000, PPF = 4.75e8) annotation(
    Placement(transformation(origin = {-10, -28}, extent = {{-10, -10}, {10, 10}})));
  Components.TransmissionLine line(UNom = 21000, R = 0.01, X = 0.1) annotation(
    Placement(transformation(origin = {16, 0}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.Bus bus(UNom = 21000) annotation(
    Placement(transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Electrical.Buses.InfiniteBus infiniteBus(UNom = 21000, SNom = 500000000) annotation(
    Placement(transformation(origin = {36, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Pm(y = 475e6) annotation(
    Placement(transformation(origin = {-98, -18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(transformation(origin = {-48, -58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step P(height = 20e6, offset = 475e6, startTime = 1) annotation(
    Placement(transformation(origin = {-48, -32}, extent = {{-8, -8}, {8, 8}})));
equation
  connect(bus.terminalAC, line.terminalAC_a) annotation(
    Line(points = {{-38, 0}, {6, 0}}));
  connect(line.terminalAC_b, infiniteBus.terminalAC) annotation(
    Line(points = {{26, 0}, {36, 0}, {36, 20}}));
  connect(Pm.y, GEN.Pm) annotation(
    Line(points = {{-87, -18}, {-80.5, -18}}, color = {0, 0, 127}));
  connect(zero.y, GRIDL.Q) annotation(
    Line(points = {{-37, -58}, {-29, -58}, {-29, -38}, {-20, -38}}, color = {0, 0, 127}));
  connect(P.y, GRIDL.P) annotation(
    Line(points = {{-39, -32}, {-20, -32}}, color = {0, 0, 127}));
  connect(bus.terminalAC, GRIDL.terminalAC) annotation(
    Line(points = {{-38, 0}, {-10, 0}, {-10, -28}}));
  connect(GEN.terminalAC, bus.terminalAC) annotation(
    Line(points = {{-74, -12}, {-74, 0}, {-38, 0}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-120, 60}, {60, -80}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end SimpleGrid;
