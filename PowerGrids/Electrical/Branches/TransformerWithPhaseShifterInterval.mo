within PowerGrids.Electrical.Branches;
model TransformerWithPhaseShifterInterval
  extends BaseClasses.TapChangerPhaseShifterCommon;
  extends BaseClasses.TapChangerPhaseShifterLogicInterval;

  parameter Types.Angle kPhase[Ntap] "Array with angle of transformer complex ratio for each tap";
  parameter PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterCommon.MonitoredQuantitySelection quantitySel "monitored quantity selection";
  parameter Types.Current IMax = NotUsed "Maximum Current threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.currentMagnitude));
  parameter Types.Current IMin = NotUsed "Minimum Current threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.currentMagnitude));
  parameter Types.ActivePower PMax = NotUsed "Maximum Active Power threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.activePower));
  parameter Types.ActivePower PMin = NotUsed "Minimum Active Power threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.activePower));
  
initial equation
  if quantitySel == MonitoredQuantitySelection.currentMagnitude then
    assert(IMax > IMin, "Wrong Current interval");
    assert(IMax >= 0, "Current threshold IMax must be positive");
    assert(IMin >= 0, "Current threshold IMin must be positive");
  elseif quantitySel == MonitoredQuantitySelection.activePower then
    assert(PMax > PMin, "wrong Active Power interval");
    assert(PMax >= 0, "Active Power threshold PMax must be positive");
    assert(PMin >= 0, "Active Power threshold PMin must be positive");
  end if;
  
equation
// Phase shifter applied on output port
  locked = false;
  running = true;
  
  if quantitySel == MonitoredQuantitySelection.currentMagnitude then
    valueUnderMin = portB.I < IMin;
    valueAboveMax = portB.I > IMax;
  elseif quantitySel == MonitoredQuantitySelection.activePower then
    valueUnderMin = portB.P < PMin;
    valueAboveMax = portB.P > PMax;
  end if;  

  k = CM.fromPolar(1, kPhase[pre(tap)])
      "pre() is required because k influences the triggering conditions
       of the state machine so it should be computed before the event takes place";  
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><div><span style=\"font-size: 12px;\">This model implements a transformer with a phase shifter which takes a range for an electrical quantity at portB, and tries to maintain said quantity within it.</span></div><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">The available electrical quantities are Current Magnitude and Active Power.</span><br><div><span style=\"font-size: 12px;\"><br></span></div></div><div><div style=\"font-size: 12px;\">It extends two classes:</div><div style=\"font-size: 12px;\"><ul><li><a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterCommon\">TapChangerPhaseShifterCommon</a>, which implements the model of the transformer,</li></ul><ul><li><a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicInterval\">TapChangerPhaseShifterLogicInterval</a>, which implements the logic that updates the position of the tap changer.</li></ul></div></div></body></html>"));
end TransformerWithPhaseShifterInterval;
