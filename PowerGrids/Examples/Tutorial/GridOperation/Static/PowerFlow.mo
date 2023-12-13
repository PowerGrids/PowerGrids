within PowerGrids.Examples.Tutorial.GridOperation.Static;
model PowerFlow "Power flow for the basic grid used in the tutorial"
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.PowerFlow.PVBus GEN(P = -4.75e+8, SNom = 5e+8, U = 20825.8, UNom = 21000)  annotation (
    Placement(transformation(origin = {-40, 0}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.PowerFlow.BusPF NTLV(UNom = 21000)  annotation (
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.PowerFlow.TransformerFixedRatioPF TGEN( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+8, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus GRIDL(P = 4.75e+8, Q = 7.6e+7, SNom = 5e+8, UNom = 380000)  annotation (
    Placement(visible = true, transformation(origin = {40, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus GRID(SNom = 5e+8, U = 399000, UNom = 380000)  annotation (
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(GEN.terminalAC, NTLV.terminalAC) annotation(
    Line(points = {{-40, 0}, {-30, 0}}));
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation(
    Line(points = {{-30, 0}, {-10, 0}, {-10, 0}, {-10, 0}}));
  connect(GRID.terminalAC, TGEN.terminalAC_b) annotation(
    Line(points = {{60, 20}, {40, 20}, {40, 0}, {10, 0}}));
  connect(GRID.terminalAC, GRIDL.terminalAC) annotation(
    Line(points = {{60, 20}, {40, 20}, {40, -14}}));
  annotation (
    Icon(coordinateSystem(grid={2,2}, extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(extent={{-60,-40},{80,40}},      grid={2,2})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing");
end PowerFlow;
