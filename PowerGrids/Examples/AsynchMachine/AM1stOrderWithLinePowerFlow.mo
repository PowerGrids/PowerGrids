within PowerGrids.Examples.AsynchMachine;

model AM1stOrderWithLinePowerFlow
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.SlackBus slack(SNom(displayUnit = "MVA") = 1000000, UNom(displayUnit = "kV") = 20000) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.PowerFlow.AMBus am(P(displayUnit = "MW") = 100000, Rr = 0.00489, Rs = 0.028, SNom(displayUnit = "V.A") = 100000, UNom(displayUnit = "V") = 20000, Xm = 4.236, Xr = 0.1822, Xs = 0.01, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {0, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
PowerGrids.Electrical.Branches.LineConstantImpedance line(R = 20, SNom(displayUnit = "W") = 1e6, UNom(displayUnit = "V") = 20000, UNomA(displayUnit = "V") = 20e3, X = 200) annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
PowerGrids.Electrical.Buses.Bus bus(SNom(displayUnit = "V.A") = 0.1e6, UNom(displayUnit = "V") = 20e3) annotation(
    Placement(visible = true, transformation(origin = {0, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
connect(line.terminalA, slack.terminal) annotation(
    Line(points = {{0, 4}, {0, 20}}));
connect(bus.terminal, am.terminal) annotation(
    Line(points = {{0, -28}, {0, -42}}));
connect(line.terminalB, bus.terminal) annotation(
    Line(points = {{0, -16}, {0, -28}}));
  annotation(
    Documentation(info = "<html><head></head><body>Power flow for an infinite bus connected to an asynchronous machine.</body></html>"));
end AM1stOrderWithLinePowerFlow;
