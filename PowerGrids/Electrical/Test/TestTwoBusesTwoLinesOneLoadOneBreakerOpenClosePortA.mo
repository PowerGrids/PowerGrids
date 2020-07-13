within PowerGrids.Electrical.Test;
model TestTwoBusesTwoLinesOneLoadOneBreakerOpenClosePortA
  extends TestTwoBusesTwoTransmLinesWithBreakersOneLoad(transmissionLine2.useBreakerA = true);
  Modelica.Blocks.Sources.BooleanExpression BreakerStatus(y = time < 1 or time >= 10)  annotation(
    Placement(visible = true, transformation(origin = {22, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(BreakerStatus.y, transmissionLine2.breakerStatusA) annotation(
    Line(points = {{22, 10}, {22, 10}, {22, 2}, {24, 2}}, color = {255, 0, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 20, Interval = 0.04, StartTime = 0, Tolerance = 1e-06),
    Documentation(info = "<html><head></head><body><p><span style=\"font-size: 12px;\">Same behaviour as&nbsp;</span><a href=\"modelica://PowerGrids.Electrical.Test.TestTwoBusesTwoTransmLinesWithBreakersOneLoad\" style=\"font-size: 12px;\">TestTwoBusesTwoTransmLinesWithBreakersOneLoad</a><span style=\"font-size: 12px;\">,&nbsp;</span>but this time the breaker at portA of the line2 is opened in the time interval 1 to 10 seconds.</p><p>When the breaker is open, the active power from line 1 is doubled, while the active power from the infiniteBus2 is reduced to the ones dissipated to the open line (i.e. Rseries+Rshunt).</p><p><br></p><p><br></p><p><br></p></body></html>"));

end TestTwoBusesTwoLinesOneLoadOneBreakerOpenClosePortA;