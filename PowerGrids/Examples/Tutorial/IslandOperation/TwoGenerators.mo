within PowerGrids.Examples.Tutorial.IslandOperation;

model TwoGenerators
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
    Placement(visible = true, transformation(origin = {130, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV1(UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.ReferenceBus NTHV1(SNom = 5e+08, UNom = 380000) annotation(
    Placement(visible = true, transformation(origin = {-20, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN1(R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, rFixed = 419 / 21) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN2( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, rFixed = 419 / 21) annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Examples.Tutorial.GridOperation.Controlled.ControlledGenerator GEN1(UNom = 21e3, SNom = 500e6, TGOV(R = 0.05), GEN(PPF = -450e6)) annotation(
    Placement(visible = true, transformation(origin = {-104, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE( R = 10, SNom = 5e+8, UNom = 380000, X = 100) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Examples.Tutorial.GridOperation.Controlled.ControlledGenerator GEN2(UNom = 21e3, SNom = 500e6, TGOV(R = 0.05), GEN(PPF = -450e6)) annotation(
    Placement(visible = true, transformation(origin = {120, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTHV2(UNom = 380000) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence GRIDL1(PRef = 450e6 + (if time < 1 then 0 else -100e6), PRefConst = 4.5e+08, QRefConst = 200e6, SNom = 500e6, URef = 380000) annotation(
    Placement(visible = true, transformation(origin = {-10, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence GRIDL2(PRefConst = 4.5e+08, QRefConst = 200e6, SNom = 500e6, URef = 380000) annotation(
    Placement(visible = true, transformation(origin = {30, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV2(UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(NTLV1.terminalAC, TGEN1.terminalAC_a) annotation(
    Line(points = {{-80, 20}, {-60, 20}}));
  connect(TGEN1.terminalAC_b, NTHV1.terminalAC) annotation(
    Line(points = {{-40, 20}, {-20, 20}}));
  connect(NTHV1.terminalAC, GRIDL1.terminalAC) annotation(
    Line(points = {{-20, 20}, {-10, 20}, {-10, -26}}));
  connect(GEN1.terminalAC, NTLV1.terminalAC) annotation(
    Line(points = {{-104, 6}, {-104, 20}, {-80, 20}}));
  connect(LINE.terminalAC_a, NTHV1.terminalAC) annotation(
    Line(points = {{0, 20}, {-20, 20}}));
  connect(LINE.terminalAC_b, NTHV2.terminalAC) annotation(
    Line(points = {{20, 20}, {40, 20}}));
  connect(NTHV2.terminalAC, GRIDL2.terminalAC) annotation(
    Line(points = {{40, 20}, {30, 20}, {30, -26}}));
  connect(NTHV2.terminalAC, TGEN2.terminalAC_b) annotation(
    Line(points = {{40, 20}, {60, 20}}));
  connect(TGEN2.terminalAC_a, NTLV2.terminalAC) annotation(
    Line(points = {{80, 20}, {100, 20}}));
  connect(NTLV2.terminalAC, GEN2.terminalAC) annotation(
    Line(points = {{100, 20}, {120, 20}, {120, 8}}));

annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv="LOG_INIT_HOMOTOPY"),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})));
end TwoGenerators;
