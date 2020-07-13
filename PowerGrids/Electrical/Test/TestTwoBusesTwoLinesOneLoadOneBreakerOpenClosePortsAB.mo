within PowerGrids.Electrical.Test;
model TestTwoBusesTwoLinesOneLoadOneBreakerOpenClosePortsAB
  extends TestTwoBusesTwoTransmLinesWithBreakersOneLoad(transmissionLine1.useBreakerB = true, transmissionLine1.portVariablesPu = true, transmissionLine1.useBreakerA = true, transmissionLine2.portVariablesPu = true, transmissionLine2.useBreakerA = true, transmissionLine2.useBreakerB = true);
  Modelica.Blocks.Sources.BooleanExpression BreakerStatusLine1AB(y = time < 1 or time >= 2)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.BooleanExpression BreakerStatusLine2A(y = time < 3 or time >= 5)  annotation(
    Placement(visible = true, transformation(origin = {22, 28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.BooleanExpression BreakerStatusLine2B(y = time < 4 or time >= 5)  annotation(
    Placement(visible = true, transformation(origin = {36, 28}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(BreakerStatusLine2B.y, transmissionLine2.breakerStatusB) annotation(
    Line(points = {{36, 18}, {36, 18}, {36, 2}, {38, 2}}, color = {255, 0, 255}));
  connect(BreakerStatusLine2A.y, transmissionLine2.breakerStatusA) annotation(
    Line(points = {{22, 18}, {22, 18}, {22, 2}, {24, 2}}, color = {255, 0, 255}));
  connect(BreakerStatusLine1AB.y, transmissionLine1.breakerStatusB) annotation(
    Line(points = {{-30, 20}, {-30, 20}, {-30, 12}, {-22, 12}, {-22, 2}, {-22, 2}}, color = {255, 0, 255}));
  connect(BreakerStatusLine1AB.y, transmissionLine1.breakerStatusA) annotation(
    Line(points = {{-30, 20}, {-30, 20}, {-30, 12}, {-38, 12}, {-38, 2}, {-36, 2}}, color = {255, 0, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 9, Interval = 0.018, StartTime = 0, Tolerance = 1e-06),
    Documentation(info = "<html><head></head><body><p style=\"font-size: 12px;\">Same behaviour as&nbsp;<a href=\"modelica://PowerGrids.Electrical.Test.TestTwoBusesTwoTransmLinesWithBreakersOneLoad\">TestTwoBusesTwoTransmLinesWithBreakersOneLoad</a>,&nbsp;but this time:</p><p style=\"font-size: 12px;\"></p><ul><li>both the breakers of the line1 are opened in the time interval from t=1 to t=2 seconds,</li><li>the breaker at portA of the line2 is opened in the time interval from t=3 to t=5 seconds,</li><li>the breaker at portB of the line 2 is opened in the time interval from t=4 to t=5 seconds.</li></ul><p></p><p style=\"font-size: 12px;\">When the line 1 is detached (both breakers open) the active power on from the line2 is doubled and the power from the infiniteBus1 becomes null.</p><p style=\"font-size: 12px;\">When the breaker at portA of the line2 is opened the active power from the line1 is doubled and the active power from the infiniteBus2 is reduced to the ones dissipated to the open line (i.e. Rseries+Rshunt).</p><p style=\"font-size: 12px;\">When also the breaker at portB of the line2 is opened the active power from the infiniteBus2 becomes null.</p></body></html>"));

end TestTwoBusesTwoLinesOneLoadOneBreakerOpenClosePortsAB;
