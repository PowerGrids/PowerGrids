within PowerGrids.Electrical.Test;
model TestTapChangerLogicMax
  extends Modelica.Icons.Example;
  extends PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicMax(
    t1st = 3 "Time lag before changing the first tap", 
    tNext = 1 "Time lag before changing subsequent taps", 
    Ntap = 10 "Number of taps", 
    actionSel = ActionType.direct "Tap direct or reverse action selector", 
    lockedStart = false "Wether the tap-changer/phase-shifter is initially locked", 
    runningStart = true "Wether the tap-changer/phase-shifter is initially running", 
    tapStart = 10 "Initial tap", 
    stateStart = State.standard "Initial state");
equation
  locked = time >= 5 and time < 8;
  running = true;
  valueUnderStop = time >= 15.5;
  valueAboveMax = time >= 1 and time < 10;
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model demonstrates the correct behaviour of a tap-changer logic of type MAX</span><span style=\"font-size: 12px;\">&nbsp;by directly prescribing the moniitoring conditions <code>valueUnderStop</code>, <code>valueAboveMax</code>&nbsp;as functions of time.&nbsp;</span><span style=\"font-size: 12px;\">The logic starts with tap changer in position 10.</span><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">valueAboveMax becomes true t=1, and becomes false at t=10, while valueUnderStop becomes true at t=15.5.</span></div><div>Locked signal is active in t = [5, 8] interval.</div><div><br></div><div>According to the defined time lag intervals (3 second for first tap, 1 second for subsequent taps), the tap starts to decrease at t=4 (i.e. 3 seconds after the monitored value raises above MAX), then stays frozen until t=8 because the locked signal becomes active.</div><div><br></div><div>After the locked signal disappears (t=8) and 3 seconds are elapsed (lag for first tap) the tap restarts to decrease, one tap per second, until the Stop is reached.<figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Branches/TestTapChangerLogicMax.png\">
</figure>
</div>
<div><span style=\"font-size: 12px;\">&nbsp;</span></div><div><span style=\"font-size: 12px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></div></body></html>"),
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_simulationFlags(emit_protected = "()"));
end TestTapChangerLogicMax;
