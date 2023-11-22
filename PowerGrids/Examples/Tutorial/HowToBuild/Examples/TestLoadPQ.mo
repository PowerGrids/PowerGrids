within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model TestLoadPQ
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {22, 44}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.LoadPQ LOAD1(PStart = 1e6, QStart = 0, SNom = 1e6, UNom = 1000) annotation(
    Placement(transformation(origin = {-72, -12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(transformation(origin = {-106, -36}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.InfiniteBus BUSINF(UNom = 1000, SNom = 1e6)  annotation(
    Placement(transformation(origin = {-44, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression P(y = 1e6)  annotation(
    Placement(transformation(origin = {-106, -16}, extent = {{-10, -10}, {10, 10}})));
  Components.LoadPQ LOAD2(UNom = 1000, SNom = 1e6, PStart = 0, QStart = 1e6)  annotation(
    Placement(transformation(origin = {-10, -12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression Q(y = 1e6)  annotation(
    Placement(transformation(origin = {-44, -36}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(zero.y, LOAD1.Q) annotation(
    Line(points = {{-95, -36}, {-89, -36}, {-89, -22}, {-82, -22}}, color = {0, 0, 127}));
  connect(BUSINF.terminalAC, LOAD1.terminalAC) annotation(
    Line(points = {{-44, 20}, {-44, 3}, {-72, 3}, {-72, -12}}));
  connect(P.y, LOAD1.P) annotation(
    Line(points = {{-95, -16}, {-82, -16}}, color = {0, 0, 127}));
  connect(BUSINF.terminalAC, LOAD2.terminalAC) annotation(
    Line(points = {{-44, 20}, {-44, 3}, {-10, 3}, {-10, -12}}));
  connect(Q.y, LOAD2.Q) annotation(
    Line(points = {{-33, -36}, {-28, -36}, {-28, -22}, {-20, -22}}, color = {0, 0, 127}));
  connect(zero.y, LOAD2.P) annotation(
    Line(points = {{-94, -36}, {-60, -36}, {-60, -16}, {-20, -16}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-120, 60}, {40, -60}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls = "kinsol", lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end TestLoadPQ;
