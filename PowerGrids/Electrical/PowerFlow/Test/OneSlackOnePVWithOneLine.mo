within PowerGrids.Electrical.PowerFlow.Test;

model OneSlackOnePVWithOneLine
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus slack(SNom = 1e+08, UNom = 400000) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance line(R = 200, SNom = 3e+07, UNom = 400000, X = 2000)  annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  PowerGrids.Electrical.PowerFlow.PVBus node1(P = 3e+07, SNom = 3e+07, UNom = 400000)  annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(line.terminalB, node1.terminal) annotation(
    Line(points = {{0, -20}, {0, -50}}));
  connect(slack.terminal, line.terminalA) annotation(
    Line(points = {{0, 20}, {0, 0}}));
annotation(
    Documentation(info = "<html><head></head><body>Simple test case, similar to <a href=\"modelica://PowerGrids.Electrical.PowerFlow.Test.OneSlackOneLoadWithOneLine\"> OneSlackOneLoadWithOneLine </a> with a PV bus instead of a PQ bus.</body></html>"));
end OneSlackOnePVWithOneLine;
