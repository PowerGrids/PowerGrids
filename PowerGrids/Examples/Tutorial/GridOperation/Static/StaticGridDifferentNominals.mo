within PowerGrids.Examples.Tutorial.GridOperation.Static;
model StaticGridDifferentNominals "Systems operating in steady-state with different nominal values"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// First System
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_1(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation(
    Placement(visible = true, transformation(origin = {-116, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_1(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {-66, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_1(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {-2, 52}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_1( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation(
    Placement(visible = true, transformation(origin = {-36, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_1(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {20, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_1(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, UPhaseStart = 0, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {14, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_1(y = -GEN_1.PStart / GEN_1.SNom)  annotation(
    Placement(visible = true, transformation(origin = {-150, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_1(y = GEN_1.ufPuInStart)  annotation(
    Placement(visible = true, transformation(origin = {-150, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Second System - Transformer nominal voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_2(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation(
    Placement(visible = true, transformation(origin = {-116, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_2(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {-66, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_2(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {-2, -8}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_2( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 100000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation(
    Placement(visible = true, transformation(origin = {-36, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_2(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {20, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_2(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, UPhaseStart = 0, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {14, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_2(y = -GEN_2.PStart / GEN_2.SNom)  annotation(
    Placement(visible = true, transformation(origin = {-150, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_2(y = GEN_2.ufPuInStart)  annotation(
    Placement(visible = true, transformation(origin = {-150, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// Third System - Generator Nominal Voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_3(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 10000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation(
    Placement(visible = true, transformation(origin = {-116, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_3(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {-66, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_3(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {-4, -68}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_3( R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation(
    Placement(visible = true, transformation(origin = {-36, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_3(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {20, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_3(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, UPhaseStart = 0, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation(
    Placement(visible = true, transformation(origin = {14, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_3(y = -GEN_3.PStart / GEN_3.SNom)  annotation(
    Placement(visible = true, transformation(origin = {-150, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_3(y = GEN_3.ufPuInStart)  annotation(
    Placement(visible = true, transformation(origin = {-150, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PmPu_1.y, GEN_1.PmPu) annotation(
    Line(points = {{-138, 76}, {-128, 76}, {-128, 76}, {-126, 76}}, color = {0, 0, 127}));
  connect(ufPuIn_1.y, GEN_1.ufPuIn) annotation(
    Line(points = {{-138, 52}, {-134, 52}, {-134, 68}, {-126, 68}, {-126, 68}}, color = {0, 0, 127}));
  connect(PmPu_2.y, GEN_2.PmPu) annotation(
    Line(points = {{-138, 16}, {-126, 16}, {-126, 16}, {-126, 16}}, color = {0, 0, 127}));
  connect(ufPuIn_2.y, GEN_2.ufPuIn) annotation(
    Line(points = {{-138, -8}, {-134, -8}, {-134, 8}, {-126, 8}, {-126, 8}}, color = {0, 0, 127}));
  connect(PmPu_3.y, GEN_3.PmPu) annotation(
    Line(points = {{-138, -44}, {-128, -44}, {-128, -44}, {-126, -44}}, color = {0, 0, 127}));
  connect(ufPuIn_3.y, GEN_3.ufPuIn) annotation(
    Line(points = {{-138, -68}, {-134, -68}, {-134, -52}, {-126, -52}, {-126, -52}}, color = {0, 0, 127}));
  connect(GEN_1.terminal, NTLV_1.terminal) annotation(
    Line(points = {{-116, 72}, {-116, 72}, {-116, 52}, {-66, 52}, {-66, 52}}));
  connect(NTLV_1.terminal, TGEN_1.terminalA) annotation(
    Line(points = {{-66, 52}, {-46, 52}, {-46, 52}, {-46, 52}}));
  connect(TGEN_1.terminalB, NTHV_1.terminal) annotation(
    Line(points = {{-26, 52}, {-2, 52}, {-2, 52}, {-2, 52}}));
  connect(NTHV_1.terminal, GRID_1.terminal) annotation(
    Line(points = {{-2, 52}, {4, 52}, {4, 62}, {20, 62}, {20, 62}}));
  connect(NTHV_1.terminal, GRIDL_1.terminal) annotation(
    Line(points = {{-2, 52}, {4, 52}, {4, 40}, {14, 40}, {14, 40}}));
  connect(GEN_2.terminal, NTLV_2.terminal) annotation(
    Line(points = {{-116, 12}, {-116, 12}, {-116, -8}, {-66, -8}, {-66, -8}}));
  connect(NTLV_2.terminal, TGEN_2.terminalA) annotation(
    Line(points = {{-66, -8}, {-46, -8}, {-46, -8}, {-46, -8}}));
  connect(TGEN_2.terminalB, NTHV_2.terminal) annotation(
    Line(points = {{-26, -8}, {-2, -8}, {-2, -8}, {-2, -8}}));
  connect(NTHV_2.terminal, GRID_2.terminal) annotation(
    Line(points = {{-2, -8}, {4, -8}, {4, 2}, {20, 2}, {20, 2}}));
  connect(NTHV_2.terminal, GRIDL_2.terminal) annotation(
    Line(points = {{-2, -8}, {4, -8}, {4, -20}, {14, -20}, {14, -20}}));
  connect(GEN_3.terminal, NTLV_3.terminal) annotation(
    Line(points = {{-116, -48}, {-116, -48}, {-116, -68}, {-66, -68}, {-66, -68}}));
  connect(NTLV_3.terminal, TGEN_3.terminalA) annotation(
    Line(points = {{-66, -68}, {-46, -68}, {-46, -68}, {-46, -68}}));
  connect(TGEN_3.terminalB, NTHV_3.terminal) annotation(
    Line(points = {{-26, -68}, {-4, -68}, {-4, -68}, {-4, -68}}));
  connect(NTHV_3.terminal, GRID_3.terminal) annotation(
    Line(points = {{-4, -68}, {2, -68}, {2, -58}, {20, -58}}));
  connect(NTHV_3.terminal, GRIDL_3.terminal) annotation(
    Line(points = {{-4, -68}, {2, -68}, {2, -80}, {14, -80}, {14, -80}}));

annotation(
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"),        
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5}), graphics = {Text(origin = {81, 50}, extent = {{-21, 4}, {21, -4}}, textString = "reference grid"), Text(origin = {97, 6}, extent = {{-37, 4}, {75, -36}}, textString = "transformer nominal voltage changed"), Text(origin = {97, -54}, extent = {{-37, 4}, {75, -36}}, textString = "generator nominal voltage changed")}));

end StaticGridDifferentNominals;
