within PowerGrids.Examples.IEEE14bus;

model ReducedComponetsPF
  extends Modelica.Icons.UnderConstruction;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {-170, 49}, extent = {{-10, -10}, {10, 10}})));

  // Buses
  PowerGrids.Electrical.PowerFlow.SlackBus bus1(SNom = 100e6,
    UNom = 69e3, 
    setPhaseOnly = true
  ) annotation(
    Placement(transformation(origin = {-130, -21}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.BusPF bus2(
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.BusPF bus3(
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-10, -80}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.BusPF busGEN1(
    UNom = 24e3
  ) annotation(
    Placement(transformation(origin = {-130, 19}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.BusPF busGEN2(
    UNom = 24e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-150, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  // Lines
  PowerGrids.Electrical.PowerFlow.LineConstantImpedancePF L1to2(
    portVariablesPhases = true,
    R = 0.922682, 
    X = 2.81708, 
    G = 0, 
    B = 0.00110901, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-132, -51}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    PowerGrids.Electrical.PowerFlow.LineConstantImpedancePF L2to3(
    portVariablesPhases = true, 
    R = 2.23719, 
    X = 9.42535, 
    G = 0, 
    B = 0.000919975, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-50, -90}, extent = {{-10, -10}, {10, 10}})));

  // LOADS
  PowerGrids.Electrical.PowerFlow.PQBus Load2(
    portVariablesPhases = true, 
    P = 21.7e6, 
    Q = 12.7e6, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus Load3(
    portVariablesPhases = true, 
    P = 94.2e6, 
    Q = 19.1e6, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-10, -94}, extent = {{-10, -10}, {10, 10}})));

  // Transformers
  PowerGrids.Electrical.PowerFlow.TransformerFixedRatioPF Tgen1(
    portVariablesPhases = true, 
    R = 0, 
    X = 0.393146, 
    B = 0, 
    G = 0, 
    SNom = 1211e6, 
    UNomA = 24e3, 
    UNomB = 69e3
  ) annotation(
    Placement(transformation(origin = {-130, -1}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.PowerFlow.TransformerFixedRatioWithBreakerPF Tgen2(
    portVariablesPhases = true, 
    R = 0, 
    X = 0.425089, 
    B = 0, 
    G = 0, 
    SNom = 1120e6, 
    UNomA = 24e3, 
    UNomB = 69e3, 
    useBreaker = false, 
  breakerStatusStart = true
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  // Generators
  PowerGrids.Electrical.PowerFlow.PVBus GEN1(
    portVariablesPhases = true, 
    SNom = 1211e6, 
    UNom = 24e3, 
    P = -68e6
  ) annotation(
    Placement(transformation(origin = {-130, 39}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.PVBus GEN2(
    portVariablesPhases = true, 
    SNom = 1120e6, 
    UNom = 24e3, 
    P = -40e6
  ) annotation(
    Placement(visible = true, transformation(origin = {-170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

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
end ReducedComponetsPF;
