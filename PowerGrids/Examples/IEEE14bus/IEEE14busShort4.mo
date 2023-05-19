within PowerGrids.Examples.IEEE14bus;

model IEEE14busShort4 "Bus 4 shorted to ground in the time interval [1, 1.2] seconds"
  extends IEEE14busStaticNetwork(systemPowerGrids(loadLowVoltageAsImpedance = true));
  PowerGrids.Electrical.Buses.BusFault busShort(
    R=0.05,
    SNom=100000000,
    UNom=69000,
    UStart=1.050*380e3,
    X=0,
    portVariablesPhases=true,
    portVariablesPu=true,
    startTime=1,
    stopTime=1.2) annotation( 
Placement(visible=true, transformation(
        origin={89.5,-40},
        extent={{-10,-10},{10,10}},
        rotation=0)));
equation
  connect(busShort.terminalAC, bus4.terminalAC) annotation(
    Line(points = {{90, -40}, {90, -44}, {114, -44}, {114, -40}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5}, initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.04));
end IEEE14busShort4;
