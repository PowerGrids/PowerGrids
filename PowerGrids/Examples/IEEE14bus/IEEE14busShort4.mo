within PowerGrids.Examples.IEEE14bus;

model IEEE14busShort4 "Bus 4 shorted to ground in the time interval [1, 1.2] seconds"
  extends IEEE14busStaticNetwork(
    systemPowerGrids(loadLowVoltageAsImpedance = true),
    redeclare PowerGrids.Electrical.Buses.BusFault bus4(
    R=0.05,
    SNom=100000000,
    UNom=69000,
    UStart = 70.2049e3,
    UPhaseStart = -0.180223,
    X=0,
    portVariablesPhases=true,
    startTime=1,
    stopTime=1.2));

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5}, initialScale = 0.1), graphics = {Text(origin = {66, -39}, extent = {{-32, 9}, {32, -9}}, textString = "bus4 redeclared as BusFault type")}),
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.04),
  __OpenModelica_commandLineOptions = "--tearingMethod=minimalTearing");
end IEEE14busShort4;
