within PowerGrids.Electrical.Branches;
model TransformerWithTapChangerTarget
  extends TransformerWithTapChangerInterval(
    final UMax = targetValue + deadBand, 
    final UMin = targetValue - deadBand);
  
  parameter Types.Voltage targetValue(min = 0) "Phase-to-phase voltage target value";
  parameter Types.Voltage deadBand(min = 0) "Acceptable dead-band next to the phase-to-phase voltage target value";

initial equation
  assert(targetValue > deadBand, "Dead band cannot exceed the target value");
  assert(deadBand > 0, "Dead band must be positive");
  assert(targetValue >= 0, "Target value must be positive");

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>This model implements a transformer with a tap changer which takes a phase-to-phase voltage magnitude target and a dead band, and tries to maintain the magnitude of phase-to-phase voltage at portB in the&nbsp;acceptable dead-band next to the target value.<div><br></div><div><div style=\"font-size: 12px;\">It extends the class <a href=\"Modelica:///PowerGrids.Electrical.Branches.TransformerWithTapChangerInterval\">TransformerWithTapChangerInterval</a>, which implements a transformer with tap-changer and Interval logic, redefining said interval in terms of target value and dead-band.</div></div></body></html>"));
end TransformerWithTapChangerTarget;
