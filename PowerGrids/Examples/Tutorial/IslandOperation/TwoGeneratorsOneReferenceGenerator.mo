within PowerGrids.Examples.Tutorial.IslandOperation;
model TwoGeneratorsOneReferenceGenerator
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow, referenceFrequency = PowerGrids.Types.Choices.ReferenceFrequency.fixedReferenceGenerator) annotation (
    Placement(visible = true, transformation(origin = {122, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV1(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin = {-84, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.ReferenceBus NTHV1(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin = {-28, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN1(R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21) annotation (
    Placement(visible = true, transformation(origin = {-58, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN2( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21) annotation (
    Placement(visible = true, transformation(origin = {62, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Examples.Tutorial.GridOperation.Controlled.ControlledGenerator GEN1(GEN(UNom = 21e3, SNom = 500e6, UStart = 20.825e3, UPhaseStart = 9.1746/180*3.14159, PStart = -450.88e6, QStart = -294.351e6), TGOV(R = 0.05)) annotation (
    Placement(visible = true, transformation(origin = {-104, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE( R = 10, SNom = 5e+8, UNom = 380000, UPhaseStartA = 0, X = 100, portVariablesPhases = true, portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin = {2, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Examples.Tutorial.GridOperation.Controlled.ControlledGenerator GEN2(GEN(UNom = 21e3, SNom = 500e6, UStart = 20.825e3, UPhaseStart = 9.1746/180*3.14159, PStart = -450.88e6, QStart = -294.351e6), TGOV(R = 0.05)) annotation (
    Placement(visible = true, transformation(origin = {92, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTHV2(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin = {32, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence GRIDL1(PRef = 450e6 + (if time < 1 then 0 else -100e6), PRefConst = 4.5e+08, QRefConst = 200e6, SNom = 500e6, UNom = 380000, portVariablesPhases = true) annotation (
    Placement(visible = true, transformation(origin = {-18, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence GRIDL2(PRefConst = 4.5e+08, QRefConst = 200e6, SNom = 500e6, UNom = 380000, portVariablesPhases = true) annotation (
    Placement(visible = true, transformation(origin = {22, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(NTLV1.terminal, TGEN1.terminalA) annotation (
    Line(points = {{-84, 20}, {-68, 20}}));
  connect(TGEN1.terminalB, NTHV1.terminal) annotation (
    Line(points = {{-48, 20}, {-28, 20}}));
  connect(NTHV1.terminal, GRIDL1.terminal) annotation (
    Line(points = {{-28, 20}, {-18, 20}, {-18, -14}}));
  connect(GEN1.terminal, NTLV1.terminal) annotation (
    Line(points = {{-104, 6}, {-104, 20}, {-84, 20}}));
  connect(LINE.terminalA, NTHV1.terminal) annotation (
    Line(points = {{-8, 20}, {-28, 20}}));
  connect(LINE.terminalB, NTHV2.terminal) annotation (
    Line(points = {{12, 20}, {32, 20}}));
  connect(NTHV2.terminal, GRIDL2.terminal) annotation (
    Line(points = {{32, 20}, {22, 20}, {22, -14}}));
  connect(NTHV2.terminal, TGEN2.terminalB) annotation (
    Line(points = {{32, 20}, {52, 20}}));
  connect(TGEN2.terminalA, GEN2.terminal) annotation (
    Line(points = {{72, 20}, {92, 20}, {92, 8}}));
  connect(GEN2.omega, systemPowerGrids.omegaRefIn) annotation (
    Line(points={{99,8},{103,8},{103,42.2},{112.2,42.2}},    color = {0, 0, 127}));

annotation (
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"),
    Diagram(coordinateSystem(extent = {{-120, 60}, {140, -40}})));
end TwoGeneratorsOneReferenceGenerator;
