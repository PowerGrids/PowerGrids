within PowerGrids.Electrical.Loads;

model LoadPQVoltageDependenceWithBreaker
  extends LoadPQVoltageDependence(
    final PRef = PRefCur,
    final QRef = QRefCur,
    final breakerStatusStartPF = breakerStatusStart);

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

  Types.ActivePower PRefCur(nominal = SNom, start = PStart) "Current Active power at reference voltage";
  Types.ActivePower QRefCur(nominal = SNom, start = QStart) "Current Reactive power at reference voltage";
  BreakersState breakerStatus "Breaker current status";

initial algorithm
  if breakerStatusStart then
    breakerStatus := BreakersState.Bc;
  else
    breakerStatus := BreakersState.Bo;
  end if;

protected
  Modelica.Blocks.Interfaces.BooleanInput breakerStatusInInternal(start = breakerStatusStart, fixed = true) "breaker Status";

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
    PRefCur = PRefConst;
    QRefCur = QRefConst;
  else
    PRefCur = 0;
    QRefCur = 0;
  end if;

  connect(breakerStatusIn, breakerStatusInInternal);
  if not useBreaker then
    breakerStatusInInternal = breakerStatusStart "Breaker initial status";
  end if;

annotation(
    Documentation(info = "<html>
<body>
<p>This model extends the <a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependence\">LoadPQVoltageDependence</a> by adding a breaker. The breaker can be activated by seting the flag <code>useBreaker</code></p>
<p>When the breaker is closed (boolean input = <code>true</code>) then the model works as a <i>Load PQ with voltage dependence</i>, when the breaker is open (boolean input = <code>false</code>) then both <code>P</code> and <code>Q</code> are forced to zero.</p>
<p>If the EPF is used, the power consumption in the EPF is according to the initial status of the breaker. If <code>breakerStatusStart=true</code> then the load consumption in the EPF is <code>(PStart, QStart)</code>, otherwise the load consumption in the EPF is forced to zero.</p>
</body>
</html>"));

end LoadPQVoltageDependenceWithBreaker;