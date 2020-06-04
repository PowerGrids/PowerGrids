within PowerGrids.Examples.Tutorial.GridOperation.LoadChange;
model LoadChangeByModifier "Load step response specified by modifiers on a copy of the static system"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin={50,30},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin={-26,6},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={-6,-16},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={42,-16},    extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, UPhaseStartA = 0.161156, UPhaseStartB = 0, UStartA = 0.9917 * 21e3, UStartB = 0.95227 * 380e3, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin={16,-16},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={68,-6},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(
      PRef = 4.75e+08*(if time < 2 then 1 else 1.05) "Active power consumption at reference voltage",
      QRef = 7.6e+07*(if time < 2 then 1 else 1.04) "Reactive power consumption at reference voltage",
      SNom = 5e+08,
      UNom = 380000,
      URef = 1.05 * 380e3,
      portVariablesPhases = true,
      portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={62,-28},     extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu(y = -GEN.PStart / GEN.SNom)  annotation (
    Placement(visible = true, transformation(origin={-60,10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn(y = GEN.ufPuInStart)  annotation (
    Placement(visible = true, transformation(origin={-60,-14},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(PmPu.y, GEN.PmPu) annotation (
    Line(points={{-49,10},{-36,10}},                        color = {0, 0, 127}));
  connect(ufPuIn.y, GEN.ufPuIn) annotation (
    Line(points={{-49,-14},{-44,-14},{-44,2},{-36,2}},                       color = {0, 0, 127}));
  connect(GRIDL.terminal, NTHV.terminal) annotation (
    Line(points={{62,-28},{44,-28},{44,-16},{42,-16}}));
  connect(GEN.terminal, NTLV.terminal) annotation (
    Line(points={{-26,6},{-26,-16},{-6,-16}}));
  connect(NTLV.terminal, TGEN.terminalA) annotation (
    Line(points={{-6,-16},{6,-16}}));
  connect(TGEN.terminalB, NTHV.terminal) annotation (
    Line(points={{26,-16},{42,-16}}));
  connect(NTHV.terminal, GRID.terminal) annotation (
    Line(points={{42,-16},{44,-16},{44,-6},{68,-6}}));

annotation (
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.008),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"),
  Diagram(coordinateSystem(extent={{-80,-60},{80,40}}),                             graphics={  Text(origin={
              -2.2,-48},                                                                                                  extent={{
              -59.8,8},{70.2,-12}},
          textString="To see load change in OpenModelica look at text view",
          lineColor={0,0,0})}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})));
end LoadChangeByModifier;
