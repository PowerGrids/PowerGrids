within PowerGrids.Electrical.Test;
model TestExciterRectifierRegulationCharacteristicIEEE
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Controls.ExcitationSystems.BaseClasses.ExciterRectifierRegulationCharacteristicEquationsIEEE exciterRectifierRegulationCharacteristicIEEE annotation(
    Placement(visible = true, transformation(origin = {0, 1.77636e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression(y = time)  annotation(
    Placement(visible = true, transformation(origin = {-54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(realExpression.y, exciterRectifierRegulationCharacteristicIEEE.u) annotation(
    Line(points = {{-42, 0}, {-24, 0}, {-24, 0}, {-24, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.004),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TestExciterRectifierRegulationCharacteristicIEEE;
