within PowerGrids.Electrical.Test;
model TestTwoBusesTwoLinesOneLoadOneBreakerOpenClosePortB
  extends TestTwoBusesTwoTransmLinesWithBreakersOneLoad(transmissionLine1.useBreakerB = true);
  Modelica.Blocks.Sources.BooleanExpression BreakerStatus(y = time < 1 or time >= 10)  annotation(
    Placement(visible = true, transformation(origin = {-24, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(transmissionLine1.breakerStatusB, BreakerStatus.y) annotation(
    Line(points = {{-22, 2}, {-24, 2}, {-24, 12}, {-24, 12}}, color = {255, 0, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 20, Interval = 0.04, StartTime = 0, Tolerance = 1e-06),
    Documentation(info = "<html><head></head><body><p style=\"font-size: 12px;\">Same behaviour as&nbsp;<a href=\"modelica://PowerGrids.Electrical.Test.TestTwoBusesTwoTransmLinesWithBreakersOneLoad\">TestTwoBusesTwoTransmLinesWithBreakersOneLoad</a>,&nbsp;but this time the breaker at portB of the line1 is opened in the time interval 1 to 10 seconds.</p><p style=\"font-size: 12px;\">When the breaker is open, the active power from line 2 is doubled, while the active power from the infiniteBus1 is reduced to the ones dissipated to the open line (i.e. Rseries+Rshunt).</p></body></html>"));

end TestTwoBusesTwoLinesOneLoadOneBreakerOpenClosePortB;
