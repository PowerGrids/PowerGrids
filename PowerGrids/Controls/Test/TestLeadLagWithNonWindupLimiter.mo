within PowerGrids.Controls.Test;

model TestLeadLagWithNonWindupLimiter
  extends Modelica.Icons.Example;
  PowerGrids.Controls.LeadLagWithNonWindupLimiter leadLagPositiveGain(T1 = 1, T2 = 2, initType = Modelica.Blocks.Types.Init.SteadyState, k = 2, yMax = 5, yMin = -5, yStart = 2) annotation(
    Placement(visible = true, transformation(origin = {42, 18}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable inputSignal(table = [0, 1; 1, 1; 1, 4; 10, 4; 10, -4; 100, -4])  annotation(
    Placement(visible = true, transformation(origin = {-96, -12}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression leadLagAnalyticSolution(
    y = 2 
        + (if time < 1 then 0 else 3) 
        + (if time < 10 then 0 elseif time < 11.54 then (-13 / 2) - 13 / 2 * (1 - exp(-(time - 10) / 2)) else -10)) annotation(
    Placement(visible = true, transformation(origin = {-10, 72}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PowerGrids.Controls.LeadLagWithNonWindupLimiter leadLagNegativeGain(T1 = 1, T2 = 2, initType = Modelica.Blocks.Types.Init.SteadyState, k = -2, yMax = 5, yMin = -5, yStart = 2) annotation(
    Placement(visible = true, transformation(origin = {42, -40}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Math.Gain negativeGain(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(inputSignal.y, negativeGain.u) annotation(
    Line(points = {{-78, -12}, {-60.4, -12}, {-60.4, -40}, {-32, -40}}, color = {0, 0, 127}));
  connect(inputSignal.y, leadLagPositiveGain.u) annotation(
    Line(points = {{-78, -12}, {-60.4, -12}, {-60.4, 18}, {20, 18}}, color = {0, 0, 127}));
  connect(negativeGain.y, leadLagNegativeGain.u) annotation(
    Line(points = {{-9, -40}, {20, -40}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body><p>This model demonstrates the correct behaviour of the LeadLagWithNonWindupLimiter by computing the response to a suitable signal and comparing it to the known analytic solution. The blocks are initialized in steady state.</p>
<p>The first filter has k = 2, T1 = 1, T2 = 2, yMax = 5, yMin = -5, while the second has an opposite gain k = -2 and is fed with the opposite input signal, so the output is the same, since the output limits are symmetrical.</p> 
</body></html>"));
end TestLeadLagWithNonWindupLimiter;