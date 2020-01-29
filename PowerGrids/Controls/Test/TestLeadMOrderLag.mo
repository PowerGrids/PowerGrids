within PowerGrids.Controls.Test;
model TestLeadMOrderLag
  extends Modelica.Icons.Example;
  PowerGrids.Controls.LeadMOrderLag leadLag( M = 1,T1 = 4, T2 = 2, initType = Modelica.Blocks.Types.Init.SteadyState, k = 10, yStart = 2)  annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step(height = 1, offset = 1, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression leadLagAnalyticSolution(y = 10 * (1 + (if time < 1 then 0 else 1 + exp(-(time - 1) / 2))))  annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  PowerGrids.Controls.LeadMOrderLag mOrderLag(M = 100, T1 = 1e-5, T2 = 1 / 100, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1, yStart = 1) annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression mOrderLagAnalyticSolution(y = 1 + (if time < 2 then 0 else 1)) annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(step.y, mOrderLag.u) annotation(
    Line(points = {{-58, 0}, {-42, 0}, {-42, -60}, {-24, -60}, {-24, -60}}, color = {0, 0, 127}));
  connect(step.y, leadLag.u) annotation(
    Line(points = {{-58, 0}, {-41, 0}, {-41, 40}, {-24, 40}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.01),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model demonstrates the correct behaviour of the LeadMOrderLag filter </span><span style=\"font-size: 12px;\">in two cases, by comparing its ouptut to the analytical response.</span><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">The first case is a simple lead-lag filter with k = 10, T1 = 4, T2 = 2 and M = 1.</span></div><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">The second case is a filter with k = 1, T1 = 1e-5 (very small, practically zero), T2 = 1/100 and N = 100, which is the (0,100) Padé approximation of a pure time delay of 1 second.</span></div></body></html>"));
end TestLeadMOrderLag;
