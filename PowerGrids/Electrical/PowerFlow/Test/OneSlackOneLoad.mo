within PowerGrids.Electrical.PowerFlow.Test;

model OneSlackOneLoad
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus slack(SNom = 1e+08, UNom = 400000) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.PQBus load(P = 3e+07, Q = 0, SNom = 3e+07, UNom = 400000)  annotation(
    Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(load.terminal, slack.terminal) annotation(
    Line(points = {{0, -4}, {0, 20}}));
annotation(
    Documentation(info = "<html><head></head><body>Simple test case with one slack bus connected to a PQ bus.</body></html>"));end OneSlackOneLoad;
