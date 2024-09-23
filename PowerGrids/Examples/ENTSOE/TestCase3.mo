within PowerGrids.Examples.ENTSOE;

model TestCase3 "Test Case 3, Section 5.3, focuses on the dynamic behavior of the model for the synchronous machine with its whole control in response to a short-circuit"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {48, 40}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PPF = -4.75e+08, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8) annotation(
    Placement(transformation(origin = {-18, 0}, extent = {{-10, 10}, {10, -10}})));
  PowerGrids.Electrical.Buses.Bus NTLV(UNom = 21000) annotation(
    Placement(transformation(origin = {8, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(R = 0.15e-2*419^2/500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2*419^2/500, rFixed = 419/21) annotation(
    Placement(transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1) annotation(
    Placement(transformation(origin = {-54, 28}, extent = {{-10, 10}, {10, -10}})));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4) annotation(
    Placement(transformation(origin = {-54, -16}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Controls.PowerSystemStabilizers.IEEE_PSS2A PSS(Ks1 = 10, Ks2 = 0.1564, M = 0, N = 0, T1 = 0.25, T2 = 0.03, T3 = 0.15, T4 = 0.015, T7 = 2, T8 = 0.5, T9 = 0.1, Tw1 = 2, Tw2 = 2, Tw3 = 2, Tw4 = 0, VstMax = 0.1, VstMin = -0.1) annotation(
    Placement(transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(transformation(origin = {-94, -48}, extent = {{-12, -10}, {12, 10}})));
  Modelica.Blocks.Sources.RealExpression VrefPu(y = 1.004552) annotation(
    Placement(transformation(origin = {-94, -31}, extent = {{-12, -11}, {12, 11}})));
  Modelica.Blocks.Sources.RealExpression RefLPu(y = 475/500*0.05) annotation(
    Placement(transformation(origin = {-90, 24}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRef = 4.75e+08, QRef = 7.6e+07, SNom = 500000000, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(transformation(origin = {66, -34}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1/10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.050*380e3) annotation(
    Placement(transformation(origin = {66, -10}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Faults.ThreePhaseFault FAULT(R = 0.05, SNom = 5e+08, UNom = 380000, X = 0, startTime = 0.1, stopTime = 0.2) annotation(
    Placement(transformation(origin = {86, -34}, extent = {{-10, -10}, {10, 10}})));
  Types.PerUnit AA_01_GEN_Upu = GEN.port.VPu "Fig. 5.7, terminal voltage";
  Types.PerUnit AA_02_GEN_efd = GEN.ufPuIn "Fig. 5.8, excitation voltage";
  Types.PerUnit AA_03_GEN_Ppu = GEN.port.PGenPu/0.95 "Fig. 5.9, active power of the synchronous machine";
  Types.PerUnit AA_04_GEN_Qpu = GEN.port.QGenPu/0.314583 "Fig. 5.10, reactive power of the synchronous machine";
  Types.PerUnit AA_05_GEN_omegapu = GEN.omegaPu "Fig. 5.11, speed";
  Types.PerUnit AA_06_PSS_out = PSS.VstPu "Fig. 5.12, PSS output signal";
  Types.PerUnit AA_07_GRIDL_Ppu = GRIDL.port.PPu/0.95 "Fig. 5.13, active power of the load";
  Types.PerUnit AA_08_GRIDL_Qpu = GRIDL.port.QPu/0.1519 "Fig. 5.14, reactive power of the load";
equation
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-80.8, -31}, {-81.3, -31}, {-81.3, -31}, {-77.8, -31}, {-77.8, -18}, {-71.8, -18}, {-71.8, -18}, {-63.8, -18}}, color = {0, 0, 127}));
  connect(GEN.PPu, PSS.Vsi2Pu) annotation(
    Line(points = {{-12, 5}, {-4, 5}, {-4, 50}, {-112, 50}, {-112, -6}, {-100, -6}}, color = {0, 0, 127}));
  connect(GEN.VPu, AVR.VcPu) annotation(
    Line(points = {{-12, 7}, {0, 7}, {0, 54}, {-116, 54}, {-116, -14}, {-64, -14}}, color = {0, 0, 127}));
  connect(RefLPu.y, TGOV.RefLPu) annotation(
    Line(points = {{-79, 24}, {-64, 24}}, color = {0, 0, 127}));
  connect(zero.y, AVR.VuelPu) annotation(
    Line(points = {{-80.8, -48}, {-71.8, -48}, {-71.8, -22}, {-63.8, -22}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, PSS.Vsi1Pu) annotation(
    Line(points = {{-12, 3}, {-8, 3}, {-8, 46}, {-108, 46}, {-108, 6}, {-100, 6}}, color = {0, 0, 127}));
  connect(PSS.VstPu, AVR.VsPu) annotation(
    Line(points = {{-79, 0}, {-68.5, 0}, {-68.5, -10}, {-64, -10}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation(
    Line(points = {{-43, -16}, {-36, -16}, {-36, 8}, {-24, 8}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation(
    Line(points = {{-12, 3}, {-8, 3}, {-8, 46}, {-76, 46}, {-76, 32}, {-64, 32}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{-44, 28}, {-32, 28}, {-32, 2}, {-24, 2}}, color = {0, 0, 127}));
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation(
    Line(points = {{8, -20}, {20, -20}}));
  connect(GEN.terminalAC, NTLV.terminalAC) annotation(
    Line(points = {{-18, 0}, {-18, -20}, {8, -20}}));
  connect(TGEN.terminalAC_b, GRID.terminalAC) annotation(
    Line(points = {{40, -20}, {66, -20}, {66, -10}, {66, -10}}));
  connect(GRIDL.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{66, -34}, {66, -10}}));
  connect(FAULT.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{86, -34}, {86, -20}, {66, -20}, {66, -10}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-120, 60}, {100, -60}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing");
end TestCase3;
