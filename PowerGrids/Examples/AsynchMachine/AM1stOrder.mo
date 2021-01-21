within PowerGrids.Examples.AsynchMachine;

model AM1stOrder
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.localSteadyStateFixedPowerFlow) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.AsynchronousMachine1stOrder am1(H = 2, PStart(displayUnit = "MW") = 100000, QStart(displayUnit = "var") = 43595.04412101686, RrPu = 0.00489, RsPu = 0.028, SNom(displayUnit = "V.A") = 0.1e6, UNom(displayUnit = "V") = 20000, UStart(displayUnit = "kV") = 20000, XmPu = 4.236, XrPu = 0.1822, XsPu = 0.01) annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Electrical.PowerFlow.SlackBus slack(SNom(displayUnit = "MVA") = 1000000, UNom(displayUnit = "kV") = 20000) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(slack.terminal, am1.terminal) annotation(
    Line(points = {{0, 20}, {0, -30}}));
  annotation(
    Documentation(info = "<html><head></head><body>Infinite bus connected to an asynchronous machine.</body></html>"));
end AM1stOrder;
