within PowerGrids.Examples.IEEE14bus;

model ReducedComponentsSN
  extends Modelica.Icons.UnderConstruction;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
    Placement(transformation(origin = {-150, 51}, extent = {{-10, -10}, {10, 10}})));

  // Buses
  PowerGrids.Electrical.Buses.ReferenceBus bus1(
    SNom = 100e6, 
    UNom = 69e3, 
    setPhaseOnly = true
  ) annotation(
    Placement(transformation(origin = {-130, -19}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus bus2(
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus3(
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-10, -80}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus busGEN1(
    UNom = 24e3
  ) annotation(
    Placement(transformation(origin = {-130, 21}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus busGEN2(
    UNom = 24e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-150, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  // Lines
  PowerGrids.Electrical.Branches.LineConstantImpedance L1to2(
    portVariablesPhases = true, 
    R = 0.922682, 
    X = 2.81708, 
    G = 0, 
    B = 0.00110901, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-132, -49}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L2to3(
    portVariablesPhases = true, 
    R = 2.23719, 
    X = 9.42535, 
    G = 0, 
    B = 0.000919975, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-50, -90}, extent = {{-10, -10}, {10, 10}})));

  // Loads
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load2(
    alpha = 1.5, 
    beta = 2.5, 
    PRefConst = 21.7e6, 
    QRefConst = 12.7e6, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load3(
    alpha = 1.5, 
    beta = 2.5, 
    PRefConst = 94.2e6, 
    QRefConst = 19.1e6, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-10, -94}, extent = {{-10, -10}, {10, 10}})));

  // Transformers
  PowerGrids.Electrical.Branches.TransformerFixedRatio Tgen1(
    portVariablesPhases = true, 
    R = 0, 
    X = 0.393146, 
    B = 0, 
    G = 0, 
    SNom = 1211e6, 
    UNomA = 24e3, 
    UNomB = 69e3
  ) annotation(
    Placement(transformation(origin = {-130, 1}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatioWithBreaker Tgen2(
    portVariablesPhases = true, 
    R = 0, 
    X = 0.425089, 
    B = 0, 
    G = 0, 
    SNom = 1120e6, 
    UNomA = 24e3, 
    UNomB = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  // Generators
  PowerGrids.Examples.IEEE14bus.ControlledGeneratorIEEE GEN1(
    SNom = 1211e6, 
    UNom = 24e3, 
    GEN(
      DPu = 0.0, 
      H = 5.4, 
      Tppd0 = 0.08, 
      xpdPu = 0.384, 
      Tpd0 = 8.094, 
      raPu = 0.002796, 
      xpqPu = 0.393, 
      Tppq0 = 0.084, 
      Tpq0 = 1.572, 
      xppdPu = 0.264, 
      xdPu = 2.22, 
      xlPu = 0.202, 
      xppqPu = 0.262, 
      xqPu = 2.22, 
      PNom = 1090e6, 
      PPF = -68e6 "tuned by trial and error in order to minimize the active power from/to the reference node (bus1.port.P)"
    )) annotation(
    Placement(transformation(origin = {-130, 37}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Examples.IEEE14bus.ControlledGeneratorIEEE GEN2(
    SNom = 1120e6, 
    UNom = 24e3, 
    GEN(
      DPu = 0.0, 
      H = 5.4, 
      Tppd0 = 0.058, 
      xpdPu = 0.407, 
      Tpd0 = 9.651, 
      raPu = 0.00357, 
      xpqPu = 0.454, 
      Tppq0 = 0.06, 
      Tpq0 = 1.009, 
      xppdPu = 0.3, 
      xdPu = 2.57, 
      xlPu = 0.219, 
      xppqPu = 0.301, 
      xqPu = 2.57, 
      PNom = 1008e6, 
      PPF = -40e6
    )) annotation(
    Placement(visible = true, transformation(origin = {-168, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

equation
  connect(L1to2.terminalAC_a, bus1.terminalAC) annotation(
    Line(points = {{-132, -41}, {-132, -21}, {-130, -21}}));
  connect(L1to2.terminalAC_b, bus2.terminalAC) annotation(
    Line(points = {{-132, -61}, {-132, -70}, {-96, -70}, {-96, -80}, {-90, -80}}));
  connect(L2to3.terminalAC_b, bus3.terminalAC) annotation(
    Line(points = {{-40, -90}, {-16, -90}, {-16, -80}, {-10, -80}}));
  connect(Tgen2.terminalAC_b, bus2.terminalAC) annotation(
    Line(points = {{-120, -90}, {-96, -90}, {-96, -80}, {-90, -80}, {-90, -80}}));
  connect(Tgen1.terminalAC_b, bus1.terminalAC) annotation(
    Line(points = {{-130, -11}, {-130, -21}}));
  connect(Load3.terminalAC, bus3.terminalAC) annotation(
    Line(points = {{-10, -94}, {-10, -80}}));
  connect(Load2.terminalAC, bus2.terminalAC) annotation(
    Line(points = {{-90, -94}, {-90, -80}}));
  connect(L2to3.terminalAC_a, bus2.terminalAC) annotation(
    Line(points = {{-60, -90}, {-82, -90}, {-82, -80}, {-90, -80}}));
  connect(Tgen1.terminalAC_a, busGEN1.terminalAC) annotation(
    Line(points = {{-130, 9}, {-130, 19}}));
  connect(GEN1.terminalAC, busGEN1.terminalAC) annotation(
    Line(points = {{-130, 39}, {-130, 19}}));
  connect(GEN2.terminalAC, busGEN2.terminalAC) annotation(
    Line(points = {{-170, -90}, {-150, -90}}));
  connect(Tgen2.terminalAC_a, busGEN2.terminalAC) annotation(
    Line(points = {{-140, -90}, {-150, -90}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-180, 60}, {20, -120}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing");
end ReducedComponentsSN;
