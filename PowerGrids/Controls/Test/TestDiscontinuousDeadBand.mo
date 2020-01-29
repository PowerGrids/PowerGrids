within PowerGrids.Controls.Test;
model TestDiscontinuousDeadBand
  extends Modelica.Icons.Example;
  PowerGrids.Controls.DiscontinuousDeadBand discontinuousDeadBand(uMax = 1)   annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression inputSignal(y = time - 2)  annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression discontinuousDeadBandAnalyticSolution(y = if time < 1 then time - 2 else if time < 3 then 0 else time - 2)  annotation(
    Placement(visible = true, transformation(origin = {72, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(inputSignal.y, discontinuousDeadBand.u) annotation(
    Line(points = {{-49, 0}, {-24, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StopTime = 4, Interval = 0.05),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model demonstrates the correct behaviour of the discontinuous dead-band, by comparing the output with the analytic solution</span><span style=\"font-size: 12px;\">.</span></body></html>"));
end TestDiscontinuousDeadBand;
