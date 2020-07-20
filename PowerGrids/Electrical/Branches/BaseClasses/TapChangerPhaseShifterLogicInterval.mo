within PowerGrids.Electrical.Branches.BaseClasses;
partial model TapChangerPhaseShifterLogicInterval
  extends TapChangerPhaseShifterLogicCommon;
  parameter Types.Time tToStandardState = 0.1 "time lag before transition to standard state, in order to avoid chattering";

protected
    Boolean valueUnderMin(start = false) "true if the monitored signal is under the minimum limit";
    Boolean valueAboveMax(start = false) "true if the monitored signal is above the maximum limit";
    Boolean valueInRange = not(pre(valueUnderMin)) and not(pre(valueAboveMax)) "true if the monitored signal is into the [valueMin ; valueMax] range";
    Types.Time tValueUnderMinWhileRunning(start = timeInfinity) "time when the monitored signal went under the minimum limit and the tap-changer/phase-shifter is running";
    Types.Time tValueAboveMaxWhileRunning(start = timeInfinity) "time when the monitored signal went above the maximum limit and the tap-changer/phase-shifter is running";
    Types.Time tValueInRangeWhileRunning(start = timeInfinity) "time when the monitored signal comes back into the [valueMin ; valueMax] range and the tap-changer/phase-shifter is running";

