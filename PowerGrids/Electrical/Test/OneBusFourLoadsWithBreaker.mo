within PowerGrids.Electrical.Test;

model OneBusFourLoadsWithBreaker
  extends Modelica.Icons.Example;
  inner System systemPowerGrids(showDataOnDiagramsPu = false, showDataOnDiagramsSI = true)  annotation(
    Placement(transformation(origin = {60, 60}, extent = {{-10, -10}, {10, 10}})));
  Buses.InfiniteBus InfBus(UNom = 2e4, SNom = 5e8)  annotation(
    Placement(transformation(origin = {0, 12}, extent = {{-10, -10}, {10, 10}})));
  Loads.LoadPQVoltageDependenceWithBreaker LoadPQ1(useBreaker = true, UNom = 2e4, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8, alpha = 1.5, beta = 1.5)  annotation(
    Placement(transformation(origin = {0, 24}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Blocks.Sources.BooleanExpression BreakerStatus(y = time < 1 or time > 2) annotation(
    Placement(transformation(origin = {-46, 26}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependenceWithBreaker LoadPQ2(PRefConst = 1e8, QRefConst = 5e7, SNom = 5e8, UNom = 2e4, useBreaker = true, breakerStatusStart = false, alpha = 1.5, beta = 1.5) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Not not2 annotation(
    Placement(transformation(origin = {-20, -2}, extent = {{-4, -4}, {4, 4}})));
  Loads.LoadImpedancePQWhithBreaker LoadImp1(useBreaker = true, UNom = 2e4, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8)  annotation(
    Placement(transformation(origin = {30, 24}, extent = {{10, 10}, {-10, -10}})));
  Loads.LoadImpedancePQWhithBreaker LoadImp2(useBreaker = true, UNom = 2e4, SNom = 5e8, PRefConst = 1e8, QRefConst = 5e7, breakerStatusStart = false)  annotation(
    Placement(transformation(origin = {30, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(BreakerStatus.y, LoadPQ1.breakerStatusIn) annotation(
    Line(points = {{-35, 26}, {-1, 26}}, color = {255, 0, 255}));
  connect(not2.y, LoadPQ2.breakerStatusIn) annotation(
    Line(points = {{-16, -2}, {-1, -2}}, color = {255, 0, 255}));
  connect(LoadPQ1.terminalAC, InfBus.terminalAC) annotation(
    Line(points = {{0, 24}, {0, 12}}));
  connect(InfBus.terminalAC, LoadPQ2.terminalAC) annotation(
    Line(points = {{0, 12}, {0, 0}}));
  connect(InfBus.terminalAC, LoadImp1.terminalAC) annotation(
    Line(points = {{0, 12}, {0, 18}, {30, 18}, {30, 24}}));
  connect(InfBus.terminalAC, LoadImp2.terminalAC) annotation(
    Line(points = {{0, 12}, {0, 6}, {30, 6}, {30, 0}}));
  connect(BreakerStatus.y, not2.u) annotation(
    Line(points = {{-34, 26}, {-30, 26}, {-30, -2}, {-25, -2}}, color = {255, 0, 255}));
  connect(BreakerStatus.y, LoadImp1.breakerStatusIn) annotation(
    Line(points = {{-34, 26}, {-30, 26}, {-30, 48}, {40, 48}, {40, 26}, {32, 26}}, color = {255, 0, 255}));
  connect(not2.y, LoadImp2.breakerStatusIn) annotation(
    Line(points = {{-16, -2}, {-10, -2}, {-10, -26}, {40, -26}, {40, -2}, {32, -2}}, color = {255, 0, 255}));

  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StopTime = 3.0, Interval = 0.01),
    Documentation(info = "<html>
<body>
<p>This example is used to test the models <a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependenceWithBreaker\">LoadPQVoltageDependenceWithBreaker</a> and <a href=\"modelica://PowerGrids.Electrical.Loads.LoadImpedancePQWhithBreaker\">LoadImpedancePQWhithBreaker</a>.<br>
The <code>LoadPQ1</code> and the <code>LoadPQ2</code> are of the <code>LoadPQVoltageDependenceWithBreaker</code> type, while the <code>LoadImp1</code> and the <code>LoadImp2</code> are of the <code>LoadImpedancePQWhithBreaker</code> type.</p>
<p>The tested scenario is the following:</p>
<ul>
<li>The <code>LoadPQ1</code> and <code>LoadImp1</code> are of 200 MW and 100 MVAR each, theirs breakers start closed, are open at time=1s and then closed again at time=2s.</li>
<li>The <code>LoadPQ2</code> and <code>LoadImp2</code> are of 100 MW and 50 MVAR each, theirs breakers start open, are closed at time=1s and then open again at time=2s.</li>
</body>    
 </html>"),
  Diagram(coordinateSystem(extent = {{-60, 80}, {80, -40}})));
end OneBusFourLoadsWithBreaker;