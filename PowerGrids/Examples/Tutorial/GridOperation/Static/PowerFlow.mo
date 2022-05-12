within PowerGrids.Examples.Tutorial.IslandOperation;
model PowerFlow
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.PowerFlow.PVBus GEN1(P = -4.5088e+08, SNom = 5e+08, U = 20825, UNom = 21000) annotation (
    Placement(visible = true, transformation(origin = {-104, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PVBus GEN2(P = -4.5088e+08, SNom = 5e+08, U = 20825, UNom = 21000) annotation (
    Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence GRIDL1(PRefConst = 4.5e+08, QRefConst = 200e6, SNom = 5e+08, UNom = 380000, portVariablesPhases = true) annotation (
    Placement(visible = true, transformation(origin = {-14, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL2(PRefConst = 4.5e+08, QRefConst = 200e6, SNom = 5e+08, UNom = 380000, portVariablesPhases = true) annotation (
    Placement(visible = true, transformation(origin = {26, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV1(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN1(R = 0.15e-2 * 419 ^ 2 / 500,
    SNom=500000000,
    UNomA=21000,
    UNomB=419000,                                                                                                                      X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true,
    showPFdata=true,                                                                                                                                                                          portVariablesPu = true, rFixed = 419 / 21) annotation (
    Placement(visible = true, transformation(origin = {-54, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus NTHV1(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE(
    UNomA=419000,
    UNomB=419000,                                           R = 10,
    SNom=500000000,
    UNom=380000,                                                                                X = 100, portVariablesPhases = true,
    showPFdata=true,                                                                                                                 portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTHV2(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin = {36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN2(R = 0.15e-2 * 419 ^ 2 / 500,
    SNom=500000000,
    UNomA=21000,
    UNomB=419000,                                                                                                                      X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true,
    showPFdata=true,                                                                                                                                                                          portVariablesPu = true, rFixed = 419 / 21) annotation (
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin = {-64, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(NTLV1.terminal, TGEN1.terminalA) annotation (
    Line(points = {{-80, -1.42109e-15}, {-64, -1.42109e-15}}));
  connect(TGEN1.terminalB, NTHV1.terminal) annotation (
    Line(points = {{-44, 0}, {-24, 0}}));
  connect(NTHV1.terminal, GRIDL1.terminal) annotation (
    Line(points = {{-24, -1.42109e-15}, {-14, -1.42109e-15}, {-14, -26}}));
  connect(GEN1.terminal, NTLV1.terminal) annotation (
    Line(points = {{-104, 0}, {-80, 0}}));
  connect(LINE.terminalA, NTHV1.terminal) annotation (
    Line(points = {{-4, 0}, {-24, 0}}));
  connect(LINE.terminalB, NTHV2.terminal) annotation (
    Line(points = {{16, 0}, {36, 0}}));
  connect(NTHV2.terminal, GRIDL2.terminal) annotation (
    Line(points = {{36, -1.42109e-15}, {26, -1.42109e-15}, {26, -26}}));
  connect(NTHV2.terminal, TGEN2.terminalB) annotation (
    Line(points = {{36, -1.42109e-15}, {50, -1.42109e-15}}));
  connect(TGEN2.terminalA, GEN2.terminal) annotation (
    Line(points = {{70, 0}, {86, 0}}));
  annotation (
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-120, 20}, {100, -40}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PowerFlow;
