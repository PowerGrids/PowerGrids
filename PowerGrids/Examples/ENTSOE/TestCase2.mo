within PowerGrids.Examples.ENTSOE;

model TestCase2 "Test Case 2, Section 5.2, focuses on the dynamic behavior of the model for the synchronous generator and its governor"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(computePF = false) annotation(
    Placement(transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, SNom = 4.75e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8) annotation(
    Placement(transformation(origin = {-26, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.ReferenceBus NGEN(SNom = 5e+08, UNom = 21000) annotation(
    Placement(visible = true, transformation(origin = {24, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1) annotation(
    Placement(visible = true, transformation(origin = {-62, 28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4) annotation(
    Placement(visible = true, transformation(origin = {-62, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(transformation(origin = {-104, -40}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Blocks.Sources.RealExpression VrefPu(y = 1.00943) annotation(
    Placement(visible = true, transformation(origin = {-104, -25}, extent = {{-12, -11}, {12, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression RefLPu(y = 380/475*0.05) annotation(
    Placement(visible = true, transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQInputs LOAD(SRef = 475000000, URef = 21000) annotation(
    Placement(visible = true, transformation(origin = {32, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step PLoad(height = 23.75e6, offset = 380e6, startTime = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-8, -34}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero2 annotation(
    Placement(visible = true, transformation(origin = {-8, -62}, extent = {{-12, -10}, {12, 10}}, rotation = 0)));
  Types.PerUnit AA_01_GEN_UPu = GEN.port.VPu "Fig. 5-3, terminal voltage";
  Types.PerUnit AA_02_GEN_PPu = GEN.port.PGenPu "Fig. 5-4, active power of the synchronous machine";
  Types.PerUnit AA_03_GEN_PmechPu = GEN.PmPu "Fig. 5-5, mechanical power of the synchronous machine";
  Types.PerUnit AA_04_GEN_omegaPu = GEN.omegaPu "Fig. 5-6, speed";
equation
  connect(GEN.VPu, AVR.VcPu) annotation(
    Line(points = {{-20, 7}, {0, 7}, {0, 52}, {-120, 52}, {-120, -14}, {-72, -14}}, color = {0, 0, 127}));
  connect(zero2.y, LOAD.QRefIn) annotation(
    Line(points = {{6, -62}, {10, -62}, {10, -48}, {22, -48}, {22, -48}}, color = {0, 0, 127}));
  connect(zero.y, AVR.VuelPu) annotation(
    Line(points = {{-91, -40}, {-79.8, -40}, {-79.8, -22}, {-71.8, -22}}, color = {0, 0, 127}));
  connect(zero.y, AVR.VsPu) annotation(
    Line(points = {{-91, -40}, {-80, -40}, {-80, -10}, {-72, -10}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-91, -25}, {-85.8, -25}, {-85.8, -18}, {-71.8, -18}}, color = {0, 0, 127}));
  connect(PLoad.y, LOAD.PRefIn) annotation(
    Line(points = {{1, -34}, {10, -34}, {10, -42}, {22, -42}}, color = {0, 0, 127}));
  connect(NGEN.terminalAC, LOAD.terminalAC) annotation(
    Line(points = {{24, -20}, {32, -20}, {32, -38}}));
  connect(RefLPu.y, TGOV.RefLPu) annotation(
    Line(points = {{-87, 24}, {-72, 24}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation(
    Line(points = {{-51, -16}, {-44, -16}, {-44, 8}, {-32, 8}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation(
    Line(points = {{-20, 3}, {-8, 3}, {-8, 44}, {-84, 44}, {-84, 32}, {-72, 32}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{-52, 28}, {-40, 28}, {-40, 2}, {-32, 2}}, color = {0, 0, 127}));
  connect(GEN.terminalAC, NGEN.terminalAC) annotation(
    Line(points = {{-26, 0}, {-26, -20}, {24, -20}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-140, 60}, {80, -80}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls = "kinsol", lv = "LOG_INIT_HOMOTOPY", homotopyOnFirstTry = "()"));
end TestCase2;
