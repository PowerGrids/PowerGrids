within PowerGrids.Electrical.Test;
model TestTwoBusesTwoTransmLinesWithBreakersOneLoad
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus1(SNom = 1e+07, UNom = 10000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence loadPQ(PRefConst = 1e+07, QRefConst = 0, SNom = 1e+07, UNom = 10000, alpha = 0, beta = 0, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedanceWithBreakers transmissionLine1(B = 0.02, G = 0.01,R = 0.3, SNom = 1e+07, UNom = 10000, X = 1.5, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedanceWithBreakers transmissionLine2(B = 0.02, G = 0.01,R = 0.3, SNom = 1e+07, UNom = 10000, X = 1.5, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {30,0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus2(SNom = 1e+07, UNom = 10000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(transmissionLine2.terminalB, infiniteBus2.terminal) annotation(
    Line(points = {{40, 0}, {60, 0}, {60, 0}, {60, 0}}));
  connect(loadPQ.terminal, transmissionLine2.terminalA) annotation(
    Line(points = {{0, 0}, {20, 0}, {20, 0}, {20, 0}}));
  connect(transmissionLine1.terminalB, loadPQ.terminal) annotation(
    Line(points = {{-20, 0}, {0, 0}}));
  connect(infiniteBus1.terminal, transmissionLine1.terminalA) annotation(
    Line(points = {{-60, 1.42109e-15}, {-40, 1.42109e-15}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p><span style=\"font-size: 12px;\">Same behaviour as&nbsp;</span><a href=\"modelica://PowerGrids.Electrical.Test.TestOneBusTransmissionLineWithBreakersOneLoad\" style=\"font-size: 12px;\">TestOneBusTransmissionLineWithBreakersOneLoad</a><span style=\"font-size: 12px;\">, but this time the load is supplied by two identical lines. 
The system is symmetrical, so the active power is equally divided between the two lines.
The breakers are kept closed and all electrical parameters are the same of the OneBusTransmissionLineShuntOneLoad test for each line and for the load.</span></p></body></html>"));

end TestTwoBusesTwoTransmLinesWithBreakersOneLoad;