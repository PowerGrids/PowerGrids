within PowerGrids.Examples.Tutorial.IslandOperation;

model PowerFlow
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.PowerFlow.PVBus GEN1(P = -4.5088e+08, SNom = 5e+08, U = 20825, UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {-104, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PVBus GEN2(P = -4.5088e+08, SNom = 5e+08, U = 20825, UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence GRIDL1(PRefConst = 4.5e+08, QRefConst = 200e6, SNom = 5e+08, UNom = 380000, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {-10, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL2(PRefConst = 4.5e+08, QRefConst = 200e6, SNom = 5e+08, UNom = 380000, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {30, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV1(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN1(R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus NTHV1(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE(R = 10, SNom = 5e+8, UNom = 380000, X = 100, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTHV2(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN2(R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(NTLV1.terminal, TGEN1.terminalA) annotation(
    Line(points = {{-80, 0}, {-60, 0}}));
  connect(TGEN1.terminalB, NTHV1.terminal) annotation(
    Line(points = {{-40, 0}, {-20, 0}}));
  connect(NTHV1.terminal, GRIDL1.terminal) annotation(
    Line(points = {{-20, 0}, {-10, 0}, {-10, -46}}));
  connect(GEN1.terminal, NTLV1.terminal) annotation(
    Line(points = {{-104, 0}, {-80, 0}}));
  connect(LINE.terminalA, NTHV1.terminal) annotation(
    Line(points = {{0, 0}, {-20, 0}}));
  connect(LINE.terminalB, NTHV2.terminal) annotation(
    Line(points = {{20, 0}, {40, 0}}));
  connect(NTHV2.terminal, GRIDL2.terminal) annotation(
    Line(points = {{40, 0}, {30, 0}, {30, -46}}));
  connect(NTHV2.terminal, TGEN2.terminalB) annotation(
    Line(points = {{40, 0}, {60, 0}, {60, 0}, {60, 0}}));
  connect(TGEN2.terminalA, GEN2.terminal) annotation(
    Line(points = {{80, 0}, {100, 0}, {100, 0}, {100, 0}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PowerFlow;
