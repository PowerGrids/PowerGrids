within PowerGrids.Electrical.PowerFlow.Test;

model SmallSystem
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
      Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PVBus bus2(P = -1e+08,SNom = 1e+08, UNom = 400000)  annotation(
      Placement(visible = true, transformation(origin = {60, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance line1(R = 100, SNom = 1e+08, UNom = 400000, X = 1000)  annotation(
      Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance line2(R = 100, SNom = 1e+08, UNom = 400000, X = 1000)  annotation(
      Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance line3(R = 100, SNom = 1e+08, UNom = 400000, X = 1000)  annotation(
      Placement(visible = true, transformation(origin = {0, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.PowerFlow.PQBus load1(P = 3e+07, SNom = 3e+07, UNom = 400000)  annotation(
      Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus load2(P = 2e+07, SNom = 4e+07, UNom = 400000)  annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus load3(P = 2e+07, SNom = 2e+07, UNom = 400000)  annotation(
      Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus load4(P = 3e+07, SNom = 3e+07, UNom = 400000)  annotation(
      Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus slack(SNom = 1e+08, UNom = 400000)  annotation(
      Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Buses.Bus bus(UNom = 400000)  annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(load1.terminalAC, line1.terminalAC_a) annotation(
    Line(points = {{-60, -30}, {-40, -30}}));
  connect(line3.terminalAC_b, load4.terminalAC) annotation(
    Line(points = {{0, 14}, {0, 33}, {20, 33}, {20, 30}}));
  connect(line2.terminalAC_b, load2.terminalAC) annotation(
    Line(points = {{40, -30}, {46, -30}, {46, 0}, {60, 0}}));
  connect(load1.terminalAC, slack.terminalAC) annotation(
    Line(points = {{-60, -30}, {-60, 10}}));
  connect(line2.terminalAC_b, bus2.terminalAC) annotation(
    Line(points = {{40, -30}, {60, -30}}));
  connect(line1.terminalAC_b, bus.terminalAC) annotation(
    Line(points = {{-20, -30}, {0, -30}, {0, -30}, {0, -30}}));
  connect(line2.terminalAC_a, bus.terminalAC) annotation(
    Line(points = {{20, -30}, {0, -30}, {0, -30}, {0, -30}}));
  connect(line3.terminalAC_a, bus.terminalAC) annotation(
    Line(points = {{0, -6}, {0, -6}, {0, -30}, {0, -30}}));
  connect(load3.terminalAC, bus.terminalAC) annotation(
    Line(points = {{0, -50}, {0, -50}, {0, -30}, {0, -30}}));
annotation(
    Documentation(info = "<html><head></head><body>Small system with a few PQ buses, one PV bus and one slack bus connected through constant impedant lines.</body></html>"));end SmallSystem;
