within PowerGrids.Electrical.Test;

model TestOpenLoopSynchronousMachine4WindingsPF
    extends Modelica.Icons.Example;
    inner Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
      Placement(transformation(origin = {-130, -62}, extent = {{-10, -10}, {10, 10}})));
    Electrical.Machines.SynchronousMachine4Windings GEN12(H = 6, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, isRefNodeEPF = true) annotation(
      Placement(transformation(origin = {31, 3}, extent = {{-17, -17}, {17, 17}})));
    Electrical.Buses.Bus busGen12(UNom = 24000) annotation(
      Placement(transformation(origin = {32, 28}, extent = {{-10, -10}, {10, 10}})));
    .PowerGrids.Controls.FreeOffset PmPu12 annotation(
      Placement(transformation(origin = {-14, 0}, extent = {{-8, -8}, {8, 8}})));
    .PowerGrids.Controls.FreeOffset ufPu12 annotation(
      Placement(transformation(origin = {-14, -24}, extent = {{-8, -8}, {8, 8}})));
    PowerFlow.BusPF bus1(UNom = 24000) annotation(
      Placement(transformation(origin = {-114, 0}, extent = {{-10, -10}, {10, 10}})));
    PowerFlow.SlackBus slackBus1(SNom = 5e8, UNom = 24000) annotation(
      Placement(transformation(origin = {-114, -16}, extent = {{-10, -10}, {10, 10}})));
    Loads.LoadPQVoltageDependence loadPQ12(UNom = 24000, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8, alpha = 1, beta = 1) annotation(
      Placement(transformation(origin = {32, 38}, extent = {{-10, 10}, {10, -10}})));
    PowerFlow.PQBus loadPQ11(UNom = 24000, SNom = 5e8, P = 2e8, Q = 1e8) annotation(
      Placement(transformation(origin = {-114, 8}, extent = {{-10, 10}, {10, -10}})));
  equation
    connect(slackBus1.terminalAC, bus1.terminalAC) annotation(
      Line(points = {{-114, -16}, {-114, 0}}));
    connect(loadPQ12.terminalAC, busGen12.terminalAC) annotation(
      Line(points = {{32, 38}, {32, 28}}));
    connect(busGen12.terminalAC, GEN12.terminalAC) annotation(
      Line(points = {{32, 28}, {32, 4}}));
    connect(bus1.terminalAC, loadPQ11.terminalAC) annotation(
      Line(points = {{-114, 0}, {-114, 8}}));
  connect(GEN12.PmPu, PmPu12.y) annotation(
      Line(points = {{20.8, -0.4}, {-5.2, -0.4}}, color = {0, 0, 127}));
  connect(ufPu12.y, GEN12.ufPuIn) annotation(
      Line(points = {{-5.2, -24}, {4.8, -24}, {4.8, -10}, {20.8, -10}}, color = {0, 0, 127}));
    annotation(
      __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
      experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
      Diagram(graphics = {Rectangle(origin = {22, 3}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-94, 73}, {94, -73}}), Rectangle(origin = {-115, 8}, lineColor = {0, 85, 255}, lineThickness = 2, extent = {{-35, 56}, {35, -56}})}, coordinateSystem(extent = {{-160, 80}, {120, -80}})),
      Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));


end TestOpenLoopSynchronousMachine4WindingsPF;