within PowerGrids.Examples.Tutorial.IslandOperation;

model PowerFlowLocalInitialization
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.PowerFlow.PVBus GEN2(P = -4.5e8, SNom = 5e+08, UNom = 21000) annotation(
    Placement(transformation(origin = {120, -4}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.PQBus GRIDL1(P = 4.5e+08, Q = 200e6, SNom = 5e+08, UNom = 380000) annotation(
    Placement(visible = true, transformation(origin = {-10, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus GRIDL2(P = 4.5e+08, Q = 200e6, SNom = 5e+08, UNom = 380000) annotation(
    Placement(visible = true, transformation(origin = {30, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.BusPF NTLV1(UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.PowerFlow.TransformerFixedRatioPF TGEN1(RccPu = 0.15e-2, SNom = 5e+08, UNomA = 21000, UNomB = 419000, XccPu = 16e-2, rFixed = 419 / 21) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.LineConstantImpedancePF LINE(R = 10, SNom = 5e+8, UNom = 380000, X = 100) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.BusPF NTHV2(UNom = 380000) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.PowerFlow.TransformerFixedRatioPF TGEN2(RccPu = 0.15e-2, SNom = 5e+08, UNomA = 21000, UNomB = 419000, XccPu = 16e-2, rFixed = 419 / 21) annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner Electrical.System systemPowerGrids(showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, phaseInRadOnDiagrams = false)  annotation(
    Placement(visible = true, transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.BusPF NTLV2(UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Electrical.PowerFlow.SlackBus NTHV1(UNom = 3.8e5, SNom = 5e8)  annotation(
    Placement(transformation(origin = {-20, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Electrical.PowerFlow.PVBus GEN1(UNom = 21000, SNom = 5e8, P = -4.5e8)  annotation(
    Placement(transformation(origin = {-100, -4}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(NTLV1.terminalAC, TGEN1.terminalAC_a) annotation(
    Line(points = {{-80, 0}, {-60, 0}}));
  connect(LINE.terminalAC_b, NTHV2.terminalAC) annotation(
    Line(points = {{20, 0}, {40, 0}}));
  connect(NTHV2.terminalAC, GRIDL2.terminalAC) annotation(
    Line(points = {{40, 0}, {30, 0}, {30, -46}}));
  connect(NTHV2.terminalAC, TGEN2.terminalAC_b) annotation(
    Line(points = {{40, 0}, {60, 0}, {60, 0}, {60, 0}}));
  connect(TGEN2.terminalAC_a, NTLV2.terminalAC) annotation(
    Line(points = {{80, 0}, {100, 0}}));
  connect(NTLV2.terminalAC, GEN2.terminalAC) annotation(
    Line(points = {{100, 0}, {120, 0}, {120, -4}}));
  connect(TGEN1.terminalAC_b, NTHV1.terminalAC) annotation(
    Line(points = {{-40, 0}, {-20, 0}}));
  connect(NTHV1.terminalAC, LINE.terminalAC_a) annotation(
    Line(points = {{-20, 0}, {0, 0}}));
  connect(NTHV1.terminalAC, GRIDL1.terminalAC) annotation(
    Line(points = {{-20, 0}, {-10, 0}, {-10, -46}}));
  connect(NTLV1.terminalAC, GEN1.terminalAC) annotation(
    Line(points = {{-80, 0}, {-100, 0}, {-100, -4}}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));

end PowerFlowLocalInitialization;