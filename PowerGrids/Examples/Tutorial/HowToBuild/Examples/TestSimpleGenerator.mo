within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model TestSimpleGenerator
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(computePF = false)  annotation(
    Placement(transformation(origin = {38, 60}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.SimpleGenerator GEN(SNom = 5e+08, UNom = 21000, PPF = -475000000, PNom = 5e8, H = 10) annotation(
    Placement(transformation(origin = {-44, 14}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Electrical.Buses.ReferenceBus referenceBus(UNom = 21000, SNom = 500000000) annotation(
    Placement(transformation(origin = {-30, 14}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Step P(height = 20e6, offset = 475e6, startTime = 1) annotation(
    Placement(transformation(origin = {-78, -14}, extent = {{-8, -8}, {8, 8}})));
equation
  connect(GEN.terminalAC, referenceBus.terminalAC) annotation(
    Line(points = {{-44, 14}, {-30, 14}}));
  connect(P.y, GEN.Pm) annotation(
    Line(points = {{-70, -14}, {-50, -14}, {-50, 8}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 80}, {60, -80}})),
    experiment(StartTime = 0, StopTime = 12, Tolerance = 1e-06, Interval = 0.024),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls = "kinsol", lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end TestSimpleGenerator;
