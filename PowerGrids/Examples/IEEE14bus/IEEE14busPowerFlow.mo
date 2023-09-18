within PowerGrids.Examples.IEEE14bus;

model IEEE14busPowerFlow "Power flow model of the IEEE 14-bus benchmark"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// Buses
  PowerGrids.Electrical.PowerFlow.SlackBus bus1(
    SNom = 100e6,
    U = 69e3*1.0598,
    UNom = 69000
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus2(
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus3(
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus4(
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {114, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus5(
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus6(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus7(
    UNom = 13.8e3  
  ) annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus8(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {160, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus bus9(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus10(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus11(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus12(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus13(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus14(
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus busGEN1(
    UNom = 24e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus busGEN2(
    UNom = 24e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-150, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Buses.Bus busGEN3(
    UNom = 20e3
  ) annotation(
    Placement(visible = true, transformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus busGEN8(
    UNom = 18e3  
  ) annotation(
    Placement(visible = true, transformation(origin = {180, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

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
    Placement(visible = true, transformation(origin = {-132, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedanceWithBreakers L1to5(
    portVariablesPhases = true,
    R = 2.57237,
    X = 10.6189,
    B = 0.0010334, 
    G = 0, 
    SNom = 100e6, 
    UNom = 69e3 
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L2to3(
    portVariablesPhases = true,
    R = 2.23719, 
    X = 9.42535, 
    G = 0, 
    B = 0.000919975, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L2to4(
    portVariablesPhases = true,
    R = 2.76662, 
    X = 8.3946, 
    G = 0, 
    B = 0.000714136, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {40, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L2to5(
    portVariablesPhases = true,
    R = 2.71139, 
    X = 8.27843, 
    G = 0, 
    B = 0.000726738, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L3to4(
    portVariablesPhases = true,
    R = 3.19035, 
    X = 8.14274, 
    G = 0, 
    B = 0.000268851, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {120, -60}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L4to5(
    portVariablesPhases = true,
    R = 0.635593, 
    X = 2.00486, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {40, -52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
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
    portVariablesPhases = true,
    R = 0.23407, 
    X = 0.487165, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3 
  ) annotation(
    Placement(visible = true, transformation(origin = {-60, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L6to13(
    portVariablesPhases = true,
    R = 0.125976, 
    X = 0.248086, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 62}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L7to8(
    portVariablesPhases = true,
    R = 0, 
    X = 0.33546, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {140, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L7to9(
    portVariablesPhases = true,
    R = 0, 
    X = 0.209503, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {114, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L9to10(
    portVariablesPhases = true,
    R = 0.060579, 
    X = 0.160922, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L9to14(
    portVariablesPhases = true,
    R = 0.242068, 
    X = 0.514912, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {70, 74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L10to11(
    portVariablesPhases = true,
    R = 0.156256, 
    X = 0.365778, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L12to13(
    portVariablesPhases = true,
    R = 0.42072, 
    X = 0.380651, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-60, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L13to14(
    portVariablesPhases = true,
    R = 0.325519, 
    X = 0.662763, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {0, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

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
    Placement(visible = true, transformation(origin = {120, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus Load4(
    portVariablesPhases = true,
    P = 47.8e6, 
    Q = -3.9e6,
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {136, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus Load5(
    portVariablesPhases = true,
    P = 7.6e6, 
    Q = 1.6e6,
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-50, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.PQBus Load6(
    portVariablesPhases = true,
    P = 11.2e6, 
    Q = 7.5e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus Load9(
    portVariablesPhases = true,
    P = 29.5e6, 
    Q = 16.6e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.PQBus Load10(
    portVariablesPhases = true,
    P = 9e6, 
    Q = 5.8e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.PQBus Load11(
    portVariablesPhases = true,
    P = 3.5e6, 
    Q = 1.8e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.PQBus Load12(
    portVariablesPhases = true,
    P = 6.1e6, 
    Q = 1.6e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.PQBus Load13(
    portVariablesPhases = true,
    P = 13.8e6, 
    Q = 5.8e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.PQBus Load14(
    portVariablesPhases = true,
    P = 14.9e6, 
    Q = 5e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {30, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

// Capacitor bank
  PowerGrids.Electrical.Banks.CapacitorBankFixed Cbank9(
    portVariablesPhases = true,
    B = 0.099769,
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {110, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

// Transformers
  PowerGrids.Electrical.Branches.TransformerFixedRatio T4to7(
    portVariablesPhases = true,
    R = 0,
    X = 0.398248,
    B = 0,
    G = 0,
    rFixed = 0.204082,
    SNom = 100e6,
    UNomA = 69e3,
    UNomB = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {120, -18}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio T4to9(
    portVariablesPhases = true,
    R = 0,
    X = 1.05919,
    B = 0,
    G = 0,
    rFixed = 0.208333,
    SNom = 100e6,
    UNomA = 69.0e3,
    UNomB = 13.8e3    
  ) annotation(
    Placement(visible = true, transformation(origin = {108, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio T5to6(
    portVariablesPhases = true,
    R = 0,
    X = 0.479948,
    B = 0,
    G = 0,
    rFixed = 0.212766,
    SNom = 100e6,
    UNomA = 69e3,
    UNomB = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio Tgen1(
    portVariablesPhases = true,
    R = 0, 
    X = 0.393146, 
    B = 0,
    G = 0,
    rFixed = 2.875,
    SNom = 1211e6, 
    UNomA = 24e3, 
    UNomB = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatioWithBreaker Tgen2(
    portVariablesPhases = true,
    R = 0, 
    X = 0.425089, 
    B = 0,
    G = 0,
    rFixed = 2.875,
    SNom = 1120e6, 
    UNomA = 24e3, 
    UNomB = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio Tgen3(
    portVariablesPhases = true,
    R = 0, 
    X = 0.288545, 
    B = 0,
    G = 0,
    rFixed = 3.45,
    SNom = 1650e6, 
    UNomA = 20e3, 
    UNomB = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {150, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio Tgen8(
    portVariablesPhases = true,
    R = 0, 
    X = 0.076176, 
    B = 0,
    G = 0,
    rFixed = 0.766667,
    SNom = 250e6, 
    UNomA = 18e3, 
    UNomB = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {180, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

// Generators
  PowerGrids.Electrical.PowerFlow.PVBus GEN1(
    portVariablesPhases = true,
    SNom = 1211e6,
    UNom = 24e3,
    P = -232.36955e6,
    U = 25.4068e3
  ) annotation(
    Placement(transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.PowerFlow.PVBus GEN2(
    portVariablesPhases = true,
    SNom = 1120e6,
    UNom = 24e3,
    U = 25.1608e3,
    P = -40e6
  ) annotation(
    Placement(visible = true, transformation(origin = {-170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.PowerFlow.PVBus GEN3(
    portVariablesPhases = true,
    SNom = 1650e6,
    UNom = 20e3,
    U = 20.229e3,
    P = 0.0
  ) annotation(
    Placement(visible = true, transformation(origin = {190, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.PowerFlow.PVBus GEN6(
    portVariablesPhases = true,
    SNom = 80.0e6,
    UNom = 13.8e3,
    U = 14.7347e3,
    P = 0
  ) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.PowerFlow.PVBus GEN8(
    portVariablesPhases = true,
    SNom = 250e6,
    UNom = 18e3,
    U = 19.6461e3,
    P = 0
  ) annotation(
    Placement(visible = true, transformation(origin = {180, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(bus12.terminalAC, L6to12.terminalAC_b) annotation(
    Line(points = {{-90, 80}, {-90, 80}, {-90, 60}, {-70, 60}, {-70, 60}}));
  connect(L12to13.terminalAC_a, bus12.terminalAC) annotation(
    Line(points = {{-70, 74}, {-86, 74}, {-86, 80}, {-90, 80}}));
  connect(L12to13.terminalAC_b, bus13.terminalAC) annotation(
    Line(points = {{-50, 74}, {-36, 74}, {-36, 80}, {-30, 80}}));
  connect(L6to12.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-50, 60}, {-36, 60}, {-36, 0}, {-30, 0}, {-30, 0}}));
  connect(L6to13.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-30, 52}, {-30, 52}, {-30, 0}, {-30, 0}}));
  connect(L6to13.terminalAC_b, bus13.terminalAC) annotation(
    Line(points = {{-30, 72}, {-30, 72}, {-30, 80}, {-30, 80}}));
  connect(L6to11.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-10, 10}, {-10, 10}, {-10, 6}, {-24, 6}, {-24, 0}, {-30, 0}, {-30, 0}}));
  connect(L6to11.terminalAC_b, bus11.terminalAC) annotation(
    Line(points = {{-10, 30}, {-10, 30}, {-10, 40}, {-10, 40}}));
  connect(L13to14.terminalAC_a, bus13.terminalAC) annotation(
    Line(points = {{-10, 74}, {-24, 74}, {-24, 80}, {-30, 80}}));
  connect(L13to14.terminalAC_b, bus14.terminalAC) annotation(
    Line(points = {{10, 74}, {24, 74}, {24, 80}, {30, 80}}));
  connect(L9to14.terminalAC_b, bus14.terminalAC) annotation(
    Line(points = {{60, 74}, {36, 74}, {36, 80}, {30, 80}}));
  connect(L9to14.terminalAC_a, bus9.terminalAC) annotation(
    Line(points = {{80, 74}, {102, 74}, {102, 40}, {110, 40}}));
  connect(L10to11.terminalAC_b, bus11.terminalAC) annotation(
    Line(points = {{10, 30}, {-4, 30}, {-4, 40}, {-10, 40}, {-10, 40}}));
  connect(L10to11.terminalAC_a, bus10.terminalAC) annotation(
    Line(points = {{30, 30}, {34, 30}, {34, 40}, {40, 40}, {40, 40}}));
  connect(L9to10.terminalAC_b, bus10.terminalAC) annotation(
    Line(points = {{50, 30}, {46, 30}, {46, 40}, {40, 40}, {40, 40}}));
  connect(L9to10.terminalAC_a, bus9.terminalAC) annotation(
    Line(points = {{70, 30}, {104, 30}, {104, 40}, {110, 40}, {110, 40}}));
  connect(L7to8.terminalAC_a, bus7.terminalAC) annotation(
    Line(points = {{130, 20}, {126, 20}, {126, 0}, {120, 0}, {120, 0}}));
  connect(L7to9.terminalAC_a, bus7.terminalAC) annotation(
    Line(points = {{114, 10}, {114, 10}, {114, 0}, {120, 0}, {120, 0}}));
  connect(L7to9.terminalAC_b, bus9.terminalAC) annotation(
    Line(points = {{114, 30}, {114, 30}, {114, 40}, {110, 40}, {110, 40}}));
  connect(L7to8.terminalAC_b, bus8.terminalAC) annotation(
    Line(points = {{150, 20}, {160, 20}, {160, 20}, {160, 20}}));
  connect(T4to9.terminalAC_a, bus4.terminalAC) annotation(
    Line(points = {{108, -28}, {108, -40}, {114, -40}}));
  connect(T4to9.terminalAC_b, bus9.terminalAC) annotation(
    Line(points = {{108, -8}, {108, 40}, {110, 40}}));
  connect(T5to6.terminalAC_b, bus6.terminalAC) annotation(
    Line(points = {{-30, -10}, {-30, -10}, {-30, 0}, {-30, 0}}));
  connect(T5to6.terminalAC_a, bus5.terminalAC) annotation(
    Line(points = {{-30, -30}, {-30, -30}, {-30, -40}, {-30, -40}}));
  connect(L1to2.terminalAC_a, bus1.terminalAC) annotation(
    Line(points = {{-132, -20}, {-132, 0}, {-130, 0}}));
  connect(L1to2.terminalAC_b, bus2.terminalAC) annotation(
    Line(points = {{-132, -40}, {-132, -70}, {-96, -70}, {-96, -80}, {-90, -80}}));
  connect(L1to5.terminalAC_a, bus1.terminalAC) annotation(
    Line(points = {{-100, -52}, {-124, -52}, {-124, 0}, {-130, 0}, {-130, 0}}));
  connect(L1to5.terminalAC_b, bus5.terminalAC) annotation(
    Line(points = {{-80, -52}, {-36, -52}, {-36, -40}, {-30, -40}, {-30, -40}}));
  connect(L2to5.terminalAC_b, bus5.terminalAC) annotation(
    Line(points = {{-50, -60}, {-30, -60}, {-30, -40}, {-30, -40}}));
  connect(L4to5.terminalAC_b, bus5.terminalAC) annotation(
    Line(points = {{30, -52}, {-24, -52}, {-24, -40}, {-30, -40}, {-30, -40}}));
  connect(L2to5.terminalAC_a, bus2.terminalAC) annotation(
    Line(points = {{-70, -60}, {-90, -60}, {-90, -80}, {-90, -80}}));
  connect(L2to4.terminalAC_a, bus2.terminalAC) annotation(
    Line(points = {{30, -70}, {-82, -70}, {-82, -80}, {-90, -80}, {-90, -80}}));
  connect(L3to4.terminalAC_b, bus4.terminalAC) annotation(
    Line(points = {{120, -50}, {120, -40}, {114, -40}}));
  connect(L3to4.terminalAC_a, bus3.terminalAC) annotation(
    Line(points = {{120, -70}, {120, -80}}));
  connect(L2to4.terminalAC_b, bus4.terminalAC) annotation(
    Line(points = {{50, -70}, {114, -70}, {114, -40}, {114, -40}}));
  connect(L4to5.terminalAC_a, bus4.terminalAC) annotation(
    Line(points = {{50, -52}, {108, -52}, {108, -40}, {114, -40}, {114, -40}}));
  connect(L2to3.terminalAC_b, bus3.terminalAC) annotation(
    Line(points = {{10, -90}, {114, -90}, {114, -80}, {120, -80}, {120, -80}}));
  connect(Tgen8.terminalAC_b, bus8.terminalAC) annotation(
    Line(points = {{180, 10}, {180, 10}, {180, 14}, {180, 14}, {180, 20}, {160, 20}, {160, 20}}));
  connect(Tgen3.terminalAC_b, bus3.terminalAC) annotation(
    Line(points = {{140, -90}, {128, -90}, {128, -80}, {120, -80}, {120, -80}}));
  connect(Tgen2.terminalAC_b, bus2.terminalAC) annotation(
    Line(points = {{-120, -90}, {-96, -90}, {-96, -80}, {-90, -80}, {-90, -80}}));
  connect(Tgen1.terminalAC_b, bus1.terminalAC) annotation(
    Line(points = {{-130, 10}, {-130, 0}}));
  connect(Load12.terminalAC, bus12.terminalAC) annotation(
    Line(points = {{-90, 86}, {-90, 80}}));
  connect(bus13.terminalAC, Load13.terminalAC) annotation(
    Line(points = {{-30, 80}, {-30, 86}}));
  connect(Load14.terminalAC, bus14.terminalAC) annotation(
    Line(points = {{30, 86}, {30, 80}}));
  connect(Load11.terminalAC, bus11.terminalAC) annotation(
    Line(points = {{-10, 46}, {-10, 40}}));
  connect(Load10.terminalAC, bus10.terminalAC) annotation(
    Line(points = {{40, 46}, {40, 40}}));
  connect(Cbank9.terminalAC, bus9.terminalAC) annotation(
    Line(points = {{110, 54}, {110, 40}}));
  connect(Load9.terminalAC, bus9.terminalAC) annotation(
    Line(points = {{130, 54}, {130, 46}, {118, 46}, {118, 40}, {110, 40}}));
  connect(Load6.terminalAC, bus6.terminalAC) annotation(
    Line(points = {{-10, -10}, {-10, -10}, {-10, -6}, {-24, -6}, {-24, 0}, {-30, 0}, {-30, 0}}));
  connect(Load5.terminalAC, bus5.terminalAC) annotation(
    Line(points = {{-50, -34}, {-50, -36}, {-36, -36}, {-36, -40}, {-30, -40}}));
  connect(Load3.terminalAC, bus3.terminalAC) annotation(
    Line(points = {{120, -94}, {120, -80}}));
  connect(Load2.terminalAC, bus2.terminalAC) annotation(
    Line(points = {{-90, -94}, {-90, -80}}));
  connect(L2to3.terminalAC_a, bus2.terminalAC) annotation(
    Line(points = {{-10, -90}, {-82, -90}, {-82, -80}, {-90, -80}, {-90, -80}}));
  connect(Load4.terminalAC, bus4.terminalAC) annotation(
    Line(points = {{136, -50}, {136, -46}, {122, -46}, {122, -40}, {114, -40}}));
  connect(GEN6.terminalAC, bus6.terminalAC) annotation(
    Line(points = {{-70, -10}, {-36, -10}, {-36, 0}, {-30, 0}, {-30, 0}}));
  connect(T4to7.terminalAC_a, bus4.terminalAC) annotation(
    Line(points = {{120, -28}, {120, -28}, {120, -40}, {114, -40}, {114, -40}}));
  connect(T4to7.terminalAC_b, bus7.terminalAC) annotation(
    Line(points = {{120, -8}, {120, -8}, {120, 0}, {120, 0}}));
  connect(Tgen1.terminalAC_a, busGEN1.terminalAC) annotation(
    Line(points = {{-130, 30}, {-130, 40}}));
  connect(GEN1.terminalAC, busGEN1.terminalAC) annotation(
    Line(points = {{-130, 60}, {-130, 40}}));
  connect(GEN2.terminalAC, busGEN2.terminalAC) annotation(
    Line(points = {{-170, -90}, {-150, -90}}));
  connect(Tgen2.terminalAC_a, busGEN2.terminalAC) annotation(
    Line(points = {{-140, -90}, {-150, -90}}));
  connect(Tgen3.terminalAC_a, busGEN3.terminalAC) annotation(
    Line(points = {{160, -90}, {170, -90}}));
  connect(busGEN3.terminalAC, GEN3.terminalAC) annotation(
    Line(points = {{170, -90}, {190, -90}}));
  connect(Tgen8.terminalAC_a, busGEN8.terminalAC) annotation(
    Line(points = {{180, -10}, {180, -20}}));
  connect(GEN8.terminalAC, busGEN8.terminalAC) annotation(
    Line(points = {{180, -36}, {180, -20}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -110}, {200, 110}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY"));
end IEEE14busPowerFlow;
