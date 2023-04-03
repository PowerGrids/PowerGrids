within PowerGrids.Examples.AsynchMachine;

model AM1stOrderNominalReference
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow, referenceFrequency = PowerGrids.Types.Choices.ReferenceFrequency.nominalFrequency)  annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.AsynchronousMachine1stOrder am1(H = 2,PStart(displayUnit = "MW") = 10000, QStart(displayUnit = "MVA") = 11878, RrPu = 0.00489, RsPu = 0.028, SNom(displayUnit = "V.A") = 0.05e6, UNom(displayUnit = "V") = 20000, UPhaseStart (displayUnit = "rad") =-0.0044349, UStart(displayUnit = "kV") = 19870.2, LmPu = 4.236, LrPu = 0.1822, LsPu = 0.01) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
PowerGrids.Electrical.Branches.LineConstantImpedance line(R = 20, SNom(displayUnit = "W") = 1e6, UNom (displayUnit = "V") = 20000, UNomA(displayUnit = "V") = 20e3, X = 200) annotation(
    Placement(visible = true, transformation(origin = {0, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.BusFault busFault(PStart(displayUnit = "W"), QStart = 0, R = 500, SNom(displayUnit = "V.A") = 1e6, UNom(displayUnit = "V") = 20e3, UPhaseStart = 0, UStart(displayUnit = "V") = 20e3, X = 500, startTime = 0.05, stopTime = 0.06) annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Buses.EquivalentGrid equivalentGrid(PStart(displayUnit = "W") = 0, SNom(displayUnit = "V.A") = 0.5e6, SSC(displayUnit = "V.A") = 100e6, UNom(displayUnit = "V") = 20e3) annotation(
    Placement(visible = true, transformation(origin = {-46, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(line.terminalB, am1.terminal) annotation(
    Line(points = {{0, -32}, {0, -50}}));
  connect(line.terminalA, busFault.terminal) annotation(
    Line(points = {{0, -12}, {0, -6}}));
  connect(equivalentGrid.terminal, busFault.terminal) annotation(
    Line(points = {{-46, 12}, {0, 12}, {0, -6}}));
  annotation(
    Documentation(info = "<html><head></head><body>Infinite bus connected to an asynchronous machine.</body></html>"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst --daeMode",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "ida", nls = "kinsol"));
end AM1stOrderNominalReference;
