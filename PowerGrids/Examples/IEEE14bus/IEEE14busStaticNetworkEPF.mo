within PowerGrids.Examples.IEEE14bus;

model IEEE14busStaticNetworkEPF
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow)  annotation(
    Placement(transformation(origin = {-170, 90}, extent = {{-10, -10}, {10, 10}})));

// Buses
  PowerGrids.Electrical.Buses.ReferenceBus bus1(
    SNom = 100e6,
    UNom = 69e3, 
    setPhaseOnly = true    
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
    Placement(transformation(origin = {124, 0}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus bus8(
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {166, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
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
    Placement(transformation(origin = {-90, 92}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus bus13(
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {-30, 92}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus bus14(
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {30, 92}, extent = {{-10, -10}, {10, 10}})));
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
    R = 0.922682, 
    X = 2.81708, 
    G = 0, 
    B = 0.00110901, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-132, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.LineConstantImpedanceWithBreakers L1to5(
    R = 2.57237, 
    X = 10.6189, 
    G = 0, 
    B = 0.0010334, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L2to3(
    R = 2.23719, 
    X = 9.42535, 
    G = 0, 
    B = 0.000919975, 
    SNom = 100e6, 
    UNom = 69e3  
  ) annotation(
    Placement(visible = true, transformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L2to4(
    R = 2.76662, 
    X = 8.3946, 
    G = 0, 
    B = 0.000714136, 
    SNom = 100e6, 
    UNom = 69e3  
  ) annotation(
    Placement(visible = true, transformation(origin = {40, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L2to5(
    R = 2.71139, 
    X = 8.27843, 
    G = 0, 
    B = 0.000726738, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(transformation(origin = {-60, -64}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance L3to4(
    R = 3.19035, 
    X = 8.14274, 
    G = 0, 
    B = 0.000268851, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {120, -60}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L4to5(
    R = 0.635593, 
    X = 2.00486, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {40, -52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L6to11(
    R = 0.18088, 
    X = 0.378785, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L6to12(
    R = 0.23407, 
    X = 0.487165, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-60, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L6to13(
    R = 0.125976, 
    X = 0.248086, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {-30, 60}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L7to8(
    R = 0, 
    X = 0.33546, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {148, 20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance L7to9(
    R = 0, 
    X = 0.209503, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {118, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L9to10(
    R = 0.060579, 
    X = 0.160922, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {70, 26}, extent = {{10, -10}, {-10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance L9to14(
    R = 0.242068, 
    X = 0.514912, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3  
  ) annotation(
    Placement(transformation(origin = {70, 78}, extent = {{10, -10}, {-10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance L10to11(
    R = 0.156256, 
    X = 0.365778, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {16, 26}, extent = {{10, -10}, {-10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance L12to13(
    R = 0.42072, 
    X = 0.380651, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {-60, 78}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance L13to14(
    R = 0.325519, 
    X = 0.662763, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {0, 78}, extent = {{-10, -10}, {10, 10}})));

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
    Placement(visible = true, transformation(origin = {120, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load4(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 47.8e6, 
    QRefConst = -3.9e6,
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {136, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load5(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 7.6e6, 
    QRefConst = 1.6e6,
    SNom = 100e6, 
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-50, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load6(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 11.2e6, 
    QRefConst = 7.5e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load9(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 29.5e6, 
    QRefConst = 16.6e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load10(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 9e6, 
    QRefConst = 5.8e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load11(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 3.5e6, 
    QRefConst = 1.8e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load12(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 6.1e6, 
    QRefConst = 1.6e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {-90, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load13(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 13.8e6, 
    QRefConst = 5.8e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {-30, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load14(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 14.9e6, 
    QRefConst = 5e6,
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(transformation(origin = {30, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

// Capacitor Bank
  PowerGrids.Electrical.Banks.CapacitorBankFixed Cbank9(
    B = 0.099769,
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {110, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

// Transformers
  PowerGrids.Electrical.Branches.TransformerFixedRatio T4to7(
    R = 0,
    X = 0.398248,
    B = 0,
    G = 0,
    SNom = 100e6,
    UNomA = 69e3,
    UNomB = 13.8e3
  ) annotation(
    Placement(transformation(origin = {124, -18}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio T4to9(
    R = 0,
    X = 1.05919,
    B = 0,
    G = 0,
    SNom = 100e6,
    UNomA = 69.0e3,
    UNomB = 13.8e3    
  ) annotation(
    Placement(transformation(origin = {104, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio T5to6(
    R = 0,
    X = 0.479948,
    B = 0,
    G = 0,
    SNom = 100e6,
    UNomA = 69e3,
    UNomB = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio Tgen1(
    R = 0, 
    X = 0.393146, 
    B = 0,
    G = 0,
    SNom = 1211e6, 
    UNomA = 24e3, 
    UNomB = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatioWithBreaker Tgen2(
    R = 0, 
    X = 0.425089, 
    B = 0,
    G = 0,
    SNom = 1120e6, 
    UNomA = 24e3, 
    UNomB = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio Tgen3(
    R = 0, 
    X = 0.288545, 
    B = 0,
    G = 0,
    SNom = 1650e6, 
    UNomA = 20e3, 
    UNomB = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {150, -90}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio Tgen8(
    R = 0, 
    X = 0.076176, 
    B = 0,
    G = 0,
    SNom = 250e6, 
    UNomA = 18e3, 
    UNomB = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {180, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

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
      PPF = -229.29e6 "tuned by trial and error in order to minimize the active power from/to the reference node (bus1.port.P)"
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
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
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {-168, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Examples.IEEE14bus.SynchronousCondenser GEN3(
    SNom = 1650e6,
    UNom = 20e3,
    GEN( 
      DPu = 0.0,
      H = 5.625,
      Tppd0 = 0.065,
      xpdPu = 0.509,
      Tpd0 = 10.041,
      raPu = 0.00316,
      xpqPu = 0.601,
      Tppq0 = 0.094,
      Tpq0 = 1.22,
      xppdPu = 0.354,
      xdPu = 2.81,
      xlPu = 0.256,
      xppqPu = 0.377,
      xqPu = 2.62,
      PNom = 1485e6
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {184, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Examples.IEEE14bus.SynchronousCondenser GEN6(
    SNom = 80.0e6,
    UNom = 13.8e3,
    GEN(
      xpqPu = 0.225,
      Tpq0 = 3.0,
      DPu = 0.0,
      H = 4.975,
      Tppd0 = 0.04,
      xpdPu = 0.225,
      Tpd0 = 3.0,
      raPu = 0.004,
      Tppq0 = 0.06,
      xppdPu = 0.154,
      xdPu = 0.75,
      xlPu = 0.102,
      xppqPu = 0.154,
      xqPu = 0.45,
      PNom = 71.8e6
    )  
  ) annotation(
    Placement(transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Examples.IEEE14bus.SynchronousCondenser GEN8(
    SNom = 250e6,
    UNom = 18e3,
    GEN(
      xpqPu = 0.31,
      Tpq0 = 8.4,
      DPu = 0.0,
      H = 2.748,
      Tppd0 = 0.096,
      xpdPu = 0.31,
      Tpd0 = 8.4,
      raPu = 0.004,
      Tppq0 = 0.1,
      xppdPu = 0.275,
      xdPu = 1.53,
      xlPu = 0.11,
      xppqPu = 0.346,
      xqPu = 0.99,
      PNom = 242e6
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {180, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(bus12.terminalAC, L6to12.terminalAC_b) annotation(
    Line(points = {{-90, 92}, {-90, 60}, {-70, 60}}));
  connect(L12to13.terminalAC_a, bus12.terminalAC) annotation(
    Line(points = {{-70, 78}, {-86, 78}, {-86, 92}, {-90, 92}}));
  connect(L12to13.terminalAC_b, bus13.terminalAC) annotation(
    Line(points = {{-50, 78}, {-36, 78}, {-36, 92}, {-30, 92}}));
  connect(L6to12.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-50, 60}, {-36, 60}, {-36, 0}, {-30, 0}, {-30, 0}}));
  connect(L6to13.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-30, 50}, {-30, 0}}));
  connect(L6to13.terminalAC_b, bus13.terminalAC) annotation(
    Line(points = {{-30, 70}, {-30, 92}}));
  connect(L6to11.terminalAC_a, bus6.terminalAC) annotation(
    Line(points = {{-10, 10}, {-10, 6}, {-24, 6}, {-24, 0}, {-30, 0}}));
  connect(L6to11.terminalAC_b, bus11.terminalAC) annotation(
    Line(points = {{-10, 30}, {-10, 40}}));
  connect(L13to14.terminalAC_a, bus13.terminalAC) annotation(
    Line(points = {{-10, 78}, {-24, 78}, {-24, 92}, {-30, 92}}));
  connect(L13to14.terminalAC_b, bus14.terminalAC) annotation(
    Line(points = {{10, 78}, {24, 78}, {24, 92}, {30, 92}}));
  connect(L9to14.terminalAC_b, bus14.terminalAC) annotation(
    Line(points = {{60, 78}, {36, 78}, {36, 92}, {30, 92}}));
  connect(L9to14.terminalAC_a, bus9.terminalAC) annotation(
    Line(points = {{80, 78}, {102, 78}, {102, 40}, {110, 40}}));
  connect(L10to11.terminalAC_b, bus11.terminalAC) annotation(
    Line(points = {{6, 26}, {-4, 26}, {-4, 40}, {-10, 40}}));
  connect(L10to11.terminalAC_a, bus10.terminalAC) annotation(
    Line(points = {{26, 26}, {34, 26}, {34, 40}, {40, 40}}));
  connect(L9to10.terminalAC_b, bus10.terminalAC) annotation(
    Line(points = {{60, 26}, {46, 26}, {46, 40}, {40, 40}}));
  connect(L9to10.terminalAC_a, bus9.terminalAC) annotation(
    Line(points = {{80, 26}, {104, 26}, {104, 40}, {110, 40}}));
  connect(L7to8.terminalAC_a, bus7.terminalAC) annotation(
    Line(points = {{138, 20}, {130, 20}, {130, 0}, {124, 0}}));
  connect(L7to9.terminalAC_a, bus7.terminalAC) annotation(
    Line(points = {{118, 10}, {118, 0}, {124, 0}}));
  connect(L7to9.terminalAC_b, bus9.terminalAC) annotation(
    Line(points = {{118, 30}, {118, 40}, {110, 40}}));
  connect(L7to8.terminalAC_b, bus8.terminalAC) annotation(
    Line(points = {{158, 20}, {166, 20}}));
  connect(T4to9.terminalAC_a, bus4.terminalAC) annotation(
    Line(points = {{104, -28}, {104, -36}, {111, -36}, {111, -40}, {114, -40}}));
  connect(T4to9.terminalAC_b, bus9.terminalAC) annotation(
    Line(points = {{104, -8}, {104, 40}, {110, 40}}));
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
    Line(points = {{-50, -64}, {-30, -64}, {-30, -40}}));
  connect(L4to5.terminalAC_b, bus5.terminalAC) annotation(
    Line(points = {{30, -52}, {-24, -52}, {-24, -40}, {-30, -40}, {-30, -40}}));
  connect(L2to5.terminalAC_a, bus2.terminalAC) annotation(
    Line(points = {{-70, -64}, {-90, -64}, {-90, -80}}));
  connect(L2to4.terminalAC_a, bus2.terminalAC) annotation(
    Line(points = {{30, -70}, {-82, -70}, {-82, -80}, {-90, -80}, {-90, -80}}));
  connect(L3to4.terminalAC_b, bus4.terminalAC) annotation(
    Line(points = {{120, -50}, {120, -40}, {114, -40}}));
  connect(L3to4.terminalAC_a, bus3.terminalAC) annotation(
    Line(points = {{120, -70}, {120, -80}}));
  connect(L2to4.terminalAC_b, bus4.terminalAC) annotation(
    Line(points = {{50, -70}, {114, -70}, {114, -40}, {114, -40}}));
  connect(L4to5.terminalAC_a, bus4.terminalAC) annotation(
    Line(points = {{50, -52}, {112, -52}, {112, -40}, {114, -40}}));
  connect(L2to3.terminalAC_b, bus3.terminalAC) annotation(
    Line(points = {{10, -90}, {114, -90}, {114, -80}, {120, -80}, {120, -80}}));
  connect(Tgen8.terminalAC_b, bus8.terminalAC) annotation(
    Line(points = {{180, 10}, {180, 20}, {166, 20}}));
  connect(Tgen3.terminalAC_b, bus3.terminalAC) annotation(
    Line(points = {{140, -90}, {128, -90}, {128, -80}, {120, -80}, {120, -80}}));
  connect(Tgen2.terminalAC_b, bus2.terminalAC) annotation(
    Line(points = {{-120, -90}, {-96, -90}, {-96, -80}, {-90, -80}, {-90, -80}}));
  connect(Tgen1.terminalAC_b, bus1.terminalAC) annotation(
    Line(points = {{-130, 10}, {-130, 0}}));
  connect(Load12.terminalAC, bus12.terminalAC) annotation(
    Line(points = {{-90, 98}, {-90, 92}}));
  connect(bus13.terminalAC, Load13.terminalAC) annotation(
    Line(points = {{-30, 92}, {-30, 98}}));
  connect(Load14.terminalAC, bus14.terminalAC) annotation(
    Line(points = {{30, 98}, {30, 92}}));
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
  connect(GEN6.terminalAC, bus6.terminalAC) annotation(
    Line(points = {{-70, 10}, {-36, 10}, {-36, 0}, {-30, 0}}));
  connect(T4to7.terminalAC_a, bus4.terminalAC) annotation(
    Line(points = {{124, -28}, {124, -40}, {114, -40}}));
  connect(T4to7.terminalAC_b, bus7.terminalAC) annotation(
    Line(points = {{124, -8}, {124, 0}}));
  connect(GEN2.terminalAC, busGEN2.terminalAC) annotation(
    Line(points = {{-168, -90}, {-150, -90}}));
  connect(Tgen2.terminalAC_a, busGEN2.terminalAC) annotation(
    Line(points = {{-140, -90}, {-150, -90}}));
  connect(Tgen3.terminalAC_a, busGEN3.terminalAC) annotation(
    Line(points = {{160, -90}, {170, -90}}));
  connect(GEN3.terminalAC, busGEN3.terminalAC) annotation(
    Line(points = {{184, -90}, {170, -90}}));
  connect(GEN8.terminalAC, busGEN8.terminalAC) annotation(
    Line(points = {{180, -36}, {180, -20}}));
  connect(Tgen8.terminalAC_a, busGEN8.terminalAC) annotation(
    Line(points = {{180, -10}, {180, -20}}));
  connect(GEN1.terminalAC, busGEN1.terminalAC) annotation(
    Line(points = {{-130, 56}, {-130, 40}}));
  connect(Tgen1.terminalAC_a, busGEN1.terminalAC) annotation(
    Line(points = {{-130, 30}, {-130, 40}}));
  connect(bus4.terminalAC, Load4.terminalAC) annotation(
    Line(points = {{114, -40}, {124, -40}, {124, -36}, {136, -36}, {136, -50}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, 120}, {200, -120}}, grid = {0.5, 0.5})),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end IEEE14busStaticNetworkEPF;
