within PowerGrids.Electrical.Test;

model OneBusVariableVoltageOneLoadBreaker
  extends Modelica.Icons.Example;
  inner System systemPowerGrids(showDataOnDiagramsPu = false, showDataOnDiagramsSI = true)  annotation(
    Placement(transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}})));
  Buses.InfiniteBus InfBus annotation(
    Placement(transformation(origin = {0, 12}, extent = {{-10, -10}, {10, 10}})));
  Loads.LoadPQVoltageDependenceWithBreaker Load1(useBreaker = true, UNom = 2e4, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8)  annotation(
    Placement(transformation(origin = {0, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  Modelica.Blocks.Sources.BooleanExpression BreakerStatus(y = time < 1 or time > 2) annotation(
    Placement(transformation(origin = {-46, 22}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependenceWithBreaker Load2(PRefConst = 1e8, QRefConst = 5e7, SNom = 5e8, UNom = 2e4, useBreaker = true, breakerStatusStart = false) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Not not2 annotation(
    Placement(transformation(origin = {-18, -2}, extent = {{-4, -4}, {4, 4}})));
equation
  connect(BreakerStatus.y, Load1.breakerStatusIn) annotation(
    Line(points = {{-35, 22}, {-1, 22}}, color = {255, 0, 255}));
  connect(not2.y, Load2.breakerStatusIn) annotation(
    Line(points = {{-14, -2}, {-1, -2}}, color = {255, 0, 255}));
  connect(BreakerStatus.y, not2.u) annotation(
    Line(points = {{-35, 22}, {-29, 22}, {-29, -2}, {-23, -2}}, color = {255, 0, 255}));
  connect(Load1.terminalAC, InfBus.terminalAC) annotation(
    Line(points = {{0, 20}, {0, 12}}));
  connect(InfBus.terminalAC, Load2.terminalAC) annotation(
    Line(points = {{0, 12}, {0, 0}}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StopTime = 3.0, Interval = 0.01),
  Diagram(coordinateSystem(extent = {{-60, 60}, {60, -20}})));


end OneBusVariableVoltageOneLoadBreaker;