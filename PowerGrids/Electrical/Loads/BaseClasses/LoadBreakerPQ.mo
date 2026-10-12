within PowerGrids.Electrical.Loads.BaseClasses;

partial model LoadBreakerPQ
  encapsulated type BreakersState = enumeration(
    Bc "breaker closed",
    Bo "breaker open");
  parameter Boolean useBreaker = false "Use breaker" annotation(
    Dialog(group = "External Inputs"),
    choices(checkBox = true));
  parameter Boolean breakerStatusStart = true "Breaker start status - true means breaker closed" annotation(
    Dialog(tab = "Initialization"));

  Modelica.Blocks.Interfaces.BooleanInput breakerStatusIn if useBreaker "Breaker status - true means breaker closed" annotation(
    Placement(transformation(origin = {-56, 62}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-10, -20}, extent = {{-10, -10}, {10, 10}})));


  Types.ActivePower PRefCur(nominal = SNomBrk, start = PStartBrk) "Current Active power at reference voltage";
  Types.ActivePower QRefCur(nominal = SNomBrk, start = QStartBrk) "Current Reactive power at reference voltage";
  BreakersState breakerStatus "Breaker current status";

initial algorithm
  if breakerStatusStart then
    breakerStatus := BreakersState.Bc;
  else
    breakerStatus := BreakersState.Bo;
  end if;

protected
  Modelica.Blocks.Interfaces.BooleanInput breakerStatusInInternal(start = breakerStatusStart, fixed = true) "breaker Status";
  parameter Types.ActivePower PStartBrk "Start value of active power flowing into the port";
  parameter Types.ReactivePower QStartBrk "Start value of reactive power flowing into the port";
  parameter Types.ActivePower PRefConstBrk "Active power consumption at reference voltage, reference P for the embedded PF";
  parameter Types.ReactivePower QRefConstBrk "Reactive power consumption at reference voltage, reference Q for the embedded PF";
  parameter Types.ApparentPower SNomBrk "Nominal/rated apparent power, also used as p.u. base";

algorithm
  when breakerStatus == BreakersState.Bc
       and not pre(breakerStatusInInternal) then
    breakerStatus := BreakersState.Bo "Bc to Bo";

  elsewhen breakerStatus == BreakersState.Bo
           and pre(breakerStatusInInternal) then
    breakerStatus := BreakersState.Bc "Bo to Bc";
  end when;

equation
  if breakerStatus == BreakersState.Bc then
    PRefCur = PRefConstBrk;
    QRefCur = QRefConstBrk;
  else
    PRefCur = 0;
    QRefCur = 0;
  end if;

  connect(breakerStatusIn, breakerStatusInInternal);
  if not useBreaker then
    breakerStatusInInternal = breakerStatusStart "Breaker initial status";
  end if;

end LoadBreakerPQ;