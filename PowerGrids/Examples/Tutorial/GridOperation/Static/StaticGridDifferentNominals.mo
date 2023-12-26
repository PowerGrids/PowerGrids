within PowerGrids.Examples.Tutorial.GridOperation.Static;

model StaticGridDifferentNominals "Systems operating in steady-state with different nominal values"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {70, 64}, extent = {{-10, -10}, {10, 10}})));
  // First System
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_1(H = 4, PPF= -4.75e+08, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.08, Tpq0 = 2.16, UNom = 21000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8) annotation(
    Placement(transformation(origin = {-76, 48}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.Bus NTLV_1(UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {-48, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_1(R = 0.15e-2*419^2/500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2*419^2/500, rFixed = 419/21) annotation(
    Placement(visible = true, transformation(origin = {-24, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_1(R_X = 1/10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(visible = true, transformation(origin = {26, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_1(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(visible = true, transformation(origin = {26, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu_1(y = -GEN_1.PStart/GEN_1.SNom) annotation(
    Placement(transformation(origin = {-108, 42}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPuIn_1(y = GEN_1.ufPuInStart) annotation(
    Placement(transformation(origin = {-108, 56}, extent = {{-10, -10}, {10, 10}})));
  // Second System - Transformer nominal voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_2(H = 4, PPF = -4.75e+08, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8) annotation(
    Placement(transformation(origin = {-76, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.Bus NTLV_2(UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {-48, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_2(R = 0.15e-2*419^2/500, SNom = 5e+08, UNomA = 21000, UNomB = 100000, X = 16e-2*419^2/500, rFixed = 419/21) annotation(
    Placement(visible = true, transformation(origin = {-24, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_2(R_X = 1/10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(visible = true, transformation(origin = {26, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_2(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(visible = true, transformation(origin = {26, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu_2(y = -GEN_2.PStart/GEN_2.SNom) annotation(
    Placement(transformation(origin = {-108, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPuIn_2(y = GEN_2.ufPuInStart) annotation(
    Placement(transformation(origin = {-108, 8}, extent = {{-10, -10}, {10, 10}})));
  // Third System - Generator Nominal Voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_3(H = 4, PPF = -4.75e+08, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 10000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8, UPF = 21000) annotation(
    Placement(transformation(origin = {-76, -56}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.Bus NTLV_3(UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {-48, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_3(R = 0.15e-2*419^2/500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2*419^2/500, rFixed = 419/21) annotation(
    Placement(visible = true, transformation(origin = {-24, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_3(R_X = 1/10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(visible = true, transformation(origin = {26, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_3(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(visible = true, transformation(origin = {26, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu_3(y = -GEN_3.PStart/GEN_3.SNom) annotation(
    Placement(transformation(origin = {-108, -62}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPuIn_3(y = GEN_3.ufPuInStart) annotation(
    Placement(transformation(origin = {-108, -48}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(PmPu_1.y, GEN_1.PmPu) annotation(
    Line(points = {{-97, 42}, {-89.5, 42}, {-89.5, 50}, {-82, 50}}, color = {0, 0, 127}));
  connect(ufPuIn_1.y, GEN_1.ufPuIn) annotation(
    Line(points = {{-97, 56}, {-82, 56}}, color = {0, 0, 127}));
  connect(PmPu_2.y, GEN_2.PmPu) annotation(
    Line(points = {{-97, -6}, {-89.5, -6}, {-89.5, 2}, {-82, 2}}, color = {0, 0, 127}));
  connect(PmPu_3.y, GEN_3.PmPu) annotation(
    Line(points = {{-97, -62}, {-89.5, -62}, {-89.5, -54}, {-82, -54}}, color = {0, 0, 127}));
  connect(GEN_1.terminalAC, NTLV_1.terminalAC) annotation(
    Line(points = {{-76, 48}, {-76, 44}, {-48, 44}}));
  connect(NTLV_1.terminalAC, TGEN_1.terminalAC_a) annotation(
    Line(points = {{-48, 44}, {-34, 44}}));
  connect(GEN_2.terminalAC, NTLV_2.terminalAC) annotation(
    Line(points = {{-76, 0}, {-76, -2}, {-48, -2}}));
  connect(NTLV_2.terminalAC, TGEN_2.terminalAC_a) annotation(
    Line(points = {{-48, -2}, {-34, -2}}));
  connect(GEN_3.terminalAC, NTLV_3.terminalAC) annotation(
    Line(points = {{-76, -56}, {-75, -56}, {-75, -58}, {-48, -58}}));
  connect(NTLV_3.terminalAC, TGEN_3.terminalAC_a) annotation(
    Line(points = {{-48, -58}, {-34, -58}}));
  connect(GEN_2.ufPuIn, ufPuIn_2.y) annotation(
    Line(points = {{-82, 8}, {-97, 8}}, color = {0, 0, 127}));
  connect(GEN_3.ufPuIn, ufPuIn_3.y) annotation(
    Line(points = {{-82, -48}, {-97, -48}}, color = {0, 0, 127}));
  connect(TGEN_1.terminalAC_b, GRID_1.terminalAC) annotation(
    Line(points = {{-14, 44}, {26, 44}, {26, 48}}));
  connect(GRID_1.terminalAC, GRIDL_1.terminalAC) annotation(
    Line(points = {{26, 48}, {26, 42}}));
  connect(TGEN_2.terminalAC_b, GRID_2.terminalAC) annotation(
    Line(points = {{-14, -2}, {26, -2}, {26, 4}}));
  connect(GRID_2.terminalAC, GRIDL_2.terminalAC) annotation(
    Line(points = {{26, 4}, {26, -6}}));
  connect(TGEN_3.terminalAC_b, GRID_3.terminalAC) annotation(
    Line(points = {{-14, -58}, {26, -58}, {26, -54}}));
  connect(GRID_3.terminalAC, GRIDL_3.terminalAC) annotation(
    Line(points = {{26, -54}, {26, -62}}));
  annotation(
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    Diagram(coordinateSystem(extent = {{-140, 80}, {100, -80}}, grid = {2, 2}), graphics = {Text(origin = {65, 42}, extent = {{-21, 4}, {17, -6}}, textString = "reference grid"), Text(origin = {75, 6}, extent = {{-37, 4}, {21, -18}}, textString = "transformer
nominal voltage changed"), Text(origin = {81, -50}, extent = {{-37, 4}, {17, -14}}, textString = "generator
nominal voltage changed")}),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, grid = {2, 2})));
end StaticGridDifferentNominals;
