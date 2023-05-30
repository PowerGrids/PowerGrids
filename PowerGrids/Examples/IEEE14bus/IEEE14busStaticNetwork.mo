within PowerGrids.Examples.IEEE14bus;
model IEEE14busStaticNetwork "Dynamic model of the IEEE 14-bus system, operating in steady-state"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow, referenceFrequency = PowerGrids.Types.Choices.ReferenceFrequency.fixedReferenceGenerator)  annotation(
    Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Buses
  PowerGrids.Electrical.Buses.Bus bus6(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus12(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus13(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Lines
  PowerGrids.Electrical.Branches.LineConstantImpedance L6to11(
    portVariablesPhases = true,
    R = 0.18088, 
    X = 0.378785, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L6to12(
    R = 0.23407, 
    portVariablesPhases = true,
    X = 0.487165, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-60, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L6to13(portVariablesPhases = true, R = 0.125976, X = 0.248086, G = 0, B = 0, SNom = 100e6, UNom = 13.8e3) annotation(
    Placement(visible = true, transformation(origin = {-24, 40}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L12to13(
    portVariablesPhases = true,
    R = 0.42072, 
    X = 0.380651, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-60, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Loads
  // Capacitor Bank
  // Transformers
  // Generators
  PowerGrids.Examples.IEEE14bus.SynchronousCondenser GEN6(GEN(xpqPu = 0.225, Tpq0 = 3.0, DPu = 0.0, H = 4.975, Tppd0 = 0.04, xpdPu = 0.225, Tpd0 = 3.0, raPu = 0.004, Tppq0 = 0.06, xppdPu = 0.154, xdPu = 0.75, xlPu = 0.102, xppqPu = 0.154, xqPu = 0.45, PNom = 71.8e6, SNom = 80.0e6, UNom = 13.8e3, PStart = 0, QStart = -15.0186e6, UStart = 14.7347e3, UPhaseStart = -0.249364)) annotation(
    Placement(visible = true, transformation(origin = {-68, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(bus12.terminalAC, L6to12.terminalAC_b) annotation(
    Line(points = {{-90, 80}, {-90, 80}, {-90, 60}, {-70, 60}, {-70, 60}}));
  connect(L12to13.terminalAC_a, bus12.terminalAC) annotation(
    Line(points = {{-70, 72}, {-86, 72}, {-86, 80}, {-90, 80}}));
  connect(L12to13.terminalAC_b, bus13.terminalAC) annotation(
    Line(points = {{-50, 72}, {-36, 72}, {-36, 80}, {-30, 80}}));
  connect(L6to12.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-50, 60}, {-36, 60}, {-36, 0}, {-30, 0}, {-30, 0}}));
  connect(L6to11.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-10, 10}, {-10, 10}, {-10, 6}, {-24, 6}, {-24, 0}, {-30, 0}, {-30, 0}}));
  connect(GEN6.terminalAC, bus6.terminalAC) annotation(
    Line(points = {{-68, -8}, {-36, -8}, {-36, 0}, {-30, 0}}));
  connect(bus13.terminalAC, L6to11.terminalAC_b) annotation(
    Line(points = {{-30, 80}, {-28, 80}, {-28, 76}, {-10, 76}, {-10, 30}}));
  connect(L6to13.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-24, 30}, {-30, 30}, {-30, 0}}));
  connect(bus13.terminalAC, L6to13.terminalAC_b) annotation(
    Line(points = {{-30, 80}, {-30, 50}, {-24, 50}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -110}, {200, 110}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end IEEE14busStaticNetwork;
