within PowerGrids.Controls.Test;
model TestDeadBand
  extends Modelica.Icons.Example;
  PowerGrids.Controls.DeadBand deadBand(smoothed = false, uMax = 1)  annotation(
    Placement(visible = true, transformation(origin = {-20, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression inputSignal(y = time - 2)  annotation(
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression deadBandAnalyticSolution(
    y = -1 + time - (if time < 1 then 0 else time-1)+ (if time < 3 then 0 else time - 3)) annotation(
    Placement(visible = true, transformation(origin = {74, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(inputSignal.y, deadBand.u) annotation(
    Line(points = {{-56, 0}, {-44, 0}}, color = {0, 0, 127}));
  annotation(
    experiment(StopTime = 4, Interval = 0.05),
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model demonstrates the correct behaviour of the dead-band, by comparing the output with the analytic solution</span><span style=\"font-size: 12px;\">.</span></body></html>"));
end TestDeadBand;
