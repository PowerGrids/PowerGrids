within PowerGrids.Examples.Tutorial.GridOperation.LoadChange;

model LoadChangeByModifier "Load step response specified by modifiers on a copy of the static system"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart = -4.75e+08, QStart = -1.56e+08, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8) annotation(
    Placement(transformation(origin = {-26, 6}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.Bus NTLV(UNom = 21000, portVariablesPhases = true, UStart = 0.9917*21e3, UPhaseStart = 0.161156) annotation(
    Placement(visible = true, transformation(origin = {-6, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2*419^2/500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2*419^2/500, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {16, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1/10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05*380e3, portVariablesPhases = true, UStart = 0.95227*380e3) annotation(
    Placement(visible = true, transformation(origin = {68, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRef = 4.75e+08*(if time < 2 then 1 else 1.05) "Active power consumption at reference voltage", QRef = 7.6e+07*(if time < 2 then 1 else 1.04) "Reactive power consumption at reference voltage", SNom = 5e+08, UNom = 380000, URef = 1.05*380e3, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {68, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu(y = -GEN.PStart/GEN.SNom) annotation(
    Placement(transformation(origin = {-60, 8}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPuIn(y = GEN.ufPuInStart) annotation(
    Placement(transformation(origin = {-60, 22}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(PmPu.y, GEN.PmPu) annotation(
    Line(points = {{-49, 8}, {-32, 8}}, color = {0, 0, 127}));
  connect(ufPuIn.y, GEN.ufPuIn) annotation(
    Line(points = {{-49, 22}, {-39.5, 22}, {-39.5, 14}, {-32, 14}}, color = {0, 0, 127}));
  connect(GEN.terminalAC, NTLV.terminalAC) annotation(
    Line(points = {{-26, 6}, {-26, -16}, {-6, -16}}));
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation(
    Line(points = {{-6, -16}, {6, -16}}));
  connect(TGEN.terminalAC_b, GRID.terminalAC) annotation(
    Line(points = {{26, -16}, {68, -16}, {68, -6}}));
  connect(GRID.terminalAC, GRIDL.terminalAC) annotation(
    Line(points = {{68, -6}, {68, -26}}));
  annotation(
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.008),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls = "kinsol", lv = "LOG_INIT_HOMOTOPY"),
    Diagram(coordinateSystem(extent = {{-80, -60}, {80, 40}}), graphics = {Text(origin = {-2.2, -48}, extent = {{-59.8, 8}, {70.2, -12}}, textString = "To see load change in OpenModelica look at text view")}),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {2, 2})));
end LoadChangeByModifier;
