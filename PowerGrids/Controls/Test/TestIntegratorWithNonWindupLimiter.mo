within PowerGrids.Controls.Test;

model TestIntegratorWithNonWindupLimiter
  extends Modelica.Icons.Example;
  PowerGrids.Controls.IntegratorWithNonWindupLimiter integrator1(
     initType = Modelica.Blocks.Types.Init.InitialOutput, k = 2, yMax = 4)  annotation(
    Placement(visible = true, transformation(origin = {38, 18}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable inputSignal(table = [0, 0; 1, 0; 1, 1; 5, 1; 5, -1; 100, -1])  annotation(
    Placement(visible = true, transformation(origin = {-64, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression integratorAnalyticSolution(y = (if time < 1 then 0 elseif time < 3 then 2 * (time - 1) else 4) + (if time < 5 then 0 elseif time < 9 then -2*(time - 5) else -8))  annotation(
    Placement(visible = true, transformation(origin = {1, 65}, extent = {{-23, -21}, {23, 21}}, rotation = 0)));
  PowerGrids.Controls.IntegratorWithNonWindupLimiter integrator2(initType = Modelica.Blocks.Types.Init.InitialOutput, k = -2, yMax = 4) annotation(
    Placement(visible = true, transformation(origin = {38, -46}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Math.Gain neg(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-4, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(inputSignal.y, integrator1.u) annotation(
    Line(points = {{-46, 0}, {-26.4, 0}, {-26.4, 18}, {16, 18}}, color = {0, 0, 127}));
  connect(inputSignal.y, neg.u) annotation(
    Line(points = {{-46, 0}, {-26, 0}, {-26, -46}, {-16, -46}}, color = {0, 0, 127}));
  connect(neg.y, integrator2.u) annotation(
    Line(points = {{8, -46}, {16, -46}, {16, -46}, {16, -46}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  experiment(StartTime = 0, StopTime = 12, Tolerance = 1e-06, Interval = 0.05),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body>This model demonstrates the correct behaviour of the IntegratorWithNonWindupLimiter block by computing the response to a suitable signal and comparing it to the known analytic solution. The block has k = 2, yMax = 4, yMin = -4.<br> </body></html>"));
end TestIntegratorWithNonWindupLimiter;
