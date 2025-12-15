within PowerGrids.Electrical.Test;

model OneBusTransmissionLineOneLoad
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus(SNom = 1e+07, UNom = 10000, UPhase = 0.523599) annotation(
    Placement(transformation(origin = {0, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence loadPQ(PRefConst = 1e+07, QRefConst = 0, SNom = 10000000, alpha = 0, beta = 0, UNom = 1e4) annotation(
    Placement(transformation(origin = {0, -24}, extent = {{10, -10}, {-10, 10}})));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance transmissionLine(R = 0.3, SNom = 1e+07, UNom = 10000, X = 1.5) annotation(
    Placement(transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Buses.Bus LoadBus(UNom = 10000)  annotation(
    Placement(transformation( origin = {0, -10},extent = {{-10, 10}, {10, -10}}, rotation = -180)));
equation
  connect(infiniteBus.terminalAC, transmissionLine.terminalAC_a) annotation(
    Line(points = {{0, 30}, {0, 20}}));
  connect(transmissionLine.terminalAC_b, LoadBus.terminalAC) annotation(
    Line(points = {{0, 0}, {0, -10}}));
  connect(LoadBus.terminalAC, loadPQ.terminalAC) annotation(
    Line(points = {{0, -10}, {0, -24}}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html>
<p>This model is similar to <a href=\"modelica://PowerGrids.Electrical.Test.OneBusOneLoad\">OneBusOneLoad</a>, except that a transmission line with R = 0.3 Ohm and X = 1.5 Ohm is added between the infinite bus and the load.</p>
<p>As a consequence, the voltage at the load port is reduced to 0.956 p.u., due to the internal ohmic losses of the bus, and the voltage and current of the load have a phase of about 21 deg instead of 30 deg due to the internal reactive load of the bus.</p>
</body></html>"));
end OneBusTransmissionLineOneLoad;
