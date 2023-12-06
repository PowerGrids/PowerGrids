within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model TestTransmissionLine
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {38, 60}, extent = {{-10, -10}, {10, 10}})));
  Components.TransmissionLine line1(UNom = 1000, R = 1, X = 0) annotation(
    Placement(transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.InfiniteBus bus1(UNom = 1000, SNom = 1e6)  annotation(
    Placement(transformation(origin = {-98, 32}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.InfiniteBus bus2(UNom = 1000, SNom = 1e6, URef = 900)  annotation(
    Placement(transformation(origin = {-48, 32}, extent = {{-10, -10}, {10, 10}})));
  Components.TransmissionLine line2(R = 0, X = 1, UNom = 1000)  annotation(
    Placement(transformation(origin = {-70, -56}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.InfiniteBus bus3(UNom = 1000, SNom = 1e6)  annotation(
    Placement(transformation(origin = {-98, -34}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.InfiniteBus bus4(UNom = 1000, SNom = 1e6, UPhase = 0.09948376736367678)  annotation(
    Placement(transformation(origin = {-48, -34}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(bus1.terminalAC, line1.terminalAC_a) annotation(
    Line(points = {{-98, 32}, {-98, 10}, {-80, 10}}));
  connect(line1.terminalAC_b, bus2.terminalAC) annotation(
    Line(points = {{-60, 10}, {-48, 10}, {-48, 32}}));
  connect(bus3.terminalAC, line2.terminalAC_a) annotation(
    Line(points = {{-98, -34}, {-98, -56}, {-80, -56}}));
  connect(line2.terminalAC_b, bus4.terminalAC) annotation(
    Line(points = {{-60, -56}, {-48, -56}, {-48, -34}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 80}, {60, -80}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end TestTransmissionLine;
