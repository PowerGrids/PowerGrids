within PowerGrids.Examples.ENTSOE;

model TestCase2 "Test Case 2, Section 5.2, focuses on the dynamic behavior of the model for the synchronous generator and its governor"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(computePF = false) annotation(
    Placement(transformation(origin = {62, 24}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, SNom = 4.75e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8) annotation(
    Placement(transformation(origin = {16, -6}, extent = {{-10, 10}, {10, -10}})));
  PowerGrids.Electrical.Buses.ReferenceBus NGEN(SNom = 5e+08, UNom = 21000) annotation(
    Placement(transformation(origin = {60, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1) annotation(
    Placement(transformation(origin = {-20, 16}, extent = {{-10, 10}, {10, -10}})));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4) annotation(
    Placement(transformation(origin = {-20, -22}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(transformation(origin = {-62, -46}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Blocks.Sources.RealExpression VrefPu(y = 1.00943) annotation(
    Placement(transformation(origin = {-62, -31}, extent = {{-12, -11}, {12, 11}})));
  Modelica.Blocks.Sources.RealExpression RefLPu(y = 380/475*0.05) annotation(
    Placement(transformation(origin = {-56, 12}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQInputs LOAD(SNom = 475000000, UNom = 21000) annotation(
    Placement(transformation(origin = {68, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step PLoad(height = 23.75e6, offset = 380e6, startTime = 0.1) annotation(
    Placement(transformation(origin = {28, -40}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Blocks.Sources.RealExpression zero2 annotation(
    Placement(transformation(origin = {28, -66}, extent = {{-12, -10}, {12, 10}})));
  Types.PerUnit AA_01_GEN_UPu = GEN.port.VPu "Fig. 5-3, terminal voltage";
  Types.PerUnit AA_02_GEN_PPu = GEN.port.PGenPu "Fig. 5-4, active power of the synchronous machine";
  Types.PerUnit AA_03_GEN_PmechPu = GEN.PmPu "Fig. 5-5, mechanical power of the synchronous machine";
  Types.PerUnit AA_04_GEN_omegaPu = GEN.omegaPu "Fig. 5-6, speed";
equation
  connect(GEN.VPu, AVR.VcPu) annotation(
    Line(points = {{22, 1}, {32, 1}, {32, 34}, {-72, 34}, {-72, -20}, {-30, -20}}, color = {0, 0, 127}));
  connect(zero2.y, LOAD.QRefIn) annotation(
    Line(points = {{41.2, -66}, {45.4, -66}, {45.4, -54}, {57.4, -54}}, color = {0, 0, 127}));
  connect(zero.y, AVR.VuelPu) annotation(
    Line(points = {{-48.8, -46}, {-37.6, -46}, {-37.6, -28}, {-29.6, -28}}, color = {0, 0, 127}));
  connect(zero.y, AVR.VsPu) annotation(
    Line(points = {{-48.8, -46}, {-37.8, -46}, {-37.8, -16}, {-29.8, -16}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-48.8, -31}, {-43.6, -31}, {-43.6, -24}, {-29.6, -24}}, color = {0, 0, 127}));
  connect(PLoad.y, LOAD.PRefIn) annotation(
    Line(points = {{36.8, -40}, {45.8, -40}, {45.8, -48}, {57.8, -48}}, color = {0, 0, 127}));
  connect(NGEN.terminalAC, LOAD.terminalAC) annotation(
    Line(points = {{60, -26}, {68, -26}, {68, -44}}));
  connect(RefLPu.y, TGOV.RefLPu) annotation(
    Line(points = {{-45, 12}, {-30, 12}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation(
    Line(points = {{-9, -22}, {-2, -22}, {-2, 2}, {10, 2}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation(
    Line(points = {{22, -3}, {28, -3}, {28, 30}, {-36, 30}, {-36, 20}, {-30, 20}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{-10, 16}, {2, 16}, {2, -4}, {10, -4}}, color = {0, 0, 127}));
  connect(GEN.terminalAC, NGEN.terminalAC) annotation(
    Line(points = {{16, -6}, {16, -26}, {60, -26}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-80, -80}, {80, 40}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing");
end TestCase2;
