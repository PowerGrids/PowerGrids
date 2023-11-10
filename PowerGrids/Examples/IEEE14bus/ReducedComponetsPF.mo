within PowerGrids.Examples.IEEE14bus;

model ReducedComponetsPF
  extends Modelica.Icons.UnderConstruction;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(transformation(origin = {-170, 49}, extent = {{-10, -10}, {10, 10}})));

// Buses
  PowerGrids.Electrical.PowerFlow.SlackBus bus1(
    SNom = 100e6, 
    UNom = 69e3, 
    setPhaseOnly = true
  ) annotation(
    Placement(transformation(origin = {-130, -21}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.BusPF bus3(
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-130, -60}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.BusPF busGEN1(
    UNom = 24e3
  ) annotation(
    Placement(transformation(origin = {-130, 19}, extent = {{-10, -10}, {10, 10}})));

  // Lines
  PowerGrids.Electrical.PowerFlow.LineConstantImpedancePF L2to3(
    portVariablesPhases = true, 
    R = 2.23719, 
    X = 9.42535, 
    G = 0, 
    B = 0.000919975, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
 
  // LOADS
  PowerGrids.Electrical.PowerFlow.PQBus Load3(
    portVariablesPhases = true, 
    P = 94.2e6, 
    Q = 19.1e6, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-130, -68}, extent = {{-10, -10}, {10, 10}})));

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

  // Generators
  PowerGrids.Electrical.PowerFlow.PVBus GEN1(
    portVariablesPhases = true, 
    SNom = 1211e6, 
    UNom = 24e3, 
    P = -85e6
  ) annotation(
    Placement(transformation(origin = {-130, 39}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

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
end ReducedComponetsPF;
