within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model SimpleGrid
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {38, 60}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.SimpleGenerator GEN(SNom = 5e+08, UNom = 21000, PPF = -475000000, PNom = 5e8, H = 10, rPu = 0.01) annotation(
    Placement(transformation(origin = {-74, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.LoadPQ GRIDL(PStart = 4.75e8, QStart = 0, SNom = 5e+08, UNom = 21000, PPF = 4.75e8) annotation(
    Placement(transformation(origin = {-14, -28}, extent = {{-10, -10}, {10, 10}})));
  Components.TransmissionLine line(UNom = 21000, R = 0.001, X = 0.01) annotation(
    Placement(transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.Bus bus(UNom = 21000) annotation(
    Placement(transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Electrical.Buses.InfiniteBus infiniteBus(UNom = 21000, SNom = 500000000) annotation(
    Placement(transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Pm(y = 475e6) annotation(
    Placement(transformation(origin = {-116, -34}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(transformation(origin = {-62, -62}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step P(height = 20e6, offset = 475e6, startTime = 1) annotation(
    Placement(transformation(origin = {-60, -32}, extent = {{-8, -8}, {8, 8}})));
equation
  connect(GEN.terminalAC, bus.terminalAC) annotation(
    Line(points = {{-74, 0}, {-38, 0}}));
  connect(bus.terminalAC, line.terminalAC_a) annotation(
    Line(points = {{-38, 0}, {12, 0}}));
  connect(line.terminalAC_b, infiniteBus.terminalAC) annotation(
    Line(points = {{32, 0}, {40, 0}, {40, 20}}));
  connect(Pm.y, GEN.Pm) annotation(
    Line(points = {{-104, -34}, {-80, -34}, {-80, -6}}, color = {0, 0, 127}));
  connect(zero.y, GRIDL.Q) annotation(
    Line(points = {{-51, -62}, {-41, -62}, {-41, -38}, {-25, -38}}, color = {0, 0, 127}));
  connect(P.y, GRIDL.P) annotation(
    Line(points = {{-51.2, -32}, {-23.2, -32}}, color = {0, 0, 127}));
  connect(bus.terminalAC, GRIDL.terminalAC) annotation(
    Line(points = {{-38, 0}, {-14, 0}, {-14, -28}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 80}, {60, -80}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls = "kinsol", lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end SimpleGrid;
