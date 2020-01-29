within PowerGrids.Electrical.Test;

model OneBusImpedanceOneVariableLoad
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus bus1(PStart = -1e+07,R = 0.04,SNom = 1e+08, UNom = 10000, X = 0.4, generatorConvention = true, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence load1(
    PRef = if time < 1 then 10e6 else 20e6, PStart = 1e+07,
    QRef = if time < 2 then 0 else 30e6, QStart = 0, SNom = 1e+08, UNom = 10000, portVariablesPhases = true)
    annotation(
    Placement(visible = true, transformation(origin = {-50,0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus bus2(PStart = -1e+07,R = 0.04, SNom = 1e+08, UNom = 10000, X = 0.4, generatorConvention = true, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependenceInputs load2(PStart = 1e+07, SNom = 1e+08, UNom = 10000, portVariablesPhases = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step PSignal(height = 10e6, offset = 10e6, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step QSignal(height = 30e6, startTime = 2)  annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PSignal.y, load2.PRefIn) annotation(
    Line(points = {{21, 20}, {29, 20}, {29, -4}, {42, -4}}, color = {0, 0, 127}));
  connect(QSignal.y, load2.QRefIn) annotation(
    Line(points = {{21, -20}, {31.5, -20}, {31.5, -10}, {42, -10}}, color = {0, 0, 127}));
  connect(bus2.terminal, load2.terminal) annotation(
    Line(points = {{52, 10}, {52, 5}, {50, 5}, {50, 0}}));
  connect(bus1.terminal, load1.terminal) annotation(
    Line(points = {{-48, 10}, {-48, 5}, {-50, 5}, {-50, 0}}));
  annotation(
    experiment(StopTime = 3.0, Interval = 0.01),
    Documentation(info = "<html><head></head><body><p>This model demonstrates both ways of implementing a time-varying load.</p>
The model is similar to <a href=\"modelica://PowerGrids.Electrical.Test.OneBusImpedanceOneLoad\">OneBusImpedanceOneLoad</a>, except that the active power P of the load is increased from 10 MW to 20 MW at time = 1 and the reactive power is increased from 0 to 30 MW at time = 2.<p></p>
<p>Both ways of implementing a variable load, with the expression in the modifier and with the input signals, are demonstrated. The results are exactly the same.</p>
</body></html>"));
end OneBusImpedanceOneVariableLoad;
