within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model TestSimpleGenerator
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(computePF = false)  annotation(
    Placement(transformation(origin = {6, 26}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.SimpleGenerator GEN(SNom = 5e+08, UNom = 21000, PPF (displayUnit = "W")= 0, PNom = 5e8, H = 10, rPu = 0.01, thetaStart = 1.5707963267948966, PStart = 0, QStart = 0) annotation(
    Placement(transformation(origin = {-40, -6}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Blocks.Sources.Step Pm(height = 50e6, offset = 0, startTime = 1) annotation(
    Placement(transformation(origin = {-68, 0}, extent = {{-8, -8}, {8, 8}})));
  Electrical.Buses.ReferenceBus bus(UNom = 21000, SNom = 5e8, UStart = 21000, UPhaseStart = 0, PStart = 0, QStart = 0)  annotation(
    Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(Pm.y, GEN.Pm) annotation(
    Line(points = {{-59, 0}, {-46.5, 0}}, color = {0, 0, 127}));
  connect(GEN.terminalAC, bus.terminalAC) annotation(
    Line(points = {{-40, -6}, {-40, -20}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, 40}, {20, -60}})),
    experiment(StartTime = 0, StopTime = 12, Tolerance = 1e-06, Interval = 0.024),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end TestSimpleGenerator;
