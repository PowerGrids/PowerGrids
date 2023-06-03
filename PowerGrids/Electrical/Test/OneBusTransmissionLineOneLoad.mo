within PowerGrids.Electrical.Test;

model OneBusTransmissionLineOneLoad
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus(SNom = 1e+07, UNom = 10000, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence loadPQ(PRefConst = 1e+07, QRefConst = 0, SNom (displayUnit = "V.A")= 1e+07, alpha = 0, beta = 0, portVariablesPhases = true, URef = 10000, UStart(displayUnit = "V")) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance transmissionLine(R = 0.3, SNom = 1e+07, UNom = 10000, X = 1.5) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(infiniteBus.terminalAC, transmissionLine.terminalAC_a) annotation(
    Line(points = {{-40, 0}, {-20, 0}}));
  connect(transmissionLine.terminalAC_b, loadPQ.terminalAC) annotation(
    Line(points = {{0, 0}, {20, 0}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p>Same behaviour as <a href=\"modelica://PowerGrids.Electrical.Test.OneBusImpedanceOneLoad\">OneBusImpedanceOneLoad</a>, but this time the line impedance is not built-in the bus but rather represented explicitly with a Transmission Line. All quantities in the load are the same.
</body></html>"));
end OneBusTransmissionLineOneLoad;
