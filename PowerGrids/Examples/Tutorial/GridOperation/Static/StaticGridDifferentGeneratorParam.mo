within PowerGrids.Examples.Tutorial.GridOperation.Static;
model StaticGridDifferentGeneratorParam "Systems operating in steady-state with different generator parameterss"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin={95.5, 64},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// First Grid
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_1(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin={-69.5, 50},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_1(UNom = 21000, portVariablesPhases = true, UStart = 21e3*0.9917, UPhaseStart = 0.161156)  annotation (
    Placement(visible = true, transformation(origin={-34.5, 34},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_1(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin={-15, 34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_1(R_X = 1 / 10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true, UStart = 0.95227*380e3)  annotation (
    Placement(visible = true, transformation(origin={49.5, 40},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_1(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true)  annotation (
    Placement(visible = true, transformation(origin={49.5, 28},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu_1(y = -GEN_1.PStart / GEN_1.SNom)  annotation (
    Placement(visible = true, transformation(origin={-103.5, 54},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_1(y = GEN_1.ufPuInStart)  annotation (
    Placement(visible = true, transformation(origin={-103.5, 35},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Second Grid - Transformer nominal voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_2(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin={-69.5, -6},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_2(UNom = 21000, portVariablesPhases = true, UStart = 21e3*0.9917, UPhaseStart = 0.161156)  annotation (
    Placement(visible = true, transformation(origin={-34.5, -22},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_2(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin={-14.5, -22},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_2(R_X = 1 / 10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true, UStart = 0.95227*380e3)  annotation (
    Placement(visible = true, transformation(origin={51.5, -14},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_2(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true)  annotation (
    Placement(visible = true, transformation(origin={51.5, -26},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu_2(y = -GEN_2.PStart / GEN_2.SNom)  annotation (
    Placement(visible = true, transformation(origin={-103.5, -2},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_2(y = GEN_2.ufPuInStart)  annotation (
    Placement(visible = true, transformation(origin={-103.5, -21},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// Third Grid - Generator Nominal Voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4WindingsInternalParameters GEN_3(H = 4, LDPu = 0.2, LQ1Pu = 0.444231, LQ2Pu = 0.2625, LdPu = 0.15, LfPu = 0.224242, LqPu = 0.15, MdPu = 1.85, MqPu = 1.65, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, UNom = 21000, mrcPu = 0, portVariablesPhases = true, rDPu = 0.0303152, rQ1Pu = 0.00308618, rQ2Pu = 0.0234897, raPu = 0, rfPu = 0.00128379)  annotation (
    Placement(visible = true, transformation(origin={-69.5, -62},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_3(UNom = 21000, portVariablesPhases = true, UStart = 21e3*0.9917, UPhaseStart = 0.161156)  annotation (
    Placement(visible = true, transformation(origin={-34.5, -78},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_3(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin={-4.5, -78},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_3(R_X = 1 / 10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true, UStart = 0.95227*380e3)  annotation (
    Placement(visible = true, transformation(origin={51.5, -72},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_3(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true)  annotation (
    Placement(visible = true, transformation(origin={51.5, -84},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu_3(y = 0.95)  annotation (
    Placement(visible = true, transformation(origin={-103.5, -58},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_3(y = 2.50826)  annotation (
    Placement(visible = true, transformation(origin={-103.5, -76.5},extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PmPu_1.y, GEN_1.PmPu) annotation(
    Line(points = {{-92.5, 54}, {-79.5, 54}}, color = {0, 0, 127}));
  connect(ufPuIn_1.y, GEN_1.ufPuIn) annotation(
    Line(points = {{-92.5, 35}, {-86.5, 35}, {-86.5, 46}, {-79.5, 46}}, color = {0, 0, 127}));
  connect(PmPu_2.y, GEN_2.PmPu) annotation(
    Line(points = {{-92.5, -2}, {-79.5, -2}}, color = {0, 0, 127}));
  connect(ufPuIn_2.y, GEN_2.ufPuIn) annotation(
    Line(points = {{-92.5, -21}, {-85.5, -21}, {-85.5, -10}, {-79.5, -10}}, color = {0, 0, 127}));
  connect(PmPu_3.y, GEN_3.PmPu) annotation(
    Line(points = {{-92.5, -58}, {-79.5, -58}}, color = {0, 0, 127}));
  connect(ufPuIn_3.y, GEN_3.ufPuIn) annotation(
    Line(points = {{-92.5, -76.5}, {-86, -76.5}, {-86, -65.5}, {-83, -65.5}, {-83, -66}, {-79.5, -66}}, color = {0, 0, 127}));
  connect(GEN_1.terminalAC, NTLV_1.terminalAC) annotation(
    Line(points = {{-69.5, 50}, {-69.5, 34}, {-34.5, 34}}));
  connect(NTLV_1.terminalAC, TGEN_1.terminalAC_a) annotation(
    Line(points = {{-34.5, 34}, {-25, 34}}));
  connect(GEN_2.terminalAC, NTLV_2.terminalAC) annotation(
    Line(points = {{-69.5, -6}, {-69.5, -22}, {-34.5, -22}}));
  connect(NTLV_2.terminalAC, TGEN_2.terminalAC_a) annotation(
    Line(points = {{-34.5, -22}, {-24.5, -22}}));
  connect(GEN_3.terminalAC, NTLV_3.terminalAC) annotation(
    Line(points = {{-69.5, -62}, {-69.5, -78}, {-34.5, -78}}));
  connect(NTLV_3.terminalAC, TGEN_3.terminalAC_a) annotation(
    Line(points = {{-34.5, -78}, {-14.5, -78}}));
  connect(TGEN_1.terminalAC_b, GRID_1.terminalAC) annotation(
    Line(points = {{-4, 34}, {50, 34}, {50, 40}}));
  connect(GRID_1.terminalAC, GRIDL_1.terminalAC) annotation(
    Line(points = {{50, 40}, {50, 28}}));
  connect(TGEN_2.terminalAC_b, GRID_2.terminalAC) annotation(
    Line(points = {{-4, -22}, {52, -22}, {52, -14}}));
  connect(GRID_2.terminalAC, GRIDL_2.terminalAC) annotation(
    Line(points = {{52, -14}, {52, -26}}));
  connect(TGEN_3.terminalAC_b, GRID_3.terminalAC) annotation(
    Line(points = {{6, -78}, {51.5, -78}, {51.5, -72}}));
  connect(GRID_3.terminalAC, GRIDL_3.terminalAC) annotation(
    Line(points = {{51.5, -72}, {51.5, -84}}));
  annotation (
     experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY"),
    Diagram(coordinateSystem(extent={{-120,-100},{120,80}},      grid={2,2}),        graphics={Text(origin = {100.5, 28}, extent = {{-33, 4}, {17, -6}}, textString = "generator parameters:
time constant"), Text(origin = {108.5, -58}, extent = {{-37, 4}, {5, -16}}, textString = "generator parameters:
physical"), Text(origin = {118.5, -12}, extent = {{-49, 4}, {-3, -26}}, textString = "generator parameters:
time constant - Kundur")}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})));
end StaticGridDifferentGeneratorParam;
