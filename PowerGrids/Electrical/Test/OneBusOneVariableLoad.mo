within PowerGrids.Electrical.Test;

model OneBusOneVariableLoad
  extends Modelica.Icons.Example;
  Electrical.Buses.InfiniteBus bus1(SNom = 1e+07, UNom = 10000) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Loads.LoadPQVoltageDependence load1(PRefConst = 10e6, PRef = if time < 1 then 10e6 else 20e6, PStart = 1e+07, QRef = if time < 2 then 0 else 30e6, SNom = 1e+07, UNom = 10000) annotation(
    Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));
  inner System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Buses.InfiniteBus bus2(SNom = 4e7, UNom = 10000) annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Loads.LoadPQVoltageDependenceInputs load2(SNom = 1e+08, UNom = 10000, PRefConst = 10000000) annotation(
    Placement(transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step PSignal(height = 10e6, offset = 10e6, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step QSignal(height = 30e6, startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PSignal.y, load2.PRefIn) annotation(
    Line(points = {{21, 20}, {29, 20}, {29, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(QSignal.y, load2.QRefIn) annotation(
    Line(points = {{21, -20}, {31.5, -20}, {31.5, -10}, {40, -10}}, color = {0, 0, 127}));
  connect(bus1.terminalAC, load1.terminalAC) annotation(
    Line(points = {{-50, 10}, {-50, 0}}));
  connect(bus2.terminalAC, load2.terminalAC) annotation(
    Line(points = {{50, 10}, {50, 0}}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StopTime = 3.0, Interval = 0.01),
    Documentation(info = "<html>
<p>This model demonstrates both ways of implementing a time-varying load.</p>
<p>The model is similar to <a href=\"modelica://PowerGrids.Electrical.Test.OneBusOneLoad\">OneBusOneLoad</a>, except that the active power P of the load is increased from 10 MW to 20 MW at time = 1 and the reactive power is increased from 0 to 30 MW at time = 2.</p>
<p>Both ways of implementing a variable load, with the expression in the modifier and with the input signals, are demonstrated. The results are exactly the same.</p>
</html>"));
end OneBusOneVariableLoad;
