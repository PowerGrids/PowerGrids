within PowerGrids.Controls.Test;
model TestRampTrackingFilter
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step(height = 1, offset = 1, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.RampTrackingFilter rampTrackingFilter1(M = 2, N = 50, T1 = 1e-5, T2 = 1 / 100, initType = Modelica.Blocks.Types.Init.SteadyState, k = 10, yStart = 10)  annotation(
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PowerGrids.Controls.RampTrackingFilter rampTrackingFilter2(M = 1, N = 1, T1 = 2, T2 = 2, initType = Modelica.Blocks.Types.Init.SteadyState, k = 10, yStart = 10) annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression rampTrackingFilter1AnalyticSolution(y = 10 * (if time < 2 then 1 else 2))  annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression rampTrackingFilter2AnalyticSolution(y = 10 * (if time < 1 then 1 else 2)) annotation(
    Placement(visible = true, transformation(origin = {114, -2}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PowerGrids.Controls.RampTrackingFilter rampTrackingFilter3(M = 0, N = 0, T1 = 4, T2 = 2, initType = Modelica.Blocks.Types.Init.SteadyState, k = 10, yStart = 10) annotation(
    Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression rampTrackingFilter3AnalyticSolution(y = 10 * (if time < 1 then 1 else 2)) annotation(
    Placement(visible = true, transformation(origin = {114, -62}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(step.y, rampTrackingFilter3.u) annotation(
    Line(points = {{-78, 0}, {-60, 0}, {-60, -60}, {-44, -60}, {-44, -60}}, color = {0, 0, 127}));
  connect(step.y, rampTrackingFilter2.u) annotation(
    Line(points = {{-78, 0}, {-44, 0}}, color = {0, 0, 127}));
  connect(step.y, rampTrackingFilter1.u) annotation(
    Line(points = {{-79, 0}, {-60, 0}, {-60, 60}, {-44, 60}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-06, Interval = 0.01),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body><p>This model demonstrates the correct behaviour of the ramp tracking filter in two cases that cover all the parameters, by comparing the output with the analytic solution.</p>
<p>The first case is the Padé approximation of a pure time delay of 1 second, obtain by connecting 50 filters each with 2 poles with a time constant 1/100 and with two very zeros with very small tim constant, cascaded with a gain of 10.</p>
<p>The second case has N = 1 and T1 = T2 = 2, cascaded with a gain of 10. As the pole and the zero cancel out, the overall system is equivalent to a gain of 10.</p>
<p>Both filters are initialized in steady-state.</p>
</body></html>"));
end TestRampTrackingFilter;
