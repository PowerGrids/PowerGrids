within PowerGrids.Electrical.Test;

model TestTransformerFixedRatioWithBreakersPF
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus IB1(SNom = 1e+07, UNom = 1000) annotation(
    Placement(transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LoadBc(PRefConst = 1e+07, QRefConst = 1000000, SNom = 1e+07, UNom = 10000, URef = 10000, alpha = 0, beta = 0, portVariablesPhases = true) annotation(
    Placement(transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}})));
  inner PowerGrids.Electrical.System systemPowerGrids(computePF = true) annotation(
    Placement(transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus BL1(UNom = 10000) annotation(
    Placement(transformation(origin = {-10, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.InfiniteBus IBL1(SNom = 1e+07, UNom = 10000, R = 0, X = 0) annotation(
    Placement(transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance Line1Bc(UNom = 10000, R = 0.01, X = 0.2, G = 0.001, B = 0.002) annotation(
    Placement(transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.InfiniteBus IBL2(R = 0, SNom = 1e+07, UNom = 10000, X = 0) annotation(
    Placement(transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LoadBo(PRefConst = 1e+07, QRefConst = 1000000, SNom = 1e+07, UNom = 10000, URef = 10000, alpha = 0, beta = 0, portVariablesPhases = true) annotation(
    Placement(transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.InfiniteBus IB2(SNom = 1e+07, UNom = 1000) annotation(
    Placement(transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance Line2Bo(B = 0.002, G = 0.001, R = 0.01, UNom = 10000, X = 0.2) annotation(
    Placement(transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Buses.Bus BL2(UNom = 10000) annotation(
    Placement(transformation(origin = {-10, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.BooleanExpression CloseCommand annotation(
    Placement(transformation(origin = {-34, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatioWithBreaker TRBc(UNomA = 1000, UNomB = 10000, R = 0.01, X = 0.2, G = 0.001, B = 0.002)  annotation(
    Placement(transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.TransformerFixedRatioWithBreaker TRBo(B = 0.002, G = 0.001, R = 0.01, UNomA = 1000, UNomB = 10000, X = 0.2, useBreaker = true, breakerStatusStart = false) annotation(
    Placement(transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(LoadBc.terminalAC, BL1.terminalAC) annotation(
    Line(points = {{-10, 20}, {-10, 26}}));
  connect(Line1Bc.terminalAC_b, IBL1.terminalAC) annotation(
    Line(points = {{30, 30}, {50, 30}}));
  connect(Line1Bc.terminalAC_a, BL1.terminalAC) annotation(
    Line(points = {{10, 30}, {-10, 30}, {-10, 26}}));
  connect(Line2Bo.terminalAC_a, BL2.terminalAC) annotation(
    Line(points = {{10, -30}, {-10, -30}, {-10, -34}}));
  connect(Line2Bo.terminalAC_b, IBL2.terminalAC) annotation(
    Line(points = {{30, -30}, {50, -30}}));
  connect(LoadBo.terminalAC, BL2.terminalAC) annotation(
    Line(points = {{-10, -40}, {-10, -34}}));
  connect(IB1.terminalAC, TRBc.terminalAC_a) annotation(
    Line(points = {{-70, 30}, {-50, 30}}));
  connect(TRBc.terminalAC_b, BL1.terminalAC) annotation(
    Line(points = {{-30, 30}, {-10, 30}, {-10, 26}}));
  connect(IB2.terminalAC, TRBo.terminalAC_a) annotation(
    Line(points = {{-70, -30}, {-50, -30}}));
  connect(TRBo.terminalAC_b, BL2.terminalAC) annotation(
    Line(points = {{-30, -30}, {-10, -30}, {-10, -34}}));
  connect(CloseCommand.y, TRBo.breakerStatusIn) annotation(
    Line(points = {{-34, -21}, {-34, -24.5}, {-32, -24.5}, {-32, -28}}, color = {255, 0, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p>Same behaviour as <a href=\"modelica://PowerGrids.Electrical.Test.OneBusTransmissionLineShuntOneLoad\">OneBusTransmissionLineShuntOneLoad</a>, but this time the line has two breakers, one for each port. The breakers are kept closed and all electrical quantities are the same of the OneBusTransmissionLineShuntOneLoad test.
</body></html>"));
end TestTransformerFixedRatioWithBreakersPF;
