within PowerGrids.Examples.IEEE14bus;

model IEEE14busLine1to5Opening "Simulation of the opening of line 1 to 5 at t = 1 s"
  extends IEEE14busStaticNetwork(L1to5(useBreakerB = true));
  Modelica.Blocks.Sources.BooleanExpression L1to5BreakerState(y = time < 1)  annotation(
    Placement(visible = true, transformation(origin = {-100, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(L1to5BreakerState.y, L1to5.breakerStatusB) annotation(
    Line(points = {{-88, -36}, {-82, -36}, {-82, -50}, {-82, -50}}, color = {255, 0, 255}));

annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-6, Interval = 0.04),
    __OpenModelica_simulationFlags(homotopyOnFirstTry="()"));
end IEEE14busLine1to5Opening;
