within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsPF
  extends Modelica.Icons.Example;
  inner Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
    Placement(transformation(origin = {-130, -62}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Machines.SynchronousMachine4Windings GEN12(H = 6, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, isRefNodeEPF = true) annotation(
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
  PowerFlow.BusPF bus1(UNom = 24000) annotation(
    Placement(transformation(origin = {-62, -10}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.SlackBus slackBus1(SNom = 5e8, UNom = 24000) annotation(
    Placement(transformation(origin = {-62, -26}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.PVBus GEN21(UNom = 24000, SNom = 5e8, P = -6e8) annotation(
    Placement(transformation(origin = {-124, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.BusPF busGen21(UNom = 24000) annotation(
    Placement(transformation(origin = {-114, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.TransformerFixedRatioPF TGEN21(XccPu = 0.4*5e8/24000^2, UNomA = 24000, SNom = 5e8) annotation(
    Placement(transformation(origin = {-92, 10}, extent = {{10, -10}, {-10, 10}})));
  Electrical.Machines.SynchronousMachine4Windings GEN22(H = 6, PPF = -6e8, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, useExtraInitEquationsPV = true, isRefNodeEPF = false) annotation(
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
  Loads.LoadPQVoltageDependence loadPQ12(UNom = 24000, SNom = 5e8, PRefConst = 2e8, QRefConst = 1e8, alpha = 1, beta = 1)  annotation(
    Placement(transformation(origin = {98, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.PQBus loadPQ11(UNom = 24000, SNom = 5e8, P = 2e8, Q = 1e8)  annotation(
    Placement(transformation(origin = {-32, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.PowerFlow.PQBus LoadPQ31(P = 500000000, Q = 300000000, SNom = 5e8, UNom = 24000) annotation(
    Placement(transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence loadPQ32(PRefConst = 5e8, QRefConst = 3e8, SNom = 5e8, UNom = 24000) annotation(
    Placement(transformation(origin = {72, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(busGen12.terminalAC, GEN12.terminalAC) annotation(
    Line(points = {{80, -10}, {80, -20}}));
  connect(busGen12.terminalAC, line2.terminalAC_b) annotation(
    Line(points = {{80, -10}, {80, 0}}));
  connect(ufPu12.y, GEN12.ufPuIn) annotation(
    Line(points = {{64.7, -45}, {69.1, -45}, {69.1, -28}, {73.7, -28}}, color = {0, 0, 127}));
  connect(line11.terminalAC_b, bus1.terminalAC) annotation(
    Line(points = {{-62, 0}, {-62, -10}}));
  connect(slackBus1.terminalAC, bus1.terminalAC) annotation(
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
  connect(loadPQ11.terminalAC, bus1.terminalAC) annotation(
    Line(points = {{-32, -20}, {-32, -10}, {-62, -10}}));
  connect(LoadPQ31.terminalAC, busLoad1.terminalAC) annotation(
    Line(points = {{-70, 40}, {-70, 28}, {-62, 28}}));
  connect(LoadPQ21.terminalAC, busLoad1.terminalAC) annotation(
    Line(points = {{-54, 40}, {-54, 28}, {-62, 28}}));
  connect(busLoad2.terminalAC, loadPQ22.terminalAC) annotation(
    Line(points = {{80, 28}, {88, 28}, {88, 40}}));
  connect(loadPQ32.terminalAC, busLoad2.terminalAC) annotation(
    Line(points = {{72, 40}, {72, 28}, {80, 28}}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    Documentation(info = "<html><head></head>
<body>
<p>This example is to demonstrate the use of the EPF in a simple network, shown in the <i>green</i> box. The network is composed by two <i>generators</i>, one <i>transformer (ratio = 1)</i>, one <i>transmission line</i> and three <i>loads</i>.</p>

<p>In the <i>blue</i> box there is a the PF model which is indentical to the one automatically generated by the EPF starting from the network in the <i>green</i> box.</p>

<p>The adopted EPF strategy is to put the EPF <i>slack node</i> to the same node of one generator (the <code>GEN12</code> in this case), by selecting that generator to be the <i>reference node</i> for the EPF (flag <code>isRefNodeEPF = true</code>). The second generator is of <i>PV</i> type in the EPF (default behaviour).</p>

<p>Both the <i>generators</i> have no <i>control</i> so two <a href=\"modelica://PowerGrids.Controls.FreeOffset\"><i>free offset</i></a> components for each generator have been added in order to calculate the values of the <code>PmPu</code> and the <code>ufPuIn</code> inputs that maintain some conditions used to define the EPF (see below). In order to calculate the necessary <b><i>offset</i></b> some additional initial equations must be provided (one for each <b><i>offset</i></b> to be calculated). In this example the following additional equations have been used:</p>

<ul>
<li>two initial equations that enforce the <code>GEN12</code> to fix the <i>reference voltage</i> and the <i>reference angle</i> at the <i>generator port</i> to the same values fixed by the <b><i>slack node</i></b> in the EPF. These initial equations are provided by the <code>GEN12</code>, by setting the flag <code>useEPFtoSetExternalOffsetVref = true</code>,</li><br>
<li>two initial equations that enforce the <code>GEN22</code> to supply the same <i>active power</i> at the same <i>voltage</i> supplied by the <b><i>PV Bus</i></b> in the EPF, these initial equations are provided by the <code>GEN22</code>, by setting the flag <code>useEPFtoSetExternalOffsetPV = true</code> </li>
</ul>

The three loads are of the same type (<a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependence\">LoadPQVoltageDependence</a>) but the <code>loadPQ32</code> has <code>alpha = beta = 0</code>, so that it becomes a <i>constant PQ</i> load.

<p>The following figure shows the simulation results:</p><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Test/SynchronousMachine4WindingsPF.png\">
</figure>

<p>It is possible to observe  that:</p>
<ul>
    <li>both the <i>voltage</i> and the <i>phase</i> at the <code>GEN12</code> node are the same calculated by the EPF, as expected (<i>reference slack node in the EPF)</i>,</li>
    <li>the <i>active power</i> supplied by the <code>GEN22</code> and the <i>voltage</i> at its <code>bus</code> are the same calculated by the EPF, as expected (<i>PV bus in the EPF)</i>,</li>
    <li>both the <i>active</i> and the <i>reactive</i> power absorbed by the <code>loadPQ12</code> and by <code>loadPQ32</code> are the same calculated by the EPF (<i>constant PQ bus in the EPF</i>). The first (<code>loadPQ12</code>) maintains the same load of the EPF after the dynamic initialization because both the <i>voltage</i> and the <i>phase</i> at its node are the same of the EPF (<i>reference slack node in the EPF</i>). The second (<code>loadPQ32</code>) maintains the same load because it is of <i>constant PQ</i> type,</li>
    <li>the <i>active</i> and the <i>reactive</i> power absorbed by the <code>loadPQ22</code> is not the same calculated by the EPF because this load is of <i>voltage dependent</i> type and nothing ensure that the dynamic initialization is able to maintain the same voltage calculated by the EPF at its node.</li>
</ul>

<p>To better explain the reason of the difference between the EPF and the dynamic load of the <code>loadPQ22</code>, consider the sequence followed by the solver:</p>

<ol>
    <li>the EPF is calulated by substituting the <code>loadPQ22</code> whith a <i>fixed PQ load</i> that absorbs 500W and 300VAR <i>independently</i> from the voltage at its bus,</li>
    <li>under this condition, the EPF calculates a <i>voltage</i> of 20.925kV and a <i>phase</i> of -3.9 degree at the <code>busLoad2</code>,</li>
    <li>the values calculated by the EPF are used as first guesses for the dynamic initialization, but the dynamic <code>loadPQ22</code> at  20.925kV and -3.9 degree absorbs a power different from 500W and 300VAR, so the dynamic system is not in equilibrium and the dynamic initialization will converge to the new equilibrium shown in the figure above.</li>
</ol>

<p>In conclusion, the only way to maintain the EPF equilibrium also in the dynamic scenario is to use only <i>constant PQ</i> loads also in the dynamic model.</p>

<p>Note also that the use of <i>variable voltage</i> loads in the EPF is not possible because the convergence of the EPF is ensured only by using <i>linear</i> models. Keep in mind that the primary goal of the EPF is to find an <i>initial guess</i> to be used to initialize the <i>non-linear</i> dynamic models.</p>
</body>
</html>"),
    Diagram(graphics = {Rectangle(origin = {48, 4}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-62, 62}, {62, -62}}), Rectangle(origin = {-83, 11}, lineColor = {0, 85, 255}, lineThickness = 2, extent = {{-65, 55}, {65, -55}})}, coordinateSystem(extent = {{-160, 80}, {120, -80}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end SynchronousMachine4WindingsPF;