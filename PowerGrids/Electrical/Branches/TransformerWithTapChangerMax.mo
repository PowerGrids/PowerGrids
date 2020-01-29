within PowerGrids.Electrical.Branches;
model TransformerWithTapChangerMax
  extends PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterCommon;
  extends PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicMax;

  parameter Types.PerUnit K[Ntap] "Magnitude of transformer complex ratio for each tap";
  parameter Types.Voltage UMax "MAX phase-to-phase voltage threshold for tap changer logic";
  parameter Types.Voltage UStop "Stop phase-to-phase voltage threshold for tap changer logic";

initial equation
  assert(UMax > UStop, "Phase-to-phase voltage MAX threshold must be higher than stop one");
  assert(UMax >= 0, "Maximum phase-to-phase voltage threshold must be positive");
  assert(UStop >= 0, "Stopping phase-to-phase voltage threshold must be positive");

equation
// Tap changer is applied on output phase-to-phase voltage module
  locked = false;
  running = true;
  valueUnderStop = portB.U < UStop;
  valueAboveMax  = portB.U > UMax;
  k = Complex(K[pre(tap)])
      "pre() is required because k influences the triggering conditions
       of the state machine so it should be computed before the event takes place";
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>This model implements a transformer with<span style=\"font-size: 12px;\">&nbsp;a tap changer which takes a maximum and stop phase-to-phase voltage magnitude limits, and tries to bring the magnitude of the phase-to-phase voltage at portB back to the stop limit when the maximum is reached.</span><div><br></div><div><div><span style=\"font-size: 12px;\">It extends two classes:</span></div><div><div style=\"font-size: 12px;\"><ul><li><a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterCommon\">TapChangerPhaseShifterCommon</a>, wich implements the model of the transformer,</li></ul><ul><li><a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicMax\">TapChangerPhaseShifterLogicMax</a>, wich implements the logic that updates the position of the tap changer.</li></ul><div><br></div></div></div></div></body></html>"));
end TransformerWithTapChangerMax;
