within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsPF
  extends Modelica.Icons.Example;
  inner Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
    Placement(transformation(origin = {-130, -62}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Machines.SynchronousMachine4Windings GEN12(H = 6, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, isRefNode = true) annotation(
    Placement(transformation(origin = {80, -20}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Branches.LineConstantImpedance line2(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation(
    Placement(transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Electrical.Buses.Bus busGen12(UNom = 24000) annotation(
    Placement(transformation(origin = {80, -10}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Controls.FreeOffset PmPu12 annotation(
    Placement(transformation(origin = {57, -23}, extent = {{-7, -7}, {7, 7}})));
  PowerGrids.Controls.FreeOffset ufPu12 annotation(
    Placement(transformation(origin = {57, -45}, extent = {{-7, -7}, {7, 7}})));
  PowerGrids.Controls.FreeOffset PmPu22 annotation(
    Placement(transformation(origin = {19, 35}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  PowerFlow.PQBus LoadPQ21(P = 500000000, Q = 300000000, SNom = 5e8, UNom = 24000) annotation(
    Placement(transformation(origin = {-54, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerFlow.LineConstantImpedancePF line11(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation(
    Placement(transformation(origin = {-62, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.BusPF busGen11(UNom = 24000) annotation(
    Placement(transformation(origin = {-62, -10}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.SlackBus slackBus1(SNom = 5e8, UNom = 24000) annotation(
    Placement(transformation(origin = {-62, -26}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.PVBus GEN21(UNom = 24000, SNom = 5e8, P = -6e8) annotation(
    Placement(transformation(origin = {-124, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.BusPF busGen21(UNom = 24000) annotation(
    Placement(transformation(origin = {-114, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.TransformerFixedRatioPF TGEN21(XccPu = 0.4*5e8/24000^2, UNomA = 24000, SNom = 5e8) annotation(
    Placement(transformation(origin = {-92, 10}, extent = {{10, -10}, {-10, 10}})));
  Electrical.Machines.SynchronousMachine4Windings GEN22(H = 6, PPF = -6e8, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, useExtraInitEquationsPV = true) annotation(
    Placement(transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Controls.FreeOffset ufPu22 annotation(
    Placement(transformation(origin = {-1, 35}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Electrical.Buses.Bus busGen22(UNom = 24000) annotation(
    Placement(transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Branches.TransformerFixedRatio TGEN22(XccPu = 0.4*5e8/24000^2, UNomA = 24000, SNom = 5e8) annotation(
    Placement(transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  PowerFlow.BusPF busLoad1(UNom = 24000)  annotation(
    Placement(transformation(origin = {-62, 28}, extent = {{-10, -10}, {10, 10}})));
  Buses.Bus busLoad2(UNom = 24000)  annotation(
    Placement(transformation(origin = {80, 28}, extent = {{-10, -10}, {10, 10}})));
  Loads.LoadPQVoltageDependence loadPQ22(UNom = 24000, SNom = 5e8, PRefConst = 5e8, QRefConst = 3e8, alpha = 1, beta = 1)  annotation(
    Placement(transformation(origin = {88, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Loads.LoadPQVoltageDependence loadPQ12(UNom = 24000, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8, alpha = 1, beta = 1, URef = 24000)  annotation(
    Placement(transformation(origin = {98, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.PQBus loadPQ11(UNom = 24000, SNom = 5e8, P = 2e8, Q = 1e8)  annotation(
    Placement(transformation(origin = {-32, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.PQBus LoadPQ31(P = 500000000, Q = 300000000, SNom = 5e8, UNom = 24000) annotation(
    Placement(transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence loadPQ32(PRefConst = 5e8, QRefConst = 3e8, SNom = 5e8, UNom = 24000) annotation(
    Placement(transformation(origin = {72, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Loads.LoadImpedancePQ LoadImp42(UNom = 24000, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8)  annotation(
    Placement(transformation(origin = {106, 40}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerFlow.PQBus LoadPQ41(UNom = 24000, SNom = 5e8, P = 2e8, Q = 1e8)  annotation(
    Placement(transformation(origin = {-38, 40}, extent = {{10, 10}, {-10, -10}}, rotation = -0)));
equation
  connect(busGen12.terminalAC, GEN12.terminalAC) annotation(
    Line(points = {{80, -10}, {80, -20}}));
  connect(busGen12.terminalAC, line2.terminalAC_b) annotation(
    Line(points = {{80, -10}, {80, 0}}));
  connect(ufPu12.y, GEN12.ufPuIn) annotation(
    Line(points = {{64.7, -45}, {69.1, -45}, {69.1, -28}, {73.7, -28}}, color = {0, 0, 127}));
  connect(line11.terminalAC_b, busGen11.terminalAC) annotation(
    Line(points = {{-62, 0}, {-62, -10}}));
  connect(slackBus1.terminalAC, busGen11.terminalAC) annotation(
    Line(points = {{-62, -26}, {-62, -10}}));
  connect(GEN21.terminalAC, busGen21.terminalAC) annotation(
    Line(points = {{-124, 10}, {-114, 10}}));
  connect(busGen21.terminalAC, TGEN21.terminalAC_b) annotation(
    Line(points = {{-114, 10}, {-102, 10}}));
  connect(PmPu12.y, GEN12.PmPu) annotation(
    Line(points = {{64.7, -23}, {74.7, -23}}, color = {0, 0, 127}));
  connect(PmPu22.y, GEN22.PmPu) annotation(
    Line(points = {{20, 28}, {18, 28}, {18, 16}}, color = {0, 0, 127}));
  connect(ufPu22.y, GEN22.ufPuIn) annotation(
    Line(points = {{-1, 27}, {-2, 27}, {-2, 24}, {12, 24}, {12, 16}}, color = {0, 0, 127}));
  connect(GEN22.terminalAC, busGen22.terminalAC) annotation(
    Line(points = {{20, 10}, {30, 10}}));
  connect(busGen22.terminalAC, TGEN22.terminalAC_b) annotation(
    Line(points = {{30, 10}, {40, 10}}));
  connect(TGEN21.terminalAC_a, busLoad1.terminalAC) annotation(
    Line(points = {{-82, 10}, {-68, 10}, {-68, 28}, {-62, 28}}));
  connect(line11.terminalAC_a, busLoad1.terminalAC) annotation(
    Line(points = {{-62, 20}, {-62, 28}}));
  connect(TGEN22.terminalAC_a, busLoad2.terminalAC) annotation(
    Line(points = {{60, 10}, {74, 10}, {74, 28}, {80, 28}}));
  connect(line2.terminalAC_a, busLoad2.terminalAC) annotation(
    Line(points = {{80, 20}, {80, 28}}));
  connect(loadPQ12.terminalAC, busGen12.terminalAC) annotation(
    Line(points = {{98, -20}, {98, -10}, {80, -10}}));
  connect(loadPQ11.terminalAC, busGen11.terminalAC) annotation(
    Line(points = {{-32, -20}, {-32, -10}, {-62, -10}}));
  connect(LoadPQ31.terminalAC, busLoad1.terminalAC) annotation(
    Line(points = {{-70, 40}, {-70, 28}, {-62, 28}}));
  connect(LoadPQ21.terminalAC, busLoad1.terminalAC) annotation(
    Line(points = {{-54, 40}, {-54, 28}, {-62, 28}}));
  connect(busLoad2.terminalAC, loadPQ22.terminalAC) annotation(
    Line(points = {{80, 28}, {88, 28}, {88, 40}}));
  connect(loadPQ32.terminalAC, busLoad2.terminalAC) annotation(
    Line(points = {{72, 40}, {72, 28}, {80, 28}}));
  connect(busLoad2.terminalAC, LoadImp42.terminalAC) annotation(
    Line(points = {{80, 28}, {106, 28}, {106, 40}}));
  connect(busLoad1.terminalAC, LoadPQ41.terminalAC) annotation(
    Line(points = {{-62, 28}, {-38, 28}, {-38, 40}}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    Documentation(info = "<html><head></head>
<body>
<p>This example is to demonstrate the use of the EPF in a simple network, shown in the <i>green</i> box. The network is composed by two <i>generators</i>, one <i>transformer (ratio = 1)</i>, one <i>transmission line</i> and four <i>loads</i>.</p>

<p>In the <i>blue</i> box is implemented the PF model which is indentical to the one automatically generated by the EPF, starting from the network in the <i>green</i> box.</p>

<p>The adopted EPF strategy is to put the EPF <i>slack node</i> to the same node of one generator (the <code>GEN12</code> in this case), by selecting that generator to be the <i>reference node</i> for the EPF (flag <code>isRefNode = true</code>). The second generator is of <i>PV</i> type in the EPF (default behaviour).</p>

<p>Both the <i>generators</i> have no <i>control</i> so two <a href=\"modelica://PowerGrids.Controls.FreeOffset\"><i>free offset</i></a> components for each generator have been added in order to calculate the values of the <code>PmPu</code> and the <code>ufPuIn</code> inputs. In order to calculate that <b><i>offset</i></b> some additional initial equations must be provided (one for each <b><i>offset</i></b>). In this example the following additional equations have been used:</p>

<ul>
<li>two initial equations that enforce the <code>GEN12</code> to fix the <i>reference voltage</i> and the <i>reference angle</i> at the <i>generator port</i> to the same values fixed by the <b><i>slack node</i></b> in the EPF. These initial equations are provided by the <code>GEN12</code>, by setting the flag <code>isRefNode = true</code>,</li><br>
<li>two initial equations that enforce the <code>GEN22</code> to supply the same <i>active power</i> at the same <i>voltage</i> supplied by the <b><i>PV Bus</i></b> in the EPF, these initial equations are provided by the <code>GEN22</code>, by setting the flag <code>useExtraInitEquationsPV = true</code> </li>
</ul>

Three of the four loads (<code>loadPQ12</code>, <code>loadPQ22</code> and <code>loadPQ32</code>) are of the type (<a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependence\">LoadPQVoltageDependence</a>), while the fourth (<code>loadImp42</code>) load is of the type (<a href=\"modelica://PowerGrids.Electrical.Loads.LoadImpedancePQ\">LoadImpedancePQ</a>). The <code>loadPQ32</code> has <code>alpha = beta = 0</code>, so it becomes a <i>constant PQ</i> load.<br><p>The following figure shows the simulation results:</p><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Test/SynchronousMachine4WindingsPF.png\">
</figure>

<p>It is possible to see that all the network values calculated by the EPF are maintained during the dynamic initialization, so the dynamic simuation starts exactly from the same scenario calculated by the EPF. This result is achieved by setting <code>URef = UStart</code> (default behavior) in the <code>loads</code>. If the <code>URef</code> is put to a different value (e.g., <code>URef = UNom</code>) then the dynamic initialization does not preserve the solution of the EPF because the loads that depend from the voltage use a reference (<code>URef = UNom</code>) different from the one calculated by the EPF (<code>UStart</code>).</p>

<p>To better explain the reason of the difference between the EPF and the dynamic initialization when the <code>URef</code> is different from <code>UStart</code>, consider the sequence followed by the solver:</p>

<ol>
    <li>the EPF is calulated by substituting any <code>load</code> with a <code>fixed PQ load</code>, which absorbs a fixed <code>P</code> and <code>Q</code> <i>independently</i> from the voltage at its bus,</li>
    <li>under this condition, the EPF calculates the <i>voltage</i> and the <i>phase</i> at each <code>bus</code>,</li>
    <li>the values calculated by the EPF are used as first guesses for the dynamic initialization, but the dynamic <code>loads</code> which depend from the voltage will absorb a power different from the one absorbed in the EPF, because the <code>URef</code> is different from the one calculated by the EPF (<code>UStart</code>), so the dynamic initialization is not in equilibrium at the initial guesses and the solver will converge to the new equilibrium.</li>
</ol>

<p>In conclusion, the only way to maintain the EPF equilibrium also at the end of the dynamic initialization  is to use <code>URef = UStart</code> in all the voltage dependent loads.</p>

</body></html>"),
    Diagram(graphics = {Rectangle(origin = {51, 6}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-65, 60}, {65, -60}}), Rectangle(origin = {-83, 11}, lineColor = {0, 85, 255}, lineThickness = 2, extent = {{-65, 55}, {65, -55}})}, coordinateSystem(extent = {{-160, 80}, {120, -80}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end SynchronousMachine4WindingsPF;