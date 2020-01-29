within PowerGrids.Controls.Test;
model TestPIWithNonWindupLimiter
  extends Modelica.Icons.Example;
  PowerGrids.Controls.PIWithNonWindupLimiter PIController(Ki = 4, Kp = 2, initType = Modelica.Blocks.Types.Init.InitialOutput, yMax = 10)  annotation(
    Placement(visible = true, transformation(origin = {-26, 20}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable inputSignal(table = [0, 0; 1, 0; 1, 1; 5, 1; 5, -1; 100, -1])  annotation(
    Placement(visible = true, transformation(origin = {-128, -32}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PIControllerAnalyticSolution(y = (if time < 1 then 0 elseif time < 3 then 2 + 4 * (time - 1) else 10) + (if time < 5 then 0 elseif time < 9.5 then -2 -4*(time - 5) else -20))  annotation(
    Placement(visible = true, transformation(origin = {-49, 109}, extent = {{-23, -21}, {23, 21}}, rotation = 0)));
  PowerGrids.Controls.PIWithNonWindupLimiter PIControllerNegativeKp(Ki = -4, Kp = -2, initType = Modelica.Blocks.Types.Init.InitialOutput, yMax = 10) annotation(
    Placement(visible = true, transformation(origin = {-26, -32}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  PowerGrids.Controls.PIWithNonWindupLimiter PController(Kp = 2, initType = Modelica.Blocks.Types.Init.InitialOutput, yMax = 10) annotation(
    Placement(visible = true, transformation(origin = {-26, -78}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Math.Gain negative(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-76, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PControllerAnalyticSolution(y = (if time < 1 then 0 elseif time < 5 then 2 else -2)) annotation(
    Placement(visible = true, transformation(origin = {-49, 67}, extent = {{-23, -21}, {23, 21}}, rotation = 0)));
equation
  connect(inputSignal.y, PController.u) annotation(
    Line(points = {{-110.4, -32}, {-100.4, -32}, {-100.4, -78}, {-42.4, -78}}, color = {0, 0, 127}));
  connect(inputSignal.y, PIController.u) annotation(
    Line(points = {{-110.4, -32}, {-100.4, -32}, {-100.4, 20}, {-42.4, 20}}, color = {0, 0, 127}));
  connect(inputSignal.y, negative.u) annotation(
    Line(points = {{-108.4, -32}, {-86.4, -32}}, color = {0, 0, 127}));
  connect(negative.y, PIControllerNegativeKp.u) annotation(
    Line(points = {{-65, -32}, {-42, -32}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -140}, {100, 140}})),
  experiment(StartTime = 0, StopTime = 12, Tolerance = 1e-06, Interval = 0.05),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body><p>
This model demonstrates the correct behaviour of the PIWithNonWindupLimiter block  in three simple cases, by comparing the outputs to the analytic solution</p>
<p>The first controller has Kp = 2, Ki = 4; the second has Kp = -2, Ki = -4 and is fed with the opposite input signal, so the output is the same, since the output limits are symmetrical. The third controller is a P controller with Kp = 2. All controllers have yMax = 10, yMin = -10.</p>
</body></html>"));
end TestPIWithNonWindupLimiter;
