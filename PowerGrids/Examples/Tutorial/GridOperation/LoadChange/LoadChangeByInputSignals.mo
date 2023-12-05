within PowerGrids.Examples.Tutorial.GridOperation.LoadChange;
model LoadChangeByInputSignals "Load step response specified by input signals"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin={70,50},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PPF = -4.75e+08, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(transformation(origin = {-50, 24}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Electrical.Buses.Bus NTLV(UNom = 21000)  annotation (
    Placement(visible = true, transformation(origin={-30,4},     extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin={-2,4},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1 / 10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05 * 380e3)  annotation (
    Placement(visible = true, transformation(origin={56,14},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQInputs GRIDL(SRef = 5e+08, UNom = 380000, URef = 1.05 * 380e3)  annotation (
    Placement(visible = true, transformation(origin={56,-8},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu(y = -GEN.PStart / GEN.SNom)  annotation (
    Placement(transformation(origin = {-88, 26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPuIn(y = GEN.ufPuInStart)  annotation (
    Placement(transformation(origin = {-88, 44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step PRef(height = 475e6 * 0.05, offset = 475e6, startTime = 2)  annotation (
    Placement(visible = true, transformation(origin={10,-26},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step QRef(height = 76e6 * 0.04, offset = 76e6, startTime = 2) annotation (
    Placement(visible = true, transformation(origin={-34,-44},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Faults.ThreePhaseFault FAULT(R = 0.05,SNom = 5e+08, UNom = 380000, startTime = 1e10, stopTime = 1e10) annotation(
    Placement(visible = true, transformation(origin = {70, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PmPu.y, GEN.PmPu) annotation (
    Line(points={{-77, 26}, {-56, 26}},                        color = {0, 0, 127}));
  connect(ufPuIn.y, GEN.ufPuIn) annotation (
    Line(points={{-77,44},{-72,44},{-72,32},{-56,32}},                         color = {0, 0, 127}));
  connect(GEN.terminalAC, NTLV.terminalAC) annotation (
    Line(points={{-50,24},{-50,4},{-30,4}}));
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation (
    Line(points={{-30,4},{-12,4}}));
  connect(QRef.y, GRIDL.QRefIn) annotation (
    Line(points={{-23,-44},{40,-44},{40, -18}, {46, -18}},                     color = {0, 0, 127}));
  connect(TGEN.terminalAC_b, GRID.terminalAC) annotation(
    Line(points = {{8, 4}, {56, 4}, {56, 14}}));
  connect(PRef.y, GRIDL.PRefIn) annotation(
    Line(points = {{22, -26}, {32, -26}, {32, -12}, {46, -12}}, color = {0, 0, 127}));
  connect(GRIDL.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{56, -8}, {56, 14}}));
  connect(FAULT.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{70, -8}, {70, 4}, {56, 4}, {56, 14}}));

annotation (
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.008),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv="LOG_INIT_HOMOTOPY"),
    Diagram(coordinateSystem(extent={{-100,-60},{80,60}})));
end LoadChangeByInputSignals;
