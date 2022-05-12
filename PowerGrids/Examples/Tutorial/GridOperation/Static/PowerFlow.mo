within PowerGrids.Examples.Tutorial.GridOperation.Static;
model PowerFlow "Power flow for the basic grid used in the tutorial"
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.PowerFlow.PVBus GEN(P = -4.75e+8, SNom = 5e+8, U = 20825.8, UNom = 21000, generatorConvention = false, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTLV(SNom = 5e+8, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN( R = 0.15e-2 * 419 ^ 2 / 500,
    SNom=500000000,
    UNomA=21000,
    UNomB=419000,                                                                                                                     X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true,
    showPFdata=true,                                                                                                                                                                         portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTHV(SNom = 5e+8, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus GRIDL(P = 4.75e+8, Q = 7.6e+7, SNom = 5e+8, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.PowerFlow.SlackBus GRID(SNom = 5e+8, U = 399000, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(GEN.terminal, NTLV.terminal) annotation (
    Line(points = {{-50, 0}, {-30, 0}, {-30, 0}, {-30, 0}}));
  connect(NTLV.terminal, TGEN.terminalA) annotation (
    Line(points = {{-30, 0}, {-10, 0}, {-10, 0}, {-10, 0}}));
  connect(TGEN.terminalB, NTHV.terminal) annotation (
    Line(points = {{10, 0}, {30, 0}, {30, 0}, {30, 0}}));
  connect(NTHV.terminal, GRID.terminal) annotation (
    Line(points = {{30, 0}, {32, 0}, {32, 20}, {60, 20}, {60, 20}}));
  connect(GRIDL.terminal, NTHV.terminal) annotation (
    Line(points = {{60, -20}, {32, -20}, {32, 0}, {30, 0}}));
  annotation (
    Icon(coordinateSystem(grid={2,2}, extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-60,-40},{80,40}},      grid={2,2})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"));
end PowerFlow;
