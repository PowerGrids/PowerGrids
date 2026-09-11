within PowerGrids.Electrical.Test;

model TestControlledSynchronousMachine4WindingsPF
    extends Modelica.Icons.Example;
    inner Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
      Placement(transformation(origin = {-130, -62}, extent = {{-10, -10}, {10, 10}})));
    Electrical.Machines.SynchronousMachine4Windings GEN12(H = 6, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, isRefNode = true) annotation(
      Placement(transformation(origin = {45, 19}, extent = {{-17, -17}, {17, 17}})));
    Electrical.Buses.Bus busGen12(UNom = 24000) annotation(
      Placement(transformation(origin = {46, 44}, extent = {{-10, -10}, {10, 10}})));
    .PowerGrids.Controls.FreeOffset PmPu12(use_u = true) annotation(
      Placement(transformation(origin = {-24, 6}, extent = {{-8, -8}, {8, 8}})));
    .PowerGrids.Controls.FreeOffset ufPu12(use_u = true) annotation(
      Placement(transformation(origin = {-22, -52}, extent = {{-8, -8}, {8, 8}})));
    PowerFlow.BusPF bus1(UNom = 24000) annotation(
      Placement(transformation(origin = {-114, 0}, extent = {{-10, -10}, {10, 10}})));
    PowerFlow.SlackBus slackBus1(SNom = 5e8, UNom = 24000) annotation(
      Placement(transformation(origin = {-114, -16}, extent = {{-10, -10}, {10, 10}})));
    Loads.LoadPQVoltageDependence loadPQ12(UNom = 24000, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8, alpha = 1, beta = 1) annotation(
      Placement(transformation(origin = {46, 54}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
    PowerFlow.PQBus loadPQ11(UNom = 24000, SNom = 5e8, P = 2e8, Q = 1e8) annotation(
      Placement(transformation(origin = {-114, 8}, extent = {{-10, 10}, {10, -10}})));
    PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1) annotation(
      Placement(transformation(origin = {10, 16}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Blocks.Sources.RealExpression RefLPu(y = 200/500*0.05) annotation(
      Placement(transformation(origin = {-50, 6}, extent = {{-10, -10}, {10, 10}})));
    PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4) annotation(
      Placement(transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.RealExpression zero annotation(
      Placement(transformation(origin = {-48, -24}, extent = {{-12, -10}, {12, 10}})));
    Modelica.Blocks.Sources.RealExpression VrefPu(y = 1) annotation(
      Placement(transformation(origin = {-50, -52}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(slackBus1.terminalAC, bus1.terminalAC) annotation(
      Line(points = {{-114, -16}, {-114, 0}}));
    connect(loadPQ12.terminalAC, busGen12.terminalAC) annotation(
      Line(points = {{46, 54}, {46, 44}}));
    connect(GEN12.omegaPu, TGOV.omegaPu) annotation(
      Line(points = {{55.2, 13.9}, {71.2, 13.9}, {71.2, 35.9}, {-18.8, 35.9}, {-18.8, 20}, {0, 20}}, color = {0, 0, 127}));
    connect(AVR.VsPu, zero.y) annotation(
      Line(points = {{0, -24}, {-35, -24}}, color = {0, 0, 127}));
    connect(AVR.VuelPu, zero.y) annotation(
      Line(points = {{0, -36}, {-20, -36}, {-20, -24}, {-34, -24}}, color = {0, 0, 127}));
    connect(GEN12.VPu, AVR.VcPu) annotation(
      Line(points = {{55.2, 7.1}, {71.2, 7.1}, {71.2, -16.9}, {-8.8, -16.9}, {-8.8, -28.9}, {-0.8, -28.9}}, color = {0, 0, 127}));
    connect(busGen12.terminalAC, GEN12.terminalAC) annotation(
      Line(points = {{46, 44}, {46, 20}}));
    connect(bus1.terminalAC, loadPQ11.terminalAC) annotation(
      Line(points = {{-114, 0}, {-114, 8}}));
  connect(TGOV.PMechPu, GEN12.PmPu) annotation(
    Line(points = {{22, 16}, {34, 16}}, color = {0, 0, 127}));
  connect(RefLPu.y, PmPu12.u) annotation(
    Line(points = {{-38, 6}, {-32, 6}}, color = {0, 0, 127}));
  connect(PmPu12.y, TGOV.RefLPu) annotation(
    Line(points = {{-16, 6}, {-8, 6}, {-8, 12}, {0, 12}}, color = {0, 0, 127}));
  connect(VrefPu.y, ufPu12.u) annotation(
    Line(points = {{-38, -52}, {-30, -52}}, color = {0, 0, 127}));
  connect(ufPu12.y, AVR.VrefPu) annotation(
    Line(points = {{-14, -52}, {-8, -52}, {-8, -32}, {0, -32}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN12.ufPuIn) annotation(
    Line(points = {{22, -30}, {26, -30}, {26, 6}, {34, 6}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
      experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
      Diagram(graphics = {Rectangle(origin = {22, 3}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-94, 73}, {94, -73}}), Rectangle(origin = {-115, 8}, lineColor = {0, 85, 255}, lineThickness = 2, extent = {{-35, 56}, {35, -56}})}, coordinateSystem(extent = {{-160, 80}, {120, -80}})),
      Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));


end TestControlledSynchronousMachine4WindingsPF;