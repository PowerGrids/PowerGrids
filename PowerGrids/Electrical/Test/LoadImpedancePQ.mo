within PowerGrids.Electrical.Test;

model LoadImpedancePQ "Test case for LoadImpedancePQ"
  extends Modelica.Icons.Example;
  inner System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {78, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ load1(PRef = 8e+07, PRefConst = 40e6, QRef = 4e+07, QRefConst = 20e6, SNom = 1e+08, UNom = 380000, URef = 400000, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ load2(PRef = 8e+07 + (if time >= 1 then 1e7 else 0), PRefConst = 4e+07, QRef = 4e+7 + (if time >= 2 then 5e6 else 0), QRefConst = 2e+07, SNom = 1e+08, UNom = 380000, URef = 400000, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQInputs load3(SNom = 5e+08, UNom = 380000, URef = 400000, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus1(SNom = 1e+08, UNom = 380000, URef = 400000, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus2(SNom = 1e+08, UNom = 380000, URef = 400000, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus3(SNom = 1e+08, UNom = 380000, URef = 400000, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step PRef(height = 10e6, offset = 80e6, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {34, -10}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Step QRef(height = 10e6, offset = 40e6, startTime = 2)  annotation(
    Placement(visible = true, transformation(origin = {34, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(QRef.y, load3.QRefIn) annotation(
    Line(points = {{42, -38}, {52, -38}, {52, -30}, {60, -30}, {60, -30}}, color = {0, 0, 127}));
  connect(PRef.y, load3.PRefIn) annotation(
    Line(points = {{42, -10}, {52, -10}, {52, -24}, {60, -24}, {60, -24}}, color = {0, 0, 127}));
  connect(infiniteBus3.terminal, load3.terminal) annotation(
    Line(points = {{70, 0}, {70, 0}, {70, -20}, {70, -20}}));
  connect(infiniteBus2.terminal, load2.terminal) annotation(
    Line(points = {{0, 0}, {0, 0}, {0, -20}, {0, -20}}));
  connect(infiniteBus1.terminal, load1.terminal) annotation(
    Line(points = {{-70, 0}, {-71, 0}, {-71, 0}, {-68, 0}, {-68, -20}, {-68, -20}, {-68, -20}, {-70, -20}, {-70, -20}}));
  annotation(
    Documentation(info = "<html><head></head><body><p>Test case for <a href=\"modelica://PowerGrids.Electrical.Loads.LoadImpedancePQ\">Electrical.Loads.LoadImpedancePQ</a>.</p>
<p>A load with reference voltage 400 kV is connected to an infinite bus with the same voltage. The impedance Z is computed so as to obtain the required values of P = 80 MW and Q = 40 MVA in the reference conditions.</p>
</body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end LoadImpedancePQ;
