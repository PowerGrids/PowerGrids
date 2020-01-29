within PowerGrids.Electrical.Test;

model TestTransformerFixedRatioWithBreaker
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus1(SNom = 1e+07, UNom = 5000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence loadPQ(PRefConst = 1e+07, QRefConst = 0, SNom = 1e+07, UNom = 10000, alpha = 0, beta = 0, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.TransformerFixedRatioWithBreaker transformer(B = 1e-6, G = 1e-6,R = 0.3, SNom = 1e+07, UNomA = 5000, UNomB = 10000, X = 1.5, portVariablesPu = true, rFixed = 2, useBreaker = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression breakerState(y = time < 2)  annotation(
    Placement(visible = true, transformation(origin = {-30, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus2(SNom = 1e+07, UNom = 10000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Branches.LineConstantImpedance line(R = 0.06, SNom = 1e+7, UNom = 10000, X = 1.5)  annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(infiniteBus1.terminal, transformer.terminalA) annotation(
    Line(points = {{-40, 0}, {-20, 0}}));
  connect(transformer.terminalB, loadPQ.terminal) annotation(
    Line(points = {{0, 0}, {20, 0}}));
  connect(breakerState.y, transformer.breakerStatusIn) annotation(
    Line(points = {{-18, 28}, {-4, 28}, {-4, 2}, {-2, 2}}, color = {255, 0, 255}));
  connect(loadPQ.terminal, line.terminalA) annotation(
    Line(points = {{20, 0}, {38, 0}, {38, 0}, {40, 0}}));
  connect(line.terminalB, infiniteBus2.terminal) annotation(
    Line(points = {{60, 0}, {80, 0}, {80, 0}, {80, 0}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 4, Interval = 0.08, StartTime = 0, Tolerance = 1e-6),
    Documentation(info = "<html><head></head><body><p>Similar to <a href=\"modelica://PowerGrids.Electrical.Test.TestTransformerFixedRatio\">TestTransformerFixedRatio</a>, but this time a new branch has been added, to supply the load when the transformer breaker is open.</p><p>The voltage at the new infinite bus is the same of one at port b of the transformer, the line has little resistance and the same impedance of the transformer.</p><p>If the breaker is closed the power to the load is supplied in the same ratio by the transformer and the line (50% from the transformer and 50% from the line).</p><p>When breacker opens (time = 2 seconds), all the power is supplied by the line, and the transformer is closed on the equivalent shunt impedance.</p></body></html>"));
end TestTransformerFixedRatioWithBreaker;