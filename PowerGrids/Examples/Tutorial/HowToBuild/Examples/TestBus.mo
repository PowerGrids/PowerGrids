within PowerGrids.Examples.Tutorial.HowToBuild.Examples;

model TestBus
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {38, 60}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Buses.InfiniteBus bus1(UNom = 1000, SNom = 1e6)  annotation(
    Placement(transformation(origin = {-98, 32}, extent = {{-10, -10}, {10, 10}})));
equation

  annotation(
    Diagram(coordinateSystem(extent = {{-140, 80}, {60, -80}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls = "kinsol", lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end TestBus;
