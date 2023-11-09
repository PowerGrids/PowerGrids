within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model SteadyState
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Examples.Tutorial.HowToBuild.Components.SimpleGenerator GEN(SNom = 5e+08, UNom = 21000, PPF = -475000000) annotation(
    Placement(transformation(origin = {-74, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRefConst = 495000000, QRefConst = 0, SNom = 5e+08, URef = 21000) annotation(
    Placement(transformation(origin = {10, -22}, extent = {{-10, -10}, {10, 10}})));
  Components.TransmissionLine line(UNom = 21000, R = 0.6, X = 0) annotation(
    Placement(transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.Bus bus(UNom = 21000) annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Electrical.Buses.ReferenceBus referenceBus(UNom = 21000, SNom = 500000000)  annotation(
    Placement(transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(GEN.terminalAC, bus.terminalAC) annotation(
    Line(points = {{-74, 0}, {-60, 0}}));
  connect(bus.terminalAC, line.terminalAC_a) annotation(
    Line(points = {{-60, 0}, {-40, 0}}));
  connect(line.terminalAC_b, referenceBus.terminalAC) annotation(
    Line(points = {{-20, 0}, {10, 0}, {10, 20}}));
  connect(GRIDL.terminalAC, referenceBus.terminalAC) annotation(
    Line(points = {{10, -22}, {10, 20}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-180, -100}, {180, 100}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls = "kinsol", lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end SteadyState;
