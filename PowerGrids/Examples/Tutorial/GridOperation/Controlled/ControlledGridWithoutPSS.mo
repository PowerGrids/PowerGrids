within PowerGrids.Examples.Tutorial.GridOperation.Controlled;
model ControlledGridWithoutPSS "System under automatic control without PSS"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PPF = -4.75e+08, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation(
    Placement(transformation(origin = {-26, 0}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.Bus NTLV(UNom = 21000)  annotation(
    Placement(visible = true, transformation(origin = {24, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, rFixed = 419 / 21)  annotation(
    Placement(visible = true, transformation(origin = {54, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1 / 10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05 * 380e3)  annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3)  annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1)  annotation(
    Placement(visible = true, transformation(origin = {-62, 28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4)  annotation(
    Placement(visible = true, transformation(origin = {-62, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(visible = true, transformation(origin = {-102, -52}, extent = {{-12, -10}, {12, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPu(y = 1.004552)  annotation(
    Placement(visible = true, transformation(origin = {-102, -33}, extent = {{-12, -11}, {12, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression RefLPu(y = 475 / 500 * 0.05)  annotation(
    Placement(visible = true, transformation(origin = {-98, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Faults.ThreePhaseFault FAULT(R = 0.05,SNom = 5e+08, UNom = 380000, startTime = 2, stopTime = 2.1) annotation(
    Placement(visible = true, transformation(origin = {128, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(GEN.terminalAC, NTLV.terminalAC) annotation(
    Line(points = {{-26, 0}, {-26, -20}, {24, -20}}));
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation(
    Line(points = {{24, -20}, {44, -20}, {44, -20}, {44, -20}}));
  connect(RefLPu.y, TGOV.RefLPu) annotation(
    Line(points = {{-86, 24}, {-74, 24}, {-74, 24}, {-72, 24}}, color = {0, 0, 127}));
  connect(AVR.VrefPu, VrefPu.y) annotation(
    Line(points = {{-72, -18}, {-80, -18}, {-80, -32}, {-88, -32}, {-88, -32}}, color = {0, 0, 127}));
  connect(AVR.VsPu, zero.y) annotation(
    Line(points = {{-72, -10}, {-76, -10}, {-76, -52}, {-88, -52}, {-88, -52}}, color = {0, 0, 127}));
  connect(AVR.VuelPu, zero.y) annotation(
    Line(points = {{-72, -22}, {-76, -22}, {-76, -52}, {-88, -52}, {-88, -52}}, color = {0, 0, 127}));
  connect(GEN.ufPuIn, AVR.efdPu) annotation(
    Line(points = {{-32, 8}, {-44, 8}, {-44, -16}, {-50, -16}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{-52, 28}, {-40, 28}, {-40, 2}, {-32, 2}}, color = {0, 0, 127}));
  connect(GEN.VPu, AVR.VcPu) annotation(
    Line(points = {{-20, 7}, {0, 7}, {0, 54}, {-130, 54}, {-130, -14}, {-72, -14}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation(
    Line(points = {{-20, 3}, {-10, 3}, {-10, 44}, {-80, 44}, {-80, 32}, {-72, 32}}, color = {0, 0, 127}));
  connect(TGEN.terminalAC_b, GRID.terminalAC) annotation(
    Line(points = {{64, -20}, {110, -20}, {110, -10}}));
  connect(GRID.terminalAC, GRIDL.terminalAC) annotation(
    Line(points = {{110, -10}, {110, -30}}));
  connect(FAULT.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{128, -30}, {128, -20}, {110, -20}, {110, -10}}));

annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv="LOG_INIT_HOMOTOPY"));
end ControlledGridWithoutPSS;
