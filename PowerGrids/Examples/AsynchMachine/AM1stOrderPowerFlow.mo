within PowerGrids.Examples.AsynchMachine;

model AM1stOrderPowerFlow
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus slack(SNom(displayUnit = "MVA") = 1000000, UNom(displayUnit = "kV") = 20000) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.AMBus am(P(displayUnit = "MW") = 100000, Rr = 0.00489, Rs = 0.028, SNom(displayUnit = "MVA") = 100000, UNom(displayUnit = "V") = 20000, Xm = 4.236, Xr = 0.1822, Xs = 0.01, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(am.terminal, slack.terminal) annotation(
    Line(points = {{0, -20}, {0, 20}}));
  annotation(
    Documentation(info = "<html><head></head><body>Power flow for an infinite bus connected to an asynchronous machine.</body></html>"));
end AM1stOrderPowerFlow;
