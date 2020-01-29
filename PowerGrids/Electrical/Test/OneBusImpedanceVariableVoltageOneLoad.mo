within PowerGrids.Electrical.Test;

model OneBusImpedanceVariableVoltageOneLoad
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBusVariableVoltage bus1(PStart = -1e+07, R = 0.04, SNom = 1e+08, UNom = 10000, X = 0.4, generatorConvention = true, portVariablesPhases = true, portVariablesPu = true, useThetaIn = true, useUIn = true) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence load1(PRefConst = 1e+07,PStart = 1e+07, QRefConst = 0, QStart = 0, SNom = 1e+08, UNom = 10000, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step UMod(height = -2e3, offset = 10e3, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step UPhase(height = 30 / 180 * Modelica.Constants.pi, startTime = 2)  annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(UPhase.y, bus1.thetaIn) annotation(
    Line(points = {{-38, -10}, {-20, -10}, {-20, 6}, {-10, 6}, {-10, 6}}, color = {0, 0, 127}));
  connect(UMod.y, bus1.UIn) annotation(
    Line(points = {{-38, 30}, {-20, 30}, {-20, 14}, {-10, 14}, {-10, 14}}, color = {0, 0, 127}));
  connect(bus1.terminal, load1.terminal) annotation(
    Line(points = {{0, 10}, {0, 4}, {-1.33227e-15, 4}, {-1.33227e-15, 1}, {0, 1}, {0, 0}}));
  annotation(
    experiment(StopTime = 3.0, Interval = 0.01),
    Documentation(info = "<html><head></head><body><p>This model demonstrates the usage of a variable-voltage infinite bus.</p>
<p>The model is similar to <a href=\"modelica://PowerGrids.Electrical.Test.OneBusImpedanceOneLoad\">OneBusImpedanceOneLoad</a>, except that the bus reference voltage is reduced from 10 kV to 8 kV at time = 1 and the reference phase is increased from 0 to 30 deg at time = 2.</p>
</body></html>"));
end OneBusImpedanceVariableVoltageOneLoad;
