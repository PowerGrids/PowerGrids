within PowerGrids.Electrical.Test;

model OneBusVariableVoltageOneLoad
  extends Modelica.Icons.Example;
  Electrical.Buses.InfiniteBusVariableVoltage bus1(SNom = 1e+08, UNom = 10000, UFixed = 10e3, useUPhaseIn = true, useUIn = true) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Loads.LoadPQVoltageDependence load1(PRefConst = 1e+07, QRefConst = 0, SNom = 1e7, UNom = 10000) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  inner System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step UMod(height = -2e3, offset = 10e3, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step UPhase(height = 30/180*Modelica.Constants.pi, startTime = 2) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(bus1.terminalAC, load1.terminalAC) annotation(
    Line(points = {{0, 10}, {0, 4}, {-1.33227e-15, 4}, {-1.33227e-15, 1}, {0, 1}, {0, 0}}));
  connect(UMod.y, bus1.UIn) annotation(
    Line(points = {{-38, 30}, {-26, 30}, {-26, 16}, {-10, 16}}, color = {0, 0, 127}));
  connect(UPhase.y, bus1.UPhaseIn) annotation(
    Line(points = {{-38, -10}, {-26, -10}, {-26, 4}, {-10, 4}}, color = {0, 0, 127}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StopTime = 3.0, Interval = 0.01),
    Documentation(info = "<html>
<p>This model demonstrates the usage of a variable-voltage infinite bus.</p>
<p>The model is similar to <a href=\"modelica://PowerGrids.Electrical.Test.OneBusOneLoad\">OneBusOneLoad</a>, except that the bus reference voltage is reduced from 10 kV to 8 kV at time = 1 and the reference phase is increased from 0 to 30 deg at time = 2.</p>
</body></html>"));
end OneBusVariableVoltageOneLoad;
