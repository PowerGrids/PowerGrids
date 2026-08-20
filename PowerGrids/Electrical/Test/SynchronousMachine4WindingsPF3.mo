within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsPF3
  extends Modelica.Icons.Example;
  inner Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
    Placement(transformation(origin = {-82, -62}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Machines.SynchronousMachine4Windings GEN12(H = 6, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, redeclare model ComponentPF = Electrical.PowerFlow.SlackBus(UNom = 24000, SNom = 5e8, setPhase = false) "slack bus is used in EPF instead of the PVBus, please manually fill the relevant parameters", useEPFtoSetExternalOffsetPQ = true) annotation(
    Placement(transformation(origin = {80, -20}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Loads.LoadImpedancePQ LoadPQ2(PRefConst = 500000000, QRefConst = 300000000, SNom = 550000000, UNom = 24000) annotation(
    Placement(transformation(origin = {80, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Electrical.Buses.ReferenceBus refBus2(SNom = 500000000, UNom = 24000, forceSlackPowerToZero = false, redeclare model ComponentPF = Electrical.PowerFlow.PhaseReferenceBusPF(UNom = 24000, SNom = 5e8) "to be used if the slack bus is embedded in another component but it does not prescribe the voltage") annotation(
    Placement(transformation(origin = {80, 28}, extent = {{-10, -10}, {10, 10}})));
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
  PowerFlow.PQBus LoadPQ1(P = 500000000, Q = 300000000, SNom = 550000000, UNom = 24000) annotation(
    Placement(transformation(origin = {-62, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerFlow.LineConstantImpedancePF line11(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation(
    Placement(transformation(origin = {-62, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.BusPF bus1(UNom = 24000) annotation(
    Placement(transformation(origin = {-62, -10}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.SlackBus slackBus1(SNom = 5e8, UNom = 24000, UPhase(displayUnit = "rad"), setPhase = false) annotation(
    Placement(transformation(origin = {-62, -26}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.PhaseReferenceBusPF VrefBus1(UNom = 24000, SNom = 5e8) annotation(
    Placement(transformation(origin = {-62, 28}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.PVBus GEN21(UNom = 24000, SNom = 5e8, P = -2e8) annotation(
    Placement(transformation(origin = {-124, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.BusPF busGen21(UNom = 24000) annotation(
    Placement(transformation(origin = {-114, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.TransformerFixedRatioPF TGEN21(XccPu = 0.4*5e8/24000^2, UNomA = 24000, SNom = 5e8) annotation(
    Placement(transformation(origin = {-92, 10}, extent = {{10, -10}, {-10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN22(H = 6, PPF = -2e8, SNom = 5e8, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = Types.Choices.TimeConstantsApproximation.classicalDefinition, useEPFtoSetExternalOffsetPQ = false, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, useEPFtoSetExternalOffsetPV = true) annotation(
    Placement(transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Controls.FreeOffset ufPu22 annotation(
    Placement(transformation(origin = {-1, 35}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  PowerGrids.Electrical.Buses.Bus busGen22(UNom = 24000) annotation(
    Placement(transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Branches.TransformerFixedRatio TGEN22(XccPu = 0.4*5e8/24000^2, UNomA = 24000, SNom = 5e8) annotation(
    Placement(transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
equation
  connect(LoadPQ2.terminalAC, refBus2.terminalAC) annotation(
    Line(points = {{80, 38}, {80, 28}}));
  connect(busGen12.terminalAC, GEN12.terminalAC) annotation(
    Line(points = {{80, -10}, {80, -20}}));
  connect(busGen12.terminalAC, line2.terminalAC_b) annotation(
    Line(points = {{80, -10}, {80, 0}}));
  connect(line2.terminalAC_a, refBus2.terminalAC) annotation(
    Line(points = {{80, 20}, {80, 28}}));
  connect(ufPu12.y, GEN12.ufPuIn) annotation(
    Line(points = {{64.7, -45}, {69.1, -45}, {69.1, -28}, {73.7, -28}}, color = {0, 0, 127}));
  connect(line11.terminalAC_b, bus1.terminalAC) annotation(
    Line(points = {{-62, 0}, {-62, -10}}));
  connect(slackBus1.terminalAC, bus1.terminalAC) annotation(
    Line(points = {{-62, -26}, {-62, -10}}));
  connect(VrefBus1.terminalAC, LoadPQ1.terminalAC) annotation(
    Line(points = {{-62, 28}, {-62, 38}}));
  connect(line11.terminalAC_a, VrefBus1.terminalAC) annotation(
    Line(points = {{-62, 20}, {-62, 28}}));
  connect(GEN21.terminalAC, busGen21.terminalAC) annotation(
    Line(points = {{-124, 10}, {-114, 10}}));
  connect(busGen21.terminalAC, TGEN21.terminalAC_b) annotation(
    Line(points = {{-114, 10}, {-102, 10}}));
  connect(TGEN21.terminalAC_a, VrefBus1.terminalAC) annotation(
    Line(points = {{-82, 10}, {-68, 10}, {-68, 28}, {-62, 28}}));
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
  connect(TGEN22.terminalAC_a, refBus2.terminalAC) annotation(
    Line(points = {{60, 10}, {74, 10}, {74, 28}, {80, 28}}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    Documentation(info = "<html><head></head>
<body>
<p>This example extends the <i>green</i> case of the example <a href=\"modelica://PowerGrids.Electrical.Test.SynchronousMachine4WindingsPF2\">SynchronousMachine4WindingsPF2</a> by adding a second <a href=\"modelica://PowerGrids.Electrical.Machines.SynchronousMachine4Windings\">generator</a>, connected to the <a href=\"modelica://PowerGrids.Electrical.Buses.ReferenceBus\">reference bus</a> via a <a href=\"modelica://PowerGrids.Electrical.Branches.TransformerFixedRatio\">fixed-ratio transformer</a> (ratio = 1).

<p> The new generator is modeled as a <a href=\"modelica://PowerGrids.Electrical.PowerFlow.PVBus\">PV bus</a> in the EPF (<i>blue</i> box).</p>

<p>The adopted EPF strategy is the same used in the <b><i>SynchronousMachine4WindingsPF2</i></b> example, that is to move the <i>EPF slack</i> node to the same node of one generator (the <code>GEN12</code> in this case), by redeclaring its EPF component as a <a href=\"modelica://PowerGrids.Electrical.PowerFlow.SlackBus\">SlackBus</a>.</p>

<p>Also in this case, in order to maintain the same <i>reference node</i> in both the EPF and the <i>dynamic</i> model, the <i>EPF slack</i> node doesn't prescribe the <i>reference angle</i> (flag <code>setPhase = false</code> in the redeclaration of the EPF component in the <i>generator</i>), the <i>reference angle</i> is still prescribed by the EPF component of the <i>reference node</i> (<a href=\"modelica://PowerGrids.Electrical.PowerFlow.PhaseReferenceBusPF\">PhaseReferenceBusPF</a>, redeclared as EPF component in the <i>reference node</i>).</p>


<p>Both the <i>generators</i> have no <i>control</i> so two <a href=\"modelica://PowerGrids.Controls.FreeOffset\"><i>free offset</i></a> components for each generator have been used in order to calculate the values of the <code>PmPu</code> and the <code>ufPuIn</code> inputs that maintain the solution calculated by the EPF. All the necessary <b><i>offset</i></b> must be back-calulated starting from the solution calculated by the EPF, to do this some additional initial equations must be provided (one for each <b><i>offset</i></b> to be calculated). In this example the following additional equations have been choosen:</p>

<ul>
<li>two initial equations that enforce the <code>GEN12</code> to supply the same <code>P</code> and <code>Q</code> supplied by the <b><i>slack</i></b> node in the EPF, these initial equations are provided by the <code>GEN12</code>, by setting the flag <code>useEPFtoSetExternalOffsetPQ = true</code>,</li><br>
<li>two initial equations that enforce the <code>GEN22</code> to supply the same <code>P</code> and <code>V</code> supplied by the <b><i>PV Bus</i></b> in the EPF, these initial equations are provided by the <code>GEN22</code>, by setting the flag <code>useEPFtoSetExternalOffsetPV = true</code> </li>
</ul>

<p>The following figure shows the simulation results:</p><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Test/SynchronousMachine4WindingsPF3.png\">
</figure>

<p>It is possible to see that also in this example the working point calculated by the dynamic initialization is exactly the same calculated by the EPF.</p>

</body>
</html>"),
    Diagram(graphics = {Rectangle(origin = {43, 4}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-67, 62}, {67, -62}}), Rectangle(origin = {-90, 12}, lineColor = {0, 85, 255}, lineThickness = 2, extent = {{-56, 54}, {56, -54}})}, coordinateSystem(extent = {{-160, 80}, {120, -80}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end SynchronousMachine4WindingsPF3;