within PowerGrids.Electrical.Branches.BaseClasses;
partial model TapChangerPhaseShifterLogicMax
  extends TapChangerPhaseShifterLogicCommon;
  
protected
  Boolean valueUnderStop(start = false) "whether the monitored signal is under the stop limit";
  Boolean valueAboveMax(start = false) "wheter the monitored signal is above the maximum limit";
  Types.Time tValueAboveMaxWhileRunning(start = timeInfinity, fixed = true) "time when the monitored signal went above the maximum limit and the tap-changer/phase-shifter is running";

equation
  lookingToDecreaseTap = pre(running) and pre(valueAboveMax) and directAction;
  lookingToIncreaseTap = pre(running) and pre(valueAboveMax) and reverseAction;

  when pre(running) and not(pre(locked)) and pre(valueAboveMax) then
    tValueAboveMaxWhileRunning = time;
  elsewhen pre(running) and not(pre(locked)) and pre(valueUnderStop) then
    tValueAboveMaxWhileRunning = timeInfinity;
  elsewhen pre(locked) then
    tValueAboveMaxWhileRunning = timeInfinity;
  end when;

  //Transition to "locked"
  when (not pre(running)) or pre(locked) then
    state = State.locked;
    tap = pre(tap);
    tTapMoved = timeInfinity;
 
  //Transition from "locked" to "standard"
  elsewhen pre(running) and pre(state) == State.locked 
                   and not(pre(locked)) 
                   and not(pre(valueAboveMax)) then
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
                   and pre(valueUnderStop) then
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "waitingToMoveUp" to "moveUp1"
  elsewhen pre(running) and pre(state) == State.waitingToMoveUp 
                   and time - tValueAboveMaxWhileRunning >= t1st 
                   and pre(tap) < tapMax then
    state = State.moveUp1;
    tap = pre(tap) + 1;
    tTapMoved = time;

  //Transition from "moveUp1" to "standard"
  elsewhen pre(running) and pre(state) == State.moveUp1 
                   and pre(valueUnderStop) then
    state = State.standard;
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
                   and pre(valueUnderStop) then
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "moveUpN" to "moveUpN"
  elsewhen pre(running) and pre(state) == State.moveUpN 
                   and time - pre(tTapMoved) >= tNext 
                   and pre(tap) < tapMax then
    state = State.moveUpN;
    tap = pre(tap) + 1;
    tTapMoved = time;

  //Transition from "waitingToMoveDown" to "standard"
  elsewhen pre(running) and pre(state) == State.waitingToMoveDown 
                   and pre(valueUnderStop) then
    state = State.standard;
    tap = pre(tap);
    tTapMoved = timeInfinity;

  //Transition from "waitingToMoveDown" to "moveDown1"
  elsewhen pre(running) and pre(state) == State.waitingToMoveDown 
                   and time - tValueAboveMaxWhileRunning >= t1st 
                   and pre(tap) > tapMin then
    state = State.moveDown1;
    tap = pre(tap) - 1;
    tTapMoved = time;

  //Transition from "moveDown1" to "standard"
  elsewhen pre(running) and pre(state) == State.moveDown1 
                   and pre(valueUnderStop) then
    state = State.standard;
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
                   and pre(valueUnderStop) then
    state = State.standard;
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
  Documentation(info = "<html><head></head><body>This class implements a model for a tap changer/phase-shifter with a MAX type logic. Said logic takes a maximum and stop values, and tries to bring the value back to the stop one when the maximum is reached.<div><br></div><div>The model is realized as asynchronous state-machine, the machine states are defined using the enumeration type State, defined in the <a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicCommon\">TapChangerPhaseShifterLogicCommon</a> class.&nbsp;</div><div><br></div><div>The transitions are defined using a when - elsewen structure, which allows the asyncronous behavior of the machine, and the relevant conditions are evaluated at the previous integration step.</div><div><br></div><div>The input variables are two booleans, which indicate if the monitored variable is under the stop limit or above the Max one.</div><div><br></div><div>The output variable tap represents the position of the tap-changer/phase shifter to be used in the next integration step, and it is updated by the transitions of the status-machine.</div></body></html>"));
end TapChangerPhaseShifterLogicMax;
