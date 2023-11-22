within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model SimpleGrid
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {38, 60}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.SimpleGenerator GEN(SNom = 5e+08, UNom = 21000, PPF = -475000000, PNom = 5e8, H = 10) annotation(
    Placement(transformation(origin = {-74, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.LoadPQ GRIDL(PStart = 4.75e8, QStart = 0, SNom = 5e+08, UNom = 21000) annotation(
    Placement(transformation(origin = {10, -22}, extent = {{-10, -10}, {10, 10}})));
  Components.TransmissionLine line(UNom = 21000, R = 1, X = 0.1) annotation(
    Placement(transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.Bus bus(UNom = 21000) annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Electrical.Buses.ReferenceBus referenceBus(UNom = 21000, SNom = 500000000) annotation(
    Placement(transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Pm(y = 475e6) annotation(
    Placement(transformation(origin = {-116, -34}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(transformation(origin = {-38, -56}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step P(height = 20e6, offset = 475e6, startTime = 1) annotation(
    Placement(transformation(origin = {-36, -26}, extent = {{-8, -8}, {8, 8}})));
equation
  connect(GEN.terminalAC, bus.terminalAC) annotation(
    Line(points = {{-74, 0}, {-60, 0}}));
  connect(bus.terminalAC, line.terminalAC_a) annotation(
    Line(points = {{-60, 0}, {-40, 0}}));
  connect(line.terminalAC_b, referenceBus.terminalAC) annotation(
    Line(points = {{-20, 0}, {10, 0}, {10, 20}}));
  connect(GRIDL.terminalAC, referenceBus.terminalAC) annotation(
    Line(points = {{10, -22}, {10, 20}}));
  connect(Pm.y, GEN.Pm) annotation(
    Line(points = {{-104, -34}, {-80, -34}, {-80, -6}}, color = {0, 0, 127}));
  connect(zero.y, GRIDL.Q) annotation(
    Line(points = {{-26, -56}, {-16, -56}, {-16, -32}, {0, -32}}, color = {0, 0, 127}));
  connect(P.y, GRIDL.P) annotation(
    Line(points = {{-28, -26}, {0, -26}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 80}, {60, -80}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls = "kinsol", lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end SimpleGrid;
