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
  PowerGrids.Electrical.Buses.Bus bus3(
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-130, -60}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus busGEN1(
    UNom = 24e3
  ) annotation(
    Placement(transformation(origin = {-130, 21}, extent = {{-10, -10}, {10, 10}})));

  // Lines
  PowerGrids.Electrical.Branches.LineConstantImpedance L2to3(
    portVariablesPhases = true, 
    R = 2.23719, 
    X = 9.42535, 
    G = 0, 
    B = 0.000919975, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-130, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  // Loads
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load3(
    alpha = 1.5, 
    beta = 2.5, 
    PRefConst = 94.2e6, 
    QRefConst = 19.1e6, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-130, -70}, extent = {{-10, -10}, {10, 10}})));

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
      PPF = -85e6 "tuned by trial and error in order to minimize the active power from/to the reference node (bus1.port.P)"
    )) annotation(
    Placement(transformation(origin = {-130, 37}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

equation
  connect(Tgen1.terminalAC_b, bus1.terminalAC) annotation(
    Line(points = {{-130, -11}, {-130, -21}}));
  connect(Tgen1.terminalAC_a, busGEN1.terminalAC) annotation(
    Line(points = {{-130, 9}, {-130, 19}}));
  connect(GEN1.terminalAC, busGEN1.terminalAC) annotation(
    Line(points = {{-130, 39}, {-130, 19}}));
  connect(bus1.terminalAC, L2to3.terminalAC_a) annotation(
    Line(points = {{-130, -20}, {-130, -30}}));
  connect(L2to3.terminalAC_b, bus3.terminalAC) annotation(
    Line(points = {{-130, -50}, {-130, -60}}));
  connect(bus3.terminalAC, Load3.terminalAC) annotation(
    Line(points = {{-130, -60}, {-130, -68}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-180, 60}, {-100, -80}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing");
end ReducedComponentsSN;
