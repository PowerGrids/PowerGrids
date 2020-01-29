within PowerGrids.Electrical.PowerFlow.Test;
model OneSlackOneZLoad
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus slack(SNom = 1e+08, UNom = 400000) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.ZLoad load(PNom = 2e+07, QNom = 1e+07, SNom = 3e+07, UNom = 400000)  annotation(
    Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(load.terminal, slack.terminal) annotation(
    Line(points = {{0, -4}, {0, 20}}));
annotation(
    Documentation(info = "<html><head></head><body>Simple test system with one slack node and one <a href=\"modelica://PowerGrids.Electrical.PowerFlow.ZLoad\"> ZLoad</a>.</body></html>"));end OneSlackOneZLoad;
