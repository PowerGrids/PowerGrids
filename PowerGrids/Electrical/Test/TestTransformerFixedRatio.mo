within PowerGrids.Electrical.Test;

model TestTransformerFixedRatio
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus(SNom = 1e+07, UNom = 5000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence loadPQ(PRefConst = 1e+07, QRefConst = 0, SNom = 1e+07, UNom = 10000, alpha = 0, beta = 0, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio transformer(R = 0.3, SNom = 1e+07, UNomA = 5000, UNomB = 10000, X = 1.5, portVariablesPu = true, rFixed = 2) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(infiniteBus.terminal, transformer.terminalA) annotation(
    Line(points = {{-40, 0}, {-20, 0}}));
  connect(transformer.terminalB, loadPQ.terminal) annotation(
    Line(points = {{0, 0}, {20, 0}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p>Similar to <a href=\"modelica://PowerGrids.Electrical.Test.OneBusTransmissionLineOneLoad\">OneBusImpedanceOneLoad</a>, but this time the line impedance has been substituted with a transformer with fixed ratio:</p><p>&nbsp; - ratio = 2<br>&nbsp; - phase shifting null</p><p>The voltage at the infinite bus has been halved, all quantities in the load are the same.</p><p>The results doesn't change.</p></body></html>"));
end TestTransformerFixedRatio;