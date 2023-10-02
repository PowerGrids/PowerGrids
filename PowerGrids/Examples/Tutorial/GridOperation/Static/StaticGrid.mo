within PowerGrids.Examples.Tutorial.GridOperation.Static;
model StaticGrid "System operating in steady-state with given inputs"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin = {62, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(transformation(origin = {-34, 2}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.Bus NTLV(UNom = 21000, portVariablesPhases = true, UStart = 21e3*0.9917, UPhaseStart = 0.161156)  annotation (
    Placement(visible = true, transformation(origin={2,-18},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true)  annotation (
    Placement(visible = true, transformation(origin={18,-18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1 / 10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true)  annotation (
    Placement(visible = true, transformation(origin={64,-8},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true)  annotation (
    Placement(visible = true, transformation(origin={64,-24},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu(y = 0.95)  annotation (
    Placement(transformation(origin = {-64, 4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPuIn(y = 2.50826)  annotation (
    Placement(transformation(origin = {-64, 20}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(PmPu.y, GEN.PmPu) annotation(
    Line(points = {{-53, 4}, {-40, 4}}, color = {0, 0, 127}));
  connect(ufPuIn.y, GEN.ufPuIn) annotation(
    Line(points = {{-53, 20}, {-45.5, 20}, {-45.5, 10}, {-40, 10}}, color = {0, 0, 127}));
  connect(GEN.terminalAC, NTLV.terminalAC) annotation(
    Line(points = {{-34, 2}, {-34, -18}, {2, -18}}));
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation(
    Line(points = {{2, -18}, {8, -18}}));
  connect(TGEN.terminalAC_b, GRID.terminalAC) annotation(
    Line(points = {{28, -18}, {64, -18}, {64, -8}}));
  connect(GRID.terminalAC, GRIDL.terminalAC) annotation(
    Line(points = {{64, -8}, {64, -24}}));
  annotation (
    Icon(coordinateSystem(grid={2,2}, extent={{-100,-100},{100,100}})),
    Diagram(coordinateSystem(grid={2,2},        extent={{-80,-40},{80,40}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY"));
end StaticGrid;
