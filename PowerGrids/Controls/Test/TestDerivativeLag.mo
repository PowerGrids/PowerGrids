within PowerGrids.Controls.Test;
model TestDerivativeLag
  extends Modelica.Icons.Example;
  PowerGrids.Controls.DerivativeLag derivativeLag(Td = 4, T1 = 2, initType = Modelica.Blocks.Types.Init.SteadyState)  annotation(
    Placement(visible = true, transformation(origin = {-59, 41}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
  PowerGrids.Controls.DerivativeLag derivativeLagNoDynamics(T1 = 0, initType = Modelica.Blocks.Types.Init.SteadyState)  annotation(
    Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step(offset = 1, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression derivativeLagAnalyticSolution(
   y = if time < 1 then 0 else 2*exp(-(time-1)/2)) annotation(
    Placement(visible = true, transformation(origin = {90, 40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression derivativeLagNoDynamicsAnalyticSolution(y = 1 + (if time < 1 then 0 else 1))  annotation(
    Placement(visible = true, transformation(origin = {90, -40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(step.y, derivativeLagNoDynamics.u) annotation(
    Line(points = {{-119, 0}, {-106, 0}, {-106, -40}, {-84, -40}}, color = {0, 0, 127}));
  connect(step.y, derivativeLag.u) annotation(
    Line(points = {{-119, 0}, {-106, 0}, {-106, 40}, {-84, 40}, {-84, 41}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body><p>This model demonstrates the correct behaviour of the DerivativeLag block by computing the response to a step change of the input from 1 to 2 and comparing it to the known analytic solution. The blocks are initialized in steady state.</p>
<p>The filter with dynamics has Td = 4, T1 = 2, while the filter without dynamics has default values Td = 0, T1 = 0.</p> 
</body></html>"));
end TestDerivativeLag;
