within PowerGrids.Examples.IEEE14bus;

model IEEE14busShort4 "Bus 4 shorted to ground in the time interval [1, 1.2] seconds"
  extends IEEE14busStaticNetwork(systemPowerGrids(loadLowVoltageAsImpedance = true));
  Electrical.Faults.ThreePhaseFault FAULT4(
    R=0.05,
    SNom=100000000,
    UNom=69000,
    X=0,
    startTime=1,
    stopTime=1.2) annotation(
    Placement(visible = true, transformation(origin = {154, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(bus4.terminalAC, FAULT4.terminalAC) annotation(
    Line(points = {{114, -40}, {154, -40}, {154, -50}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, 120}, {200, -120}}, grid = {0.5, 0.5}, initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.04),
  __OpenModelica_commandLineOptions = "--tearingMethod=minimalTearing");
end IEEE14busShort4;
