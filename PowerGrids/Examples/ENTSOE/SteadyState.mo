within PowerGrids.Examples.ENTSOE;

model SteadyState "Reproduces the basic static power flow, see fig. 3-1 of the report"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8, PPF = -4.75e8) annotation(
    Placement(transformation(origin = {-26, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.Bus NTLV(UNom = 21000) annotation(
    Placement(transformation(origin = {14, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(R = 0.15e-2*419^2/500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2*419^2/500, rFixed = 419/21) annotation(
    Placement(transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1) annotation(
    Placement(visible = true, transformation(origin = {-62, 28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4) annotation(
    Placement(visible = true, transformation(origin = {-62, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.PowerSystemStabilizers.IEEE_PSS2A PSS(Ks1 = 10, Ks2 = 0.1564, M = 0, N = 0, T1 = 0.25, T2 = 0.03, T3 = 0.15, T4 = 0.015, T7 = 2, T8 = 0.5, T9 = 0.1, Tw1 = 2, Tw2 = 2, Tw3 = 2, Tw4 = 0, VstMax = 0.1, VstMin = -0.1) annotation(
    Placement(visible = true, transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(visible = true, transformation(origin = {-102, -48}, extent = {{-12, -10}, {12, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPu(y = 1.004552) annotation(
    Placement(visible = true, transformation(origin = {-102, -31}, extent = {{-12, -11}, {12, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression RefLPu(y = 475/500*0.05) annotation(
    Placement(visible = true, transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(transformation(origin = {76, -50}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1/10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05*380e3) annotation(
    Placement(transformation(origin = {76, 0}, extent = {{-10, -10}, {10, 10}})));
  Types.PerUnit AA_01_NGEN_U = GEN.VPu;
  Types.PerUnit AA_02_NGRID_U = GRID.port.VPu;
  Types.Angle AA_03_NGRID_delta = GRID.port.UPhase;
  Types.Angle AA_04_NGEN_delta = GEN.port.UPhase;
  Types.ActivePower AA_05_PG = GEN.port.PGen;
  Types.ReactivePower AA_06_QG = GEN.port.QGen;
  Types.ActivePower AA_07_PGRID = -GRID.port.P;
  Types.ReactivePower AA_08_QGRID = -GRID.port.Q;
  Types.ActivePower AA_09_PGRIDL = GRIDL.port.P;
  Types.ReactivePower AA_10_QGRIDL = GRIDL.port.Q;
equation
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-88.8, -31}, {-89.3, -31}, {-89.3, -31}, {-85.8, -31}, {-85.8, -18}, {-79.8, -18}, {-79.8, -18}, {-71.8, -18}}, color = {0, 0, 127}));
  connect(GEN.PPu, PSS.Vsi2Pu) annotation(
    Line(points = {{-20, 5}, {0, 5}, {0, 56}, {-130, 56}, {-130, -6}, {-108, -6}}, color = {0, 0, 127}));
  connect(GEN.VPu, AVR.VcPu) annotation(
    Line(points = {{-20, 7}, {10, 7}, {10, 64}, {-140, 64}, {-140, -14}, {-72, -14}}, color = {0, 0, 127}));
  connect(RefLPu.y, TGOV.RefLPu) annotation(
    Line(points = {{-87, 24}, {-72, 24}}, color = {0, 0, 127}));
  connect(zero.y, AVR.VuelPu) annotation(
    Line(points = {{-88.8, -48}, {-79.8, -48}, {-79.8, -22}, {-71.8, -22}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, PSS.Vsi1Pu) annotation(
    Line(points = {{-20, 3}, {-8, 3}, {-8, 48}, {-124, 48}, {-124, 6}, {-108, 6}}, color = {0, 0, 127}));
  connect(PSS.VstPu, AVR.VsPu) annotation(
    Line(points = {{-87, 0}, {-76.5, 0}, {-76.5, -10}, {-72, -10}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation(
    Line(points = {{-51, -16}, {-44, -16}, {-44, 8}, {-32, 8}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation(
    Line(points = {{-20, 3}, {-8, 3}, {-8, 48}, {-84, 48}, {-84, 32}, {-72, 32}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{-52, 28}, {-40, 28}, {-40, 2}, {-32, 2}}, color = {0, 0, 127}));
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation(
    Line(points = {{14, -20}, {30, -20}}));
  connect(GEN.terminalAC, NTLV.terminalAC) annotation(
    Line(points = {{-26, 0}, {-26, -20}, {14, -20}}));
  connect(TGEN.terminalAC_b, GRID.terminalAC) annotation(
    Line(points = {{50, -20}, {76, -20}, {76, 0}}));
  connect(GRIDL.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{76, -50}, {76, 0}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, 80}, {120, -80}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing");
end SteadyState;
