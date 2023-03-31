within PowerGrids.Examples.IEEE14bus;
model IEEE14busStaticNetwork "Dynamic model of the IEEE 14-bus system, operating in steady-state"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow, referenceFrequency = PowerGrids.Types.Choices.ReferenceFrequency.fixedReferenceGenerator)  annotation(
    Placement(visible = true, transformation(origin = {-150, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// Buses
  PowerGrids.Electrical.Buses.ReferenceBus bus1(
    SNom = 100e6,
    UNom = 69e3,
    UStart = 69e3*1.0598
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus2(
    SNom = 100e6,
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus3(
    SNom = 100e6,
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus4(
    SNom = 100e6,
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {114, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus5(
    SNom = 100e6,
    UNom = 69e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus6(
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus7(
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus8(
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {160, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus bus9(
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus10(
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus11(
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus12(
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus13(
    SNom = 100e6,
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus bus14(
    SNom = 100e6,
    UNom = 13.8e3  
  ) annotation(
    Placement(visible = true, transformation(origin = {30, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

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
    G = 0, 
    B = 0.0010334, 
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
    R = 0.23407, 
    portVariablesPhases = true,
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
    Placement(visible = true, transformation(origin = {70, 72}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin = {-60, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance L13to14(
    portVariablesPhases = true,
    R = 0.325519, 
    X = 0.662763, 
    G = 0, 
    B = 0, 
    SNom = 100e6, 
    UNom = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {0, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// Loads
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load2(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 21.7e6, 
    QRefConst = 12.7e6,
    SNom = 100e6, 
    UNom = 69e3,
    URef = 72.105e3,
    UStart = 72.0866e3,  
    UPhaseStart = -0.087
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load3(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 94.2e6, 
    QRefConst = 19.1e6,
    SNom = 100e6, 
    UNom = 69e3,
    URef = 69.69e3,
    UStart = 69.685e3,  
    UPhaseStart = -0.22231
  ) annotation(
    Placement(visible = true, transformation(origin = {120, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load4(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 47.8e6, 
    QRefConst = -3.9e6,
    SNom = 100e6, 
    UNom = 69e3,
    URef = 70.2756e3,
    UStart = 70.2049e3,
    UPhaseStart = -0.180223
  ) annotation(
    Placement(visible = true, transformation(origin = {136, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load5(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 7.6e6, 
    QRefConst = 1.6e6,
    SNom = 100e6, 
    UNom = 69e3,
    URef = 70.4552e3,
    UStart = 70.3898e3,
    UPhaseStart = -0.153511  
  ) annotation(
    Placement(visible = true, transformation(origin = {-50, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load6(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 11.2e6, 
    QRefConst = 7.5e6,
    SNom = 100e6, 
    UNom = 13.8e3,
    URef = 14.766e3,
    UStart = 14.7347e3,  
    UPhaseStart = -0.249364
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load9(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 29.5e6, 
    QRefConst = 16.6e6,
    SNom = 100e6, 
    UNom = 13.8e3,
    URef = 14.5966e3,
    UStart = 14.5624e3,  
    UPhaseStart = -0.261599  
  ) annotation(
    Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load10(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 9e6, 
    QRefConst = 5.8e6,
    SNom = 100e6, 
    UNom = 13.8e3,
    URef = 14.5241e3,
    UStart = 14.4903e3,  
    UPhaseStart = -0.264445  
  ) annotation(
    Placement(visible = true, transformation(origin = {40, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load11(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 3.5e6, 
    QRefConst = 1.8e6,
    SNom = 100e6, 
    UNom = 13.8e3,
    URef = 14.5959e3,
    UStart = 14.5633e3,  
    UPhaseStart = -0.259223
  ) annotation(
    Placement(visible = true, transformation(origin = {-10, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load12(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 6.1e6, 
    QRefConst = 1.6e6,
    SNom = 100e6, 
    UNom = 13.8e3,
    URef = 14.499e3,
    UStart = 14.5308e3,  
    UPhaseStart = -0.264428 
  ) annotation(
    Placement(visible = true, transformation(origin = {-90, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load13(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 13.8e6, 
    QRefConst = 5.8e6,
    SNom = 100e6, 
    UNom = 13.8e3,
    URef = 14.5634e3,
    UStart = 14.4648e3,  
    UPhaseStart = -0.265952  
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence Load14(
    alpha = 1.5,
    beta = 2.5,
    PRefConst = 14.9e6, 
    QRefConst = 5e6,
    SNom = 100e6, 
    UNom = 13.8e3,
    URef = 14.3062e3,
    UStart = 14.2714e3,  
    UPhaseStart = -0.281002  
  ) annotation(
    Placement(visible = true, transformation(origin = {30, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));

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
    rFixed = 0.204082,
    SNom = 100e6,
    UNomA = 69e3,
    UNomB = 13.8e3
  ) annotation(
    Placement(visible = true, transformation(origin = {120, -18}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio T4to9(
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
  PowerGrids.Examples.IEEE14bus.ControlledGeneratorIEEE GEN1(
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
      SNom = 1211e6,
      UNom = 24e3,
      PStart = -232.37e6,
      QStart = 15.7473e6,
      UStart = 25.4068e3,
      UPhaseStart = 0.0171006
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {-130, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Examples.IEEE14bus.ControlledGeneratorIEEE GEN2(
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
      SNom = 1120e6,
      UNom = 24e3,
      PStart = -40e6,
      QStart = -42.7306e6,
      UStart = 25.1608e3,
      UPhaseStart = -0.0837392
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {-154, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Examples.IEEE14bus.SynchronousCondenser GEN3(
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
      PNom = 1485e6,
      SNom = 1650e6,
      UNom = 20e3,
      PStart = 0.0,
      QStart = -25.3998e6,
      UStart = 20.229e3,
      UPhaseStart = -0.22231
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {174, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Examples.IEEE14bus.SynchronousCondenser GEN6(
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
      PNom = 71.8e6,
      SNom = 80.0e6,
      UNom = 13.8e3,
      PStart = 0,
      QStart = -15.0186e6,
      UStart = 14.7347e3,
      UPhaseStart = -0.249364
    )  
  ) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Examples.IEEE14bus.SynchronousCondenser GEN8(
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
      PNom = 242e6,
      SNom = 250e6,
      UNom = 18e3,
      PStart = 0,
      QStart = -16.2253e6,
      UStart = 19.6461e3,
      UPhaseStart = -0.233851
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {180, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(bus12.terminal, L6to12.terminalB) annotation(
    Line(points = {{-90, 80}, {-90, 80}, {-90, 60}, {-70, 60}, {-70, 60}}));
  connect(L12to13.terminalA, bus12.terminal) annotation(
    Line(points = {{-70, 72}, {-86, 72}, {-86, 80}, {-90, 80}}));
  connect(L12to13.terminalB, bus13.terminal) annotation(
    Line(points = {{-50, 72}, {-36, 72}, {-36, 80}, {-30, 80}}));
  connect(L6to12.terminalA, bus6.terminal) annotation(
    Line(points = {{-50, 60}, {-36, 60}, {-36, 0}, {-30, 0}, {-30, 0}}));
  connect(L6to13.terminalA, bus6.terminal) annotation(
    Line(points = {{-30, 52}, {-30, 52}, {-30, 0}, {-30, 0}}));
  connect(L6to13.terminalB, bus13.terminal) annotation(
    Line(points = {{-30, 72}, {-30, 72}, {-30, 80}, {-30, 80}}));
  connect(bus13.terminal, L6to13.terminalB) annotation(
    Line(points = {{-30, 80}, {-30, 80}, {-30, 72}, {-30, 72}}));
  connect(L6to11.terminalA, bus6.terminal) annotation(
    Line(points = {{-10, 10}, {-10, 10}, {-10, 6}, {-24, 6}, {-24, 0}, {-30, 0}, {-30, 0}}));
  connect(L6to11.terminalB, bus11.terminal) annotation(
    Line(points = {{-10, 30}, {-10, 30}, {-10, 40}, {-10, 40}}));
  connect(L13to14.terminalA, bus13.terminal) annotation(
    Line(points = {{-10, 72}, {-24, 72}, {-24, 80}, {-30, 80}}));
  connect(L13to14.terminalB, bus14.terminal) annotation(
    Line(points = {{10, 72}, {24, 72}, {24, 80}, {30, 80}}));
  connect(L9to14.terminalB, bus14.terminal) annotation(
    Line(points = {{60, 72}, {36, 72}, {36, 80}, {30, 80}}));
  connect(L9to14.terminalA, bus9.terminal) annotation(
    Line(points = {{80, 72}, {102, 72}, {102, 40}, {110, 40}}));
  connect(L10to11.terminalB, bus11.terminal) annotation(
    Line(points = {{10, 30}, {-4, 30}, {-4, 40}, {-10, 40}, {-10, 40}}));
  connect(L10to11.terminalA, bus10.terminal) annotation(
    Line(points = {{30, 30}, {34, 30}, {34, 40}, {40, 40}, {40, 40}}));
  connect(L9to10.terminalB, bus10.terminal) annotation(
    Line(points = {{50, 30}, {46, 30}, {46, 40}, {40, 40}, {40, 40}}));
  connect(L9to10.terminalA, bus9.terminal) annotation(
    Line(points = {{70, 30}, {104, 30}, {104, 40}, {110, 40}, {110, 40}}));
  connect(L7to8.terminalA, bus7.terminal) annotation(
    Line(points = {{130, 20}, {126, 20}, {126, 0}, {120, 0}, {120, 0}}));
  connect(L7to9.terminalA, bus7.terminal) annotation(
    Line(points = {{114, 10}, {114, 10}, {114, 0}, {120, 0}, {120, 0}}));
  connect(L7to9.terminalB, bus9.terminal) annotation(
    Line(points = {{114, 30}, {114, 30}, {114, 40}, {110, 40}, {110, 40}}));
  connect(L7to8.terminalB, bus8.terminal) annotation(
    Line(points = {{150, 20}, {160, 20}, {160, 20}, {160, 20}}));
  connect(T4to9.terminalA, bus4.terminal) annotation(
    Line(points = {{108, -28}, {108, -40}, {114, -40}}));
  connect(T4to9.terminalB, bus9.terminal) annotation(
    Line(points = {{108, -8}, {108, 40}, {110, 40}}));
  connect(T5to6.terminalB, bus6.terminal) annotation(
    Line(points = {{-30, -10}, {-30, -10}, {-30, 0}, {-30, 0}}));
  connect(T5to6.terminalA, bus5.terminal) annotation(
    Line(points = {{-30, -30}, {-30, -30}, {-30, -40}, {-30, -40}}));
  connect(L1to2.terminalA, bus1.terminal) annotation(
    Line(points = {{-132, -20}, {-132, 0}, {-130, 0}}));
  connect(L1to2.terminalB, bus2.terminal) annotation(
    Line(points = {{-132, -40}, {-132, -70}, {-96, -70}, {-96, -80}, {-90, -80}}));
  connect(L1to5.terminalA, bus1.terminal) annotation(
    Line(points = {{-100, -52}, {-124, -52}, {-124, 0}, {-130, 0}, {-130, 0}}));
  connect(L1to5.terminalB, bus5.terminal) annotation(
    Line(points = {{-80, -52}, {-36, -52}, {-36, -40}, {-30, -40}, {-30, -40}}));
  connect(L2to5.terminalB, bus5.terminal) annotation(
    Line(points = {{-50, -60}, {-30, -60}, {-30, -40}, {-30, -40}}));
  connect(L4to5.terminalB, bus5.terminal) annotation(
    Line(points = {{30, -52}, {-24, -52}, {-24, -40}, {-30, -40}, {-30, -40}}));
  connect(L2to5.terminalA, bus2.terminal) annotation(
    Line(points = {{-70, -60}, {-90, -60}, {-90, -80}, {-90, -80}}));
  connect(L2to4.terminalA, bus2.terminal) annotation(
    Line(points = {{30, -70}, {-82, -70}, {-82, -80}, {-90, -80}, {-90, -80}}));
  connect(L3to4.terminalB, bus4.terminal) annotation(
    Line(points = {{120, -50}, {120, -40}, {114, -40}}));
  connect(L3to4.terminalA, bus3.terminal) annotation(
    Line(points = {{120, -70}, {120, -80}}));
  connect(L2to4.terminalB, bus4.terminal) annotation(
    Line(points = {{50, -70}, {114, -70}, {114, -40}, {114, -40}}));
  connect(L4to5.terminalA, bus4.terminal) annotation(
    Line(points = {{50, -52}, {108, -52}, {108, -40}, {114, -40}, {114, -40}}));
  connect(L2to3.terminalB, bus3.terminal) annotation(
    Line(points = {{10, -90}, {114, -90}, {114, -80}, {120, -80}, {120, -80}}));
  connect(Tgen8.terminalB, bus8.terminal) annotation(
    Line(points = {{180, 10}, {180, 10}, {180, 14}, {180, 14}, {180, 20}, {160, 20}, {160, 20}}));
  connect(Tgen3.terminalB, bus3.terminal) annotation(
    Line(points = {{140, -90}, {128, -90}, {128, -80}, {120, -80}, {120, -80}}));
  connect(Tgen2.terminalB, bus2.terminal) annotation(
    Line(points = {{-120, -90}, {-96, -90}, {-96, -80}, {-90, -80}, {-90, -80}}));
  connect(Tgen1.terminalB, bus1.terminal) annotation(
    Line(points = {{-130, 10}, {-130, 0}}));
  connect(Load12.terminal, bus12.terminal) annotation(
    Line(points = {{-90, 94}, {-90, 80}}));
  connect(bus13.terminal, Load13.terminal) annotation(
    Line(points = {{-30, 80}, {-30, 94}}));
  connect(Load14.terminal, bus14.terminal) annotation(
    Line(points = {{30, 94}, {30, 80}}));
  connect(Load11.terminal, bus11.terminal) annotation(
    Line(points = {{-10, 54}, {-10, 40}}));
  connect(Load10.terminal, bus10.terminal) annotation(
    Line(points = {{40, 54}, {40, 40}}));
  connect(Cbank9.terminal, bus9.terminal) annotation(
    Line(points = {{110, 54}, {110, 40}}));
  connect(Load9.terminal, bus9.terminal) annotation(
    Line(points = {{130, 54}, {130, 46}, {118, 46}, {118, 40}, {110, 40}}));
  connect(Load6.terminal, bus6.terminal) annotation(
    Line(points = {{-10, -10}, {-10, -10}, {-10, -6}, {-24, -6}, {-24, 0}, {-30, 0}, {-30, 0}}));
  connect(Load5.terminal, bus5.terminal) annotation(
    Line(points = {{-50, -34}, {-50, -36}, {-36, -36}, {-36, -40}, {-30, -40}}));
  connect(Load3.terminal, bus3.terminal) annotation(
    Line(points = {{120, -94}, {120, -80}}));
  connect(Load2.terminal, bus2.terminal) annotation(
    Line(points = {{-90, -94}, {-90, -80}}));
  connect(L2to3.terminalA, bus2.terminal) annotation(
    Line(points = {{-10, -90}, {-82, -90}, {-82, -80}, {-90, -80}, {-90, -80}}));
  connect(Tgen1.terminalA, GEN1.terminal) annotation(
    Line(points = {{-130, 30}, {-130, 46}}));
  connect(GEN2.terminal, Tgen2.terminalA) annotation(
    Line(points = {{-154, -90}, {-140, -90}, {-140, -90}, {-140, -90}}));
  connect(Tgen3.terminalA, GEN3.terminal) annotation(
    Line(points = {{160, -90}, {174, -90}}));
  connect(GEN8.terminal, Tgen8.terminalA) annotation(
    Line(points = {{180, -26}, {180, -26}, {180, -10}, {180, -10}}));
  connect(Load4.terminal, bus4.terminal) annotation(
    Line(points = {{136, -50}, {136, -46}, {122, -46}, {122, -40}, {114, -40}}));
  connect(GEN6.terminal, bus6.terminal) annotation(
    Line(points = {{-70, -10}, {-36, -10}, {-36, 0}, {-30, 0}, {-30, 0}}));
  connect(T4to7.terminalA, bus4.terminal) annotation(
    Line(points = {{120, -28}, {120, -28}, {120, -40}, {114, -40}, {114, -40}}));
  connect(T4to7.terminalB, bus7.terminal) annotation(
    Line(points = {{120, -8}, {120, -8}, {120, 0}, {120, 0}}));
  connect(GEN1.omega, systemPowerGrids.omegaRefIn) annotation(
    Line(points = {{-136, 46}, {-170, 46}, {-170, 70}, {-160, 70}, {-160, 70}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -110}, {200, 110}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end IEEE14busStaticNetwork;
