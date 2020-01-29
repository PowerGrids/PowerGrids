within PowerGrids.Controls.Test;
model TestLimiterWithLag
  extends Modelica.Icons.Example;
  PowerGrids.Controls.LimiterWithLag limiterWithLag(LagMax = 2, LagMin = 3, uMax = 0.7, uMin = 0.3)  annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid LfSignal(falling = 0.5, nperiod = 2, period = 10, rising = 0.5, width = 4)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid HfSignal(falling = 0.5, nperiod = 4, period = 4, rising = 0.5, startTime = 20, width = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sum sum(nin = 2)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(LfSignal.y, sum.u[1]) annotation(
    Line(points = {{-38, 0}, {-20, 0}, {-20, -20}, {-12, -20}}, color = {0, 0, 127}));
  connect(HfSignal.y, sum.u[2]) annotation(
    Line(points = {{-38, -40}, {-20, -40}, {-20, -20}, {-12, -20}}, color = {0, 0, 127}));
  connect(sum.y, limiterWithLag.u) annotation(
    Line(points = {{12, -20}, {26, -20}, {26, -20}, {28, -20}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5})),
  experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.06),
  Documentation(info = "<html><head></head><body>
The model demonstrate the corerct behavior of the <a href=\"modelica://PowerGrids.Controls.LimiterWithLag\">LimiterWithLag</a>.<div>The limit are set as follows:&nbsp;</div><div>&nbsp;uMax = 0.7&nbsp;</div><div>&nbsp;uMin = 0.3</div><div><br></div><div>and the time lag are set as follows:&nbsp;</div><div>&nbsp;LagMax = 2 s&nbsp;</div><div>&nbsp;LagMin = 3 s</div><div><br></div><div>The signal source is a trapezoid which change the frequeny at t = 20, it is possible to see that the limiter becomes active only in case&nbsp;of low frequency variations of the input signal.
 <img src=\"modelica://PowerGrids/Resources/Images/Controls/TestLimiterWithLag.png\"></div></body></html>"));
end TestLimiterWithLag;