equation
  lookingToDecreaseTap = (pre(running) and pre(valueAboveMax) and directAction) or (pre(running) and pre(valueUnderMin) and reverseAction);
  lookingToIncreaseTap = (pre(running) and pre(valueUnderMin) and directAction) or (pre(running) and pre(valueAboveMax) and reverseAction);

  when pre(running) and not(pre(locked)) and pre(valueUnderMin) then
    tValueUnderMinWhileRunning = time;
    tValueAboveMaxWhileRunning = pre(tValueAboveMaxWhileRunning);
    tValueInRangeWhileRunning = pre(tValueInRangeWhileRunning);
  elsewhen pre(running) and not(pre(locked)) and not(pre(valueUnderMin)) then
    tValueUnderMinWhileRunning = pre(tValueUnderMinWhileRunning);
    tValueAboveMaxWhileRunning = pre(tValueAboveMaxWhileRunning);
    tValueInRangeWhileRunning = time;
  elsewhen pre(running) and not(pre(locked)) and pre(valueAboveMax) then
    tValueUnderMinWhileRunning = pre(tValueUnderMinWhileRunning);
    tValueAboveMaxWhileRunning = time;
    tValueInRangeWhileRunning = pre(tValueInRangeWhileRunning);
  elsewhen pre(running) and not(pre(locked)) and not(pre(valueAboveMax)) then
    tValueUnderMinWhileRunning = pre(tValueUnderMinWhileRunning);
    tValueAboveMaxWhileRunning = pre(tValueAboveMaxWhileRunning);
    tValueInRangeWhileRunning = time;
  elsewhen pre(locked) then
    tValueUnderMinWhileRunning = timeInfinity;
    tValueAboveMaxWhileRunning = timeInfinity;
    tValueInRangeWhileRunning = timeInfinity;
  end when;
  
  //Transition to "locked"
  when not(pre(running)) or pre(locked) then
    state = State.locked;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "locked" to "standard"
  elsewhen pre(running) and pre(state) == State.locked and not(pre(locked)) 
                   and valueInRange 
                   and time - tValueInRangeWhileRunning >= tToStandardState then
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "locked" to "waitingToMoveDown"
  elsewhen pre(running) and pre(state) == State.locked 
                   and not(pre(locked)) 
                   and lookingToDecreaseTap then
    state = State.waitingToMoveDown;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "locked" to "waitingToMoveUp"
  elsewhen pre(running) and pre(state) == State.locked 
                   and not(pre(locked)) 
                   and lookingToIncreaseTap then
    state = State.waitingToMoveUp;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "standard" to "waitingToMoveUp"
  elsewhen pre(running) and pre(state) == State.standard 
                   and lookingToIncreaseTap then
    state = State.waitingToMoveUp;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "standard" to "waitingToMoveDown"
  elsewhen pre(running) and pre(state) == State.standard 
                   and lookingToDecreaseTap then
    state = State.waitingToMoveDown;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "waitingToMoveUp" to "standard"
  elsewhen pre(running) and pre(state) == State.waitingToMoveUp 
                   and valueInRange 
                   and time - tValueInRangeWhileRunning >= tToStandardState then
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "waitingToMoveUp" to "waitingToMoveDown"
  elsewhen pre(running) and pre(state) == State.waitingToMoveUp 
                   and lookingToDecreaseTap then
    state = State.waitingToMoveDown;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "waitingToMoveUp" to "moveUp1"
  elsewhen pre(running) and pre(state) == State.waitingToMoveUp 
                   and time - (if directAction then tValueUnderMinWhileRunning else tValueAboveMaxWhileRunning) >= t1st 
                   and pre(tap) < tapMax then
    state = State.moveUp1;  
    tap = pre(tap) + 1; 
    tTapMoved = time;

  //Transition from "waitingToMoveDown" to "standard"
  elsewhen pre(running) and pre(state) == State.waitingToMoveDown 
                   and valueInRange 
                   and time - tValueInRangeWhileRunning >= tToStandardState then
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "waitingToMoveDown" to "waitingToMoveUp"
  elsewhen pre(running) and pre(state) == State.waitingToMoveDown 
                   and lookingToIncreaseTap then
    state = State.waitingToMoveUp;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "waitingToMoveDown" to "moveDown1"
  elsewhen pre(running) and pre(state) == State.waitingToMoveDown 
                   and time - (if directAction then tValueAboveMaxWhileRunning else tValueUnderMinWhileRunning) >= t1st 
                   and pre(tap) > tapMin then
    state = State.moveDown1;  
    tap = pre(tap) - 1; 
    tTapMoved = time; //Transition from "moveUp1" to "standard"
  elsewhen pre(running) and pre(state) == State.moveUp1 
                   and valueInRange
                   and time - tValueInRangeWhileRunning >= tToStandardState then
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveUp1" to "waitingToMoveDown"
  elsewhen pre(running) and pre(state) == State.moveUp1 
                   and lookingToDecreaseTap then
    state = State.waitingToMoveDown;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveUp1" to "moveUpN"
  elsewhen pre(running) and pre(state) == State.moveUp1 
                   and time - pre(tTapMoved) >= tNext 
                   and pre(tap) < tapMax then
    state = State.moveUpN;
    tap = pre(tap) + 1;
    tTapMoved = time;

  //Transition from "moveUpN" to "standard"
  elsewhen pre(running) and pre(state) == State.moveUpN 
                   and valueInRange
                   and time - tValueInRangeWhileRunning >= tToStandardState then
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveUpN" to "waitingToMoveDown"
  elsewhen pre(running) and pre(state) == State.moveUpN 
                   and lookingToDecreaseTap then
    state = State.waitingToMoveDown;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveUpN" to "moveUpN"
  elsewhen pre(running) and pre(state) == State.moveUpN 
                   and time - pre(tTapMoved) >= tNext 
                   and pre(tap) < tapMax then
    state = State.moveUpN;
    tap = pre(tap) + 1;
    tTapMoved = time;

  //Transition from "moveDown1" to "standard"
  elsewhen pre(running) and pre(state) == State.moveDown1
                   and valueInRange
                   and time - tValueInRangeWhileRunning >= tToStandardState then  
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveDown1" to "waitingToMoveUp"
  elsewhen pre(running) and pre(state) == State.moveDown1
                   and lookingToIncreaseTap then
    state = State.waitingToMoveUp;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveDown1" to "moveDownN"
  elsewhen pre(running) and pre(state) == State.moveDown1 
                   and time - pre(tTapMoved) >= tNext 
                   and pre(tap) > tapMin then
    state = State.moveDownN;
    tap = pre(tap) - 1;
    tTapMoved = time;

  //Transition from "moveDownN" to "standard"
  elsewhen pre(running) and pre(state) == State.moveDownN
                   and valueInRange
                   and time - tValueInRangeWhileRunning >= tToStandardState then  
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveDownN" to "waitingToMoveUp"
  elsewhen pre(running) and pre(state) == State.moveDownN 
                   and lookingToIncreaseTap then
    state = State.waitingToMoveUp;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveDownN" to "moveDownN"
  elsewhen pre(running) and pre(state) == State.moveDownN 
                   and time - pre(tTapMoved) >= tNext 
                   and pre(tap) > tapMin then
    state = State.moveDownN;
    tap = pre(tap) - 1;
    tTapMoved = time;

  end when;
  
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>This class implements a&nbsp;model for tap-changer/phase-shifter with an INTERVAL type logic. Said logic tries to keep the monitored value within a [valueMin ; valueMax] interval.<div><br></div><div><div>The model is realized as asynchronous state-machine, the machine states are defined using the enumeration type State, defined in the <a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicCommon\">TapChangerPhaseShifterLogicCommon</a> class.&nbsp;</div><div><br></div><div>The transitions are defined using a when - elsewen structure, which allows the asynchronous behavior of the machine, and the relevant conditions are evaluated at the previous integration step.</div><div><br></div><div>The input variables are two booleans, which indicate if the monitored variable is under the Min limit or above the Max one.</div><div><br></div><div>The output variable tap represents the position of the tap-changer/phase shifter to be used in the next integration step, and it is updated by the transitions of the status-machine.</div></div></body></html>"));
end TapChangerPhaseShifterLogicInterval;
