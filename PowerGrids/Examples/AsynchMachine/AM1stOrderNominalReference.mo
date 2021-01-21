within PowerGrids.Examples.AsynchMachine;

model AM1stOrderNominalReference
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(referenceFrequency = PowerGrids.Types.Choices.ReferenceFrequency.nominalFrequency)  annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.AsynchronousMachine1stOrder am1(ExpCm = 2,H = 2, PStart(displayUnit = "MW") = 100000, QStart(displayUnit = "MVA") = 43568.36380106667, RrPu = 0.00489, RsPu = 0.028, SNom(displayUnit = "V.A") = 0.1e6, UNom(displayUnit = "V") = 20000, UPhaseStart =-0.04925915594457064, UStart(displayUnit = "kV") = 19424.17645210658, XmPu = 4.236, XrPu = 0.1822, XsPu = 0.01) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
PowerGrids.Electrical.Branches.LineConstantImpedance line(R = 20, SNom(displayUnit = "W") = 1e6, UNom (displayUnit = "V") = 20000, UNomA(displayUnit = "V") = 20e3, X = 200) annotation(
    Placement(visible = true, transformation(origin = {0, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart(displayUnit = "W") = -0.100631e6, QStart(displayUnit = "var") = -49875.4, SNom(displayUnit = "V.A") = 1e6, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom(displayUnit = "V") = 20000, UPhaseStart = 0, UStart(displayUnit = "V") = 20e3, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8) annotation(
    Placement(visible = true, transformation(origin = {-54, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu(y = -GEN.PStart / GEN.SNom) annotation(
    Placement(visible = true, transformation(origin = {-84, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn(y = GEN.ufPuInStart) annotation(
    Placement(visible = true, transformation(origin = {-84, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.BusFault busFault(PStart(displayUnit = "W"), QStart = 0, R = 500, SNom(displayUnit = "V.A") = 1e6, UNom(displayUnit = "V") = 20e3, UPhaseStart = 0, UStart(displayUnit = "V") = 20e3, X = 500, startTime = 0.5, stopTime = 0.6) annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ufPuIn.y, GEN.ufPuIn) annotation(
    Line(points = {{-72, -14}, {-70, -14}, {-70, 2}, {-64, 2}}, color = {0, 0, 127}));
  connect(PmPu.y, GEN.PmPu) annotation(
    Line(points = {{-72, 10}, {-64, 10}}, color = {0, 0, 127}));
  connect(line.terminalB, am1.terminal) annotation(
    Line(points = {{0, -32}, {0, -50}}));
  connect(GEN.terminal, busFault.terminal) annotation(
    Line(points = {{-54, 6}, {0, 6}, {0, -6}}));
  connect(line.terminalA, busFault.terminal) annotation(
    Line(points = {{0, -12}, {0, -6}}));
  annotation(
    Documentation(info = "<html><head></head><body>Infinite bus connected to an asynchronous machine.</body></html>"),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst --daeMode",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "ida", nls = "kinsol"));
end AM1stOrderNominalReference;
