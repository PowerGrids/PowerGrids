within PowerGrids.Electrical.Branches;
model TransformerWithPhaseShifterMax
  extends BaseClasses.TapChangerPhaseShifterCommon;
  extends BaseClasses.TapChangerPhaseShifterLogicMax;

  parameter Types.Angle kPhase[Ntap] "Angle of transformer complex ratio for each tap";
  parameter PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterCommon.MonitoredQuantitySelection quantitySel "monitored quantity selection";
  parameter Types.Current IMax = NotUsed "Max Current threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.currentMagnitude));
  parameter Types.Current IStop = NotUsed "Stop Current threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.currentMagnitude));
  parameter Types.ActivePower PMax = NotUsed "Max Active Power threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.activePower));
  parameter Types.ActivePower PStop = NotUsed "Stop Active Power threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.activePower));
  
initial equation
  if quantitySel == MonitoredQuantitySelection.currentMagnitude then
    assert(IMax > IStop, "Wrong current interval");
    assert(IMax >= 0, "Current threshold IMax must be positive");
    assert(IStop >= 0, "Current threshold IStop must be positive");
  elseif quantitySel == MonitoredQuantitySelection.activePower then
    assert(PMax > PStop, "Wrong Active Power interval");
    assert(PMax >= 0, "Active Power threshold PMax must be positive");
    assert(PStop >= 0, "Active Power threshold PMax must be positive");
  end if;
  
equation
// phase shifter applied on output port
  locked = false;
  running = true;
  
  if quantitySel == MonitoredQuantitySelection.currentMagnitude then
    valueUnderStop = portB.I < IStop;
    valueAboveMax  = portB.I > IMax;
  elseif quantitySel == MonitoredQuantitySelection.activePower then
    valueUnderStop = portB.P < PStop;
    valueAboveMax  = portB.P > PMax;
  end if;  

  k = CM.fromPolar(1, kPhase[pre(tap)])
      "pre() is required because k influences the triggering conditions
       of the state machine so it should be computed before the event takes place";

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model implements a transformer with</span><span style=\"font-size: 12px;\">&nbsp;a phase shifter which takes a maximum and a stop limit of an electrical quantity at portB, and tries to bring said quantity back to the stop limit when the maximum value is reached.</span><div><br></div><div>The available electrical quantities are Current Magnitude and Active Power.</div><div><br></div><div><div style=\"font-size: 12px;\">It extends two classes:</div><div style=\"font-size: 12px;\"><ul><li><a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterCommon\">TapChangerPhaseShifterCommon</a>, wich implement the model of the transformer,</li></ul><ul><li><a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicMax\">TapChangerPhaseShifterLogicMax</a>, wich implement the logic that updates the position of the tap changer.</li></ul></div></div></body></html>"));
end TransformerWithPhaseShifterMax;
