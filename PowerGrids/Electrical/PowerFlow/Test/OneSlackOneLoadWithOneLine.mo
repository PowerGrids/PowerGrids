within PowerGrids.Electrical.PowerFlow.Test;

model OneSlackOneLoadWithOneLine
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus slack(SNom = 1e+08, UNom = 400000) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus load(P = 3e+07, Q = 0, SNom = 3e+07, UNom = 400000)  annotation(
    Placement(visible = true, transformation(origin = {0, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance line(R = 200, SNom = 3e+07, UNom = 400000, X = 2000)  annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
equation
  connect(line.terminalB, load.terminal) annotation(
    Line(points = {{0, -20}, {0, -42}}));
  connect(line.terminalA, slack.terminal) annotation(
    Line(points = {{0, 0}, {0, 20}}));
annotation(
    Documentation(info = "<html><head></head><body>Simple test case with one slack bus and one PQ bus connected through a <a href=\"modelica://PowerGrids.Electrical.Branches.LineConstantImpedance\"> LineConstantImpedance </a> line. Adds a line between the slack and the PQ buses compared to <a href=\"modelica://PowerGrids.Electrical.PowerFlow.Test.OneSlackOneLoad\"> OneSlackOneLoad </a> test.</body></html>"));end OneSlackOneLoadWithOneLine;
