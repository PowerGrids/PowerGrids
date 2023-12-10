within PowerGrids.Electrical.Test;

model TestTransmissionLineWithBreakersPF
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus IB1(SNom = 1e+07, UNom = 10000) annotation(
    Placement(transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LoadAcBc(PRefConst = 1e+07, QRefConst = 1000000, SNom = 1e+07, UNom = 10000, URef = 10000, alpha = 0, beta = 0) annotation(
    Placement(transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}})));
  inner PowerGrids.Electrical.System systemPowerGrids(computePF = true) annotation(
    Placement(transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedanceWithBreakers LineAcBc(B = 0.02, G = 0.01, R = 0.3, SNom = 1e+07, UNom = 10000, X = 1.5) annotation(
    Placement(transformation(origin = {-40, 70}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus BL1(UNom = 10000) annotation(
    Placement(transformation(origin = {-10, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.InfiniteBus IBL1(SNom = 1e+07, UNom = 10000, R = 0, X = 0) annotation(
    Placement(transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance Line1AcBc(UNom = 10000, R = 0.3, X = 1.5, G = 0.01, B = 0.02) annotation(
    Placement(transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.InfiniteBus IBL2(R = 0, SNom = 1e+07, UNom = 10000, X = 0) annotation(
    Placement(transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LoadAoBc(PRefConst = 1e+07, QRefConst = 1000000, SNom = 1e+07, UNom = 10000, URef = 10000, alpha = 0, beta = 0) annotation(
    Placement(transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.InfiniteBus IB2(SNom = 1e+07, UNom = 10000) annotation(
    Placement(transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance Line2AoBc(B = 0.02, G = 0.01, R = 0.3, UNom = 10000, X = 1.5) annotation(
    Placement(transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedanceWithBreakers LineAoBc(B = 0.02, G = 0.01, R = 0.3, SNom = 1e+07, UNom = 10000, X = 1.5, useBreakerA = true, breakerAStatusStart = false) annotation(
    Placement(transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus BL2(UNom = 10000) annotation(
    Placement(transformation(origin = {-10, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.BooleanExpression CloseCommand annotation(
    Placement(transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Buses.InfiniteBus IBL3(R = 0, SNom = 1e+07, UNom = 10000, X = 0) annotation(
    Placement(transformation(origin = {50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LoadAcBo(PRefConst = 1e+07, QRefConst = 1000000, SNom = 1e+07, UNom = 10000, URef = 10000, alpha = 0, beta = 0) annotation(
    Placement(transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.InfiniteBus IB3(SNom = 1e+07, UNom = 10000) annotation(
    Placement(transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance Line3AcBo(B = 0.02, G = 0.01, R = 0.3, UNom = 10000, X = 1.5) annotation(
    Placement(transformation(origin = {20, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedanceWithBreakers LineAcBo(B = 0.02, G = 0.01, R = 0.3, SNom = 1e+07, UNom = 10000, X = 1.5, useBreakerB = true, breakerBStatusStart = false) annotation(
    Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus BL3(UNom = 10000) annotation(
    Placement(transformation(origin = {-10, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Branches.LineConstantImpedance Line4AoBo(B = 0.02, G = 0.01, R = 0.3, UNom = 10000, X = 1.5) annotation(
    Placement(transformation(origin = {20, -60}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.InfiniteBus IB4(SNom = 1e+07, UNom = 10000) annotation(
    Placement(transformation(origin = {-70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LoadAoBo(PRefConst = 1e+07, QRefConst = 1000000, SNom = 1e+07, UNom = 10000, URef = 10000, alpha = 0, beta = 0) annotation(
    Placement(transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedanceWithBreakers LineAoBo(B = 0.02, G = 0.01, R = 0.3, SNom = 1e+07, UNom = 10000, X = 1.5, breakerBStatusStart = false, useBreakerB = true, useBreakerA = true, breakerAStatusStart = false) annotation(
    Placement(transformation(origin = {-40, -60}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus BL4(UNom = 10000) annotation(
    Placement(transformation(origin = {-10, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.InfiniteBus IBL4(R = 0, SNom = 1e+07, UNom = 10000, X = 0) annotation(
    Placement(transformation(origin = {50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(IB1.terminalAC, LineAcBc.terminalAC_a) annotation(
    Line(points = {{-70, 70}, {-50, 70}}));
  connect(LoadAcBc.terminalAC, BL1.terminalAC) annotation(
    Line(points = {{-10, 60}, {-10, 66}}));
  connect(Line1AcBc.terminalAC_b, IBL1.terminalAC) annotation(
    Line(points = {{30, 70}, {50, 70}}));
  connect(LineAcBc.terminalAC_b, BL1.terminalAC) annotation(
    Line(points = {{-30, 70}, {-10, 70}, {-10, 66}}));
  connect(Line1AcBc.terminalAC_a, BL1.terminalAC) annotation(
    Line(points = {{10, 70}, {-10, 70}, {-10, 66}}));
  connect(LineAoBc.terminalAC_b, BL2.terminalAC) annotation(
    Line(points = {{-30, 30}, {-10, 30}, {-10, 26}}));
  connect(IB2.terminalAC, LineAoBc.terminalAC_a) annotation(
    Line(points = {{-70, 30}, {-50, 30}}));
  connect(Line2AoBc.terminalAC_a, BL2.terminalAC) annotation(
    Line(points = {{10, 30}, {-10, 30}, {-10, 26}}));
  connect(Line2AoBc.terminalAC_b, IBL2.terminalAC) annotation(
    Line(points = {{30, 30}, {50, 30}}));
  connect(LoadAoBc.terminalAC, BL2.terminalAC) annotation(
    Line(points = {{-10, 20}, {-10, 26}}));
  connect(CloseCommand.y, LineAoBc.breakerStatusA) annotation(
    Line(points = {{-90, 60}, {-90, 44}, {-46, 44}, {-46, 32}}, color = {255, 0, 255}));
  connect(LineAcBo.terminalAC_b, BL3.terminalAC) annotation(
    Line(points = {{-30, -20}, {-10, -20}, {-10, -24}}));
  connect(IB3.terminalAC, LineAcBo.terminalAC_a) annotation(
    Line(points = {{-70, -20}, {-50, -20}}));
  connect(Line3AcBo.terminalAC_a, BL3.terminalAC) annotation(
    Line(points = {{10, -20}, {-10, -20}, {-10, -24}}));
  connect(Line3AcBo.terminalAC_b, IBL3.terminalAC) annotation(
    Line(points = {{30, -20}, {50, -20}}));
  connect(LoadAcBo.terminalAC, BL3.terminalAC) annotation(
    Line(points = {{-10, -30}, {-10, -24}}));
  connect(CloseCommand.y, LineAcBo.breakerStatusB) annotation(
    Line(points = {{-90, 60}, {-90, -6}, {-32, -6}, {-32, -18}}, color = {255, 0, 255}));
  connect(Line4AoBo.terminalAC_a, BL4.terminalAC) annotation(
    Line(points = {{10, -60}, {-10, -60}, {-10, -64}}));
  connect(LineAoBo.terminalAC_b, BL4.terminalAC) annotation(
    Line(points = {{-30, -60}, {-10, -60}, {-10, -64}}));
  connect(LoadAoBo.terminalAC, BL4.terminalAC) annotation(
    Line(points = {{-10, -70}, {-10, -64}}));
  connect(IB4.terminalAC, LineAoBo.terminalAC_a) annotation(
    Line(points = {{-70, -60}, {-50, -60}}));
  connect(Line4AoBo.terminalAC_b, IBL4.terminalAC) annotation(
    Line(points = {{30, -60}, {50, -60}}));
  connect(CloseCommand.y, LineAoBo.breakerStatusA) annotation(
    Line(points = {{-90, 60}, {-90, -46}, {-46, -46}, {-46, -58}}, color = {255, 0, 255}));
  connect(CloseCommand.y, LineAoBo.breakerStatusB) annotation(
    Line(points = {{-90, 60}, {-90, -46}, {-32, -46}, {-32, -58}}, color = {255, 0, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p>Same behaviour as <a href=\"modelica://PowerGrids.Electrical.Test.OneBusTransmissionLineShuntOneLoad\">OneBusTransmissionLineShuntOneLoad</a>, but this time the line has two breakers, one for each port. The breakers are kept closed and all electrical quantities are the same of the OneBusTransmissionLineShuntOneLoad test.
</body></html>"));
end TestTransmissionLineWithBreakersPF;
