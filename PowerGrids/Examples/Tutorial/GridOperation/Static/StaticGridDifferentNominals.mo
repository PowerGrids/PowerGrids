within PowerGrids.Examples.Tutorial.GridOperation.Static;
model StaticGridDifferentNominals "Systems operating in steady-state with different nominal values"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// First System
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_1(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin = {-76, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_1(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {-48, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_1(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {4, 44}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_1( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin = {-24, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_1(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {26, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_1(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, UPhaseStart = 0, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {20, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_1(y = -GEN_1.PStart / GEN_1.SNom)  annotation (
    Placement(visible = true, transformation(origin = {-108, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_1(y = GEN_1.ufPuInStart)  annotation (
    Placement(visible = true, transformation(origin = {-108, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Second System - Transformer nominal voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_2(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin = {-76, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_2(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {-48, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_2(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {4, -2}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_2( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 100000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin = {-24, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_2(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {26, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_2(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, UPhaseStart = 0, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {20, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_2(y = -GEN_2.PStart / GEN_2.SNom)  annotation (
    Placement(visible = true, transformation(origin = {-108, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_2(y = GEN_2.ufPuInStart)  annotation (
    Placement(visible = true, transformation(origin = {-108, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// Third System - Generator Nominal Voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_3(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 10000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin = {-76, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_3(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {-48, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_3(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {2, -58}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_3( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin = {-24, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_3(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {26, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_3(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, UPhaseStart = 0, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {20, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_3(y = -GEN_3.PStart / GEN_3.SNom)  annotation (
    Placement(visible = true, transformation(origin = {-108, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_3(y = GEN_3.ufPuInStart)  annotation (
    Placement(visible = true, transformation(origin = {-108, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PmPu_1.y, GEN_1.PmPu) annotation (
    Line(points = {{-97, 68}, {-86, 68}}, color = {0, 0, 127}));
  connect(ufPuIn_1.y, GEN_1.ufPuIn) annotation (
    Line(points = {{-97, 48}, {-93, 48}, {-93, 60}, {-86, 60}}, color = {0, 0, 127}));
  connect(PmPu_2.y, GEN_2.PmPu) annotation (
    Line(points = {{-97, 22}, {-86, 22}}, color = {0, 0, 127}));
  connect(PmPu_3.y, GEN_3.PmPu) annotation (
    Line(points = {{-97, -34}, {-86, -34}}, color = {0, 0, 127}));
  connect(GEN_1.terminal, NTLV_1.terminal) annotation (
    Line(points = {{-76, 64}, {-76, 44}, {-48, 44}}));
  connect(NTLV_1.terminal, TGEN_1.terminalA) annotation (
    Line(points = {{-48, 44}, {-34, 44}}));
  connect(TGEN_1.terminalB, NTHV_1.terminal) annotation (
    Line(points = {{-14, 44}, {4, 44}}));
  connect(NTHV_1.terminal, GRID_1.terminal) annotation (
    Line(points = {{4, 44}, {4, 54}, {26, 54}}));
  connect(NTHV_1.terminal, GRIDL_1.terminal) annotation (
    Line(points = {{4, 44}, {4, 32}, {20, 32}}));
  connect(GEN_2.terminal, NTLV_2.terminal) annotation (
    Line(points = {{-76, 18}, {-76, -2}, {-48, -2}}));
  connect(NTLV_2.terminal, TGEN_2.terminalA) annotation (
    Line(points = {{-48, -2}, {-34, -2}}));
  connect(TGEN_2.terminalB, NTHV_2.terminal) annotation (
    Line(points = {{-14, -2}, {4, -2}}));
  connect(NTHV_2.terminal, GRID_2.terminal) annotation (
    Line(points = {{4, -2}, {4, 8}, {26, 8}}));
  connect(NTHV_2.terminal, GRIDL_2.terminal) annotation (
    Line(points = {{4, -2}, {4, -14}, {20, -14}}));
  connect(GEN_3.terminal, NTLV_3.terminal) annotation (
    Line(points = {{-76, -38}, {-76, -58}, {-48, -58}}));
  connect(NTLV_3.terminal, TGEN_3.terminalA) annotation (
    Line(points = {{-48, -58}, {-34, -58}}));
  connect(TGEN_3.terminalB, NTHV_3.terminal) annotation (
    Line(points = {{-14, -58}, {2, -58}}));
  connect(NTHV_3.terminal, GRID_3.terminal) annotation (
    Line(points = {{2, -58}, {2, -48}, {26, -48}}));
  connect(NTHV_3.terminal, GRIDL_3.terminal) annotation (
    Line(points = {{2, -58}, {2, -70}, {20, -70}}));
  connect(GEN_2.ufPuIn, ufPuIn_2.y) annotation (
    Line(points = {{-86, 14}, {-94, 14}, {-94, 4}, {-97, 4}}, color = {0, 0, 127}));
  connect(GEN_3.ufPuIn, ufPuIn_3.y) annotation (
    Line(points = {{-86, -42}, {-94, -42}, {-94, -54}, {-97, -54}}, color = {0, 0, 127}));

annotation (
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"),
    Diagram(coordinateSystem(extent={{-120,-80},{100,80}},      grid={2,2}),        graphics={  Text(origin = {65, 42}, extent = {{-21, 4}, {17, -6}}, textString = "reference grid"), Text(origin = {75, 6}, extent = {{-37, 4}, {21, -18}}, textString = "transformer\nnominal voltage changed"), Text(origin = {81, -50}, extent = {{-37, 4}, {17, -14}}, textString = "generator\nnominal voltage changed")}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})));
end StaticGridDifferentNominals;
