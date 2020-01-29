within PowerGrids.Electrical.Test;

model TestTapChangerLogicInterval
  extends Modelica.Icons.Example;
  extends PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicInterval
    (t1st = 3 "Time lag before changing the first tap", 
    tNext = 2 "Time lag before changing subsequent taps", 
    tapMin = 1 "Minimum tap", 
    tapMax = 20 "Maximum tap", 
    Ntap = 20 "Number of taps", 
    actionSel = ActionType.direct "Tap direct or reverse action selector", 
    lockedStart = false "Wether the tap-changer/phase-shifter is initially locked", 
    runningStart = true "Wether the tap-changer/phase-shifter is initially running", 
    tapStart = 10 "Initial tap", 
    stateStart = State.standard "Initial state", 
    tToStandardState = 2 "Time lag before transition to standard state, in order to avoid chattering");
    Real U = sin(2*Modelica.Constants.pi*time/40) "Monitored Value";
    Real Umin = -0.5;
    Real Umax = 0.5;
equation
  locked = time < 20;
  running = true;
  valueAboveMax = U > Umax;
  valueUnderMin = U < Umin;
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-06, Interval = 0.16),
    __OpenModelica_simulationFlags(emit_protected = "()"),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model demonstrates the correct behaviour of a tap-changer logic of type INTERVAL&nbsp;</span><span style=\"font-size: 12px;\">by directly prescribing the moniitoring conditions&nbsp;<code>valueUnderMin,&nbsp;</code></span><span style=\"font-family: monospace; font-size: 12px;\">valueAboveMax</span>. The logic starts with tap changer in position 5.<div><div><br></div><div>The monitored value U is a sine wave and does not depend from the tap position. The monitoring INTERVAL is [-0.5, 0.5].</div><div><br></div><div>The Locked signal is active in t = [0, 20] interval.</div><div><br></div><div>The tap position stays frozen until t=20, because the locked signal is active.</div><div><br></div><div>After the Locked signal disappears, the tap position starts to move according to the defined time lag intervals (3 second for first tap, 2 second for subsequent taps) and to the actual value of U (tap position increases when U is higher than 0.5, and decreases when U is lower than -0.5).<figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Branches/TestTapChangerLogicInterval.png\">
</figure>
</div>
<div><br></div><div><br></div><div><br></div><div><br></div><div><br></div><div><span style=\"font-size: 12px;\"><br></span></div></div></body></html>"));
end TestTapChangerLogicInterval;
