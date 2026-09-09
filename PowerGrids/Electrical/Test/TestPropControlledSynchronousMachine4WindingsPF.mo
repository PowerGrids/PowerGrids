within PowerGrids.Electrical.Test;

model TestPropControlledSynchronousMachine4WindingsPF
    extends Modelica.Icons.Example;
    inner Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
      Placement(transformation(origin = {-130, -62}, extent = {{-10, -10}, {10, 10}})));
    Electrical.Machines.SynchronousMachine4Windings GEN12(H = 6, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, isRefNodeEPF = true) annotation(
      Placement(transformation(origin = {45, 13}, extent = {{-17, -17}, {17, 17}})));
    Electrical.Buses.Bus busGen12(UNom = 24000) annotation(
      Placement(transformation(origin = {45, 43}, extent = {{-11, -11}, {11, 11}})));
    .PowerGrids.Controls.FreeOffset PmPu12(use_u = true) annotation(
      Placement(transformation(origin = {-24, 14}, extent = {{-8, -8}, {8, 8}})));
    .PowerGrids.Controls.FreeOffset ufPu12(use_u = true) annotation(
      Placement(transformation(origin = {-24, -48}, extent = {{-8, -8}, {8, 8}})));
    PowerFlow.BusPF bus1(UNom = 24000) annotation(
      Placement(transformation(origin = {-114, 0}, extent = {{-10, -10}, {10, 10}})));
    PowerFlow.SlackBus slackBus1(SNom = 5e8, UNom = 24000) annotation(
      Placement(transformation(origin = {-114, -16}, extent = {{-10, -10}, {10, 10}})));
    Loads.LoadPQVoltageDependence loadPQ12(UNom = 24000, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8, alpha = 1, beta = 1) annotation(
      Placement(transformation(origin = {45, 55}, extent = {{-11, 11}, {11, -11}})));
    PowerFlow.PQBus loadPQ11(UNom = 24000, SNom = 5e8, P = 2e8, Q = 1e8) annotation(
      Placement(transformation(origin = {-114, 8}, extent = {{-10, 10}, {10, -10}})));
    Modelica.Blocks.Sources.RealExpression RefLPu(y = 200/500*0.05) annotation(
      Placement(transformation(origin = {-50, 14}, extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Sources.RealExpression VrefPu(y = 1) annotation(
      Placement(transformation(origin = {-52, -48}, extent = {{-10, -10}, {10, 10}})));
    Controls.TurbineGovernors.GoverProportional GOV(KGover = 1/0.05)  annotation(
    Placement(transformation(origin = {6, 10}, extent = {{-10, -10}, {10, 10}})));
    Controls.ExcitationSystems.VRProportional AVR(Ka = 200, VrMax = 4, VrMin = 0)  annotation(
    Placement(transformation(origin = {6, -42}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(slackBus1.terminalAC, bus1.terminalAC) annotation(
    Line(points = {{-114, -16}, {-114, 0}}));
  connect(loadPQ12.terminalAC, busGen12.terminalAC) annotation(
    Line(points = {{45, 55}, {45, 43}}));
  connect(busGen12.terminalAC, GEN12.terminalAC) annotation(
    Line(points = {{45, 43}, {45, 13}}));
  connect(bus1.terminalAC, loadPQ11.terminalAC) annotation(
    Line(points = {{-114, 0}, {-114, 8}}));
  connect(RefLPu.y, PmPu12.u) annotation(
    Line(points = {{-39, 14}, {-33, 14}}, color = {0, 0, 127}));
  connect(VrefPu.y, ufPu12.u) annotation(
    Line(points = {{-41, -48}, {-33, -48}}, color = {0, 0, 127}));
  connect(PmPu12.y, GOV.PmRefPu) annotation(
    Line(points = {{-16, 14}, {-4, 14}}, color = {0, 0, 127}));
  connect(GEN12.omegaPu, GOV.omegaPu) annotation(
    Line(points = {{55, 8}, {66, 8}, {66, 30}, {-10, 30}, {-10, 6}, {-4, 6}}, color = {0, 0, 127}));
  connect(ufPu12.y, AVR.VrefPu) annotation(
    Line(points = {{-15.2, -48}, {-3.2, -48}}, color = {0, 0, 127}));
  connect(GEN12.VPu, AVR.VcPu) annotation(
    Line(points = {{55, 1}, {66, 1}, {66, -24}, {-10, -24}, {-10, -36}, {-4, -36}}, color = {0, 0, 127}));
  connect(GOV.PMechPu, GEN12.PmPu) annotation(
    Line(points = {{16, 10}, {34, 10}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN12.ufPuIn) annotation(
    Line(points = {{16, -42}, {24, -42}, {24, 0}, {34, 0}}, color = {0, 0, 127}));
  annotation(
      __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
      experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
      Diagram(graphics = {Rectangle(origin = {22, 5}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-94, 75}, {94, -75}}), Rectangle(origin = {-115, 8}, lineColor = {0, 85, 255}, lineThickness = 2, extent = {{-35, 56}, {35, -56}})}, coordinateSystem(extent = {{-160, 80}, {120, -80}})),
      Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end TestPropControlledSynchronousMachine4WindingsPF;