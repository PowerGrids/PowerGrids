within PowerGrids.Electrical.Branches;
model TransformerWithPhaseShifterTarget
  extends TransformerWithPhaseShifterInterval(
    final IMax = targetValueI + deadBandI, 
    final IMin = targetValueI - deadBandI,
    final PMax = targetValueP + deadBandP,
    final PMin = targetValueP - deadBandP);
  
  parameter Types.Current targetValueI = NotUsed "Current target value" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.currentMagnitude));
  parameter Types.Current deadBandI = NotUsed "Acceptable dead-band next to the Current target value" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.currentMagnitude));
  parameter Types.ActivePower targetValueP = NotUsed "Current target value" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.activePower));
  parameter Types.ActivePower deadBandP = NotUsed "Maximum Active Power threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.activePower));

initial equation
  if quantitySel == MonitoredQuantitySelection.currentMagnitude then
    assert(targetValueI > deadBandI, "Dead band cannot exceed the target value");
    assert(deadBandI > 0, "Dead band must be positive");
    assert(targetValueI >= 0, "Target value must be positive");
  elseif quantitySel == MonitoredQuantitySelection.activePower then
    assert(targetValueP > deadBandP, "Dead band cannot exceed the target value");
    assert(deadBandP > 0, "Dead band must be positive");
    assert(targetValueP >= 0, "Target value must be positive");
  end if;
  
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model implements a transformer with a phase shifter which takes a target and a dead band for an electrical quantity at portB, and tries to maintain said quantity in the&nbsp;acceptable dead-band next to the target value.</span><div><span style=\"font-size: 12px;\"><br></span></div><div>The available electrical quantities are Current Magnitude and Active Power.</div><div><br></div><div><span style=\"font-size: 12px;\">It extends the class <a href=\"Modelica:///PowerGrids.Electrical.Branches.TransformerWithPhaseShifterInterval\">TransformerWithPhaseShifterInterval</a>, which implements a transformer with phase-shifter and Interval logic, redefining said interval in terms of target value and dead-band.</span></div></body></html>"));
end TransformerWithPhaseShifterTarget;
