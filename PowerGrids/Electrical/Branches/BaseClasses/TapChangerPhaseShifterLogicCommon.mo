within PowerGrids.Electrical.Branches.BaseClasses;
partial model TapChangerPhaseShifterLogicCommon
  final constant Types.Time timeInfinity = Modelica.Constants.inf "Default value for counters";
  
  encapsulated type State = enumeration (moveDownN "1: tap-changer/phase-shifter has decreased the next tap",
                                         moveDown1 "2: tap-changer/phase-shifter has decreased the first tap",
                                         waitingToMoveDown "3: tap-changer/phase-shifter is waiting to decrease the first tap",
                                         standard "4:tap-changer/phase-shifter is in standard state with UThresholdDown <= UMonitored <= UThresholdUp",
                                         waitingToMoveUp "5: tap-changer/phase-shifter is waiting to increase the first tap",
                                         moveUp1 "6: tap-changer/phase-shifter has increased the first tap",
                                         moveUpN "7: tap-changer/phase-shifter has increased the next tap",
                                         locked "8: tap-changer/phase-shifter locked");
  State state(start = stateStart, fixed = true);
  
  encapsulated type ActionType = enumeration (direct "Whether increasing the tap will increase the monitored value",
                                              reverse "Whether increasing the tap will decrease the monitored value");
  
  parameter Types.Time t1st(min = 0) "Time lag before changing the first tap";
  parameter Types.Time tNext(min = 0) "Time lag before changing subsequent taps";
  parameter Integer Ntap "Number of tap positions";
  parameter Integer tapMax = Ntap "Max tap position";
  parameter Integer tapMin = 1    "Min tap position";
  parameter ActionType actionSel = ActionType.direct "Tap direct or reverse action selector";
  parameter Boolean lockedStart = false "Whether the tap-changer/phase-shifter is initially locked" annotation(
  Dialog(tab = "Initialization"));
  parameter Boolean runningStart = true "Whether the tap-changer/phase-shifter is initially running" annotation(
  Dialog(tab = "Initialization"));
  parameter Integer tapStart "Initial tap" annotation(
  Dialog(tab = "Initialization"));
  parameter State stateStart = State.standard "Initial state" annotation(
  Dialog(tab = "Initialization"));
  final parameter Boolean directAction = (actionSel == ActionType.direct) "= true, when direct action is selected";
  final parameter Boolean reverseAction = (actionSel == ActionType.reverse) "= true, when reverse action is selected";
  
  Boolean locked (start = lockedStart) "whether the tap-changer/phase-shifter is locked";
  Boolean running (start = runningStart) "whether the tap-changer/phase-shifter is running";  
  Integer tap(start = tapStart, fixed = true) "Current tap";

protected
  Boolean lookingToIncreaseTap "true if the tap-changer/phase-shifter wants to increase tap";
  Boolean lookingToDecreaseTap "true if the tap-changer/phase-shifter wants to decrease tap";
  Types.Time tTapMoved(start = timeInfinity, fixed = true) "Time when the tap has been moved";

initial equation
  assert (tapMax <= Ntap,  "Max tap value supposed to be equal or below Ntap");
  assert (tapMin >= 1,     "Min tap value supposed to be equal or higher than 1");
  assert (tapMax > tapMin, "Max tap value supposed to be higher than Min tap value");

equation
  assert (tap <= tapMax, "Tap value supposed to be below maximum tap");
  assert (tap >= tapMin, "Tap value supposed to be above minimum tap");

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body>This class defines the common parameters and variables used by the classes which implement the tap changer / phase shifter logic of different types.</body></html>"));
end TapChangerPhaseShifterLogicCommon;
