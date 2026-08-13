within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsPF2
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
    Placement(transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine2(H = 6, PPF = 500000000, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, redeclare model ComponentPF = PowerGrids.Electrical.PowerFlow.SlackBus(UNom = 24000, SNom = 5e8, setPhase = false) "slack bus is used in EPF instead of the PVBus, please manually fill the relevant parameters", useEPFtoSetExternalOffset = true) annotation(
    Placement(transformation(origin = {2, -20}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQ LoadPQ2(PRefConst = 500000000, QRefConst = 300000000, SNom = 550000000, UNom = 24000) annotation(
    Placement(transformation(origin = {2, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.ReferenceBus refBus2(SNom = 500000000, UNom = 24000, forceSlackPowerToZero = false, redeclare model ComponentPF = PowerGrids.Electrical.PowerFlow.PhaseReferenceBusPF(UNom = 24000, SNom = 5e8) "to be used if the slack bus is embedded in another component but it does not prescribe the voltage") annotation(
    Placement(transformation(origin = {2, 28}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance line2(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation(
    Placement(transformation(origin = {2, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Buses.Bus bus2(UNom = 24000) annotation(
    Placement(transformation(origin = {2, -10}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Controls.FreeOffset PmPu2 annotation(
    Placement(transformation(origin = {-23, -55}, extent = {{-7, -7}, {7, 7}})));
  PowerGrids.Controls.FreeOffset ufPu2 annotation(
    Placement(transformation(origin = {-51, -65}, extent = {{-7, -7}, {7, 7}})));
  Buses.ReferenceBus refBus3(SNom = 500000000, UNom = 24000, forceSlackPowerToZero = false, redeclare model ComponentPF = PowerGrids.Electrical.PowerFlow.PhaseReferenceBusPF(UNom = 24000, SNom = 5e8) "to be used if the slack bus is embedded in another component but it does not prescribe the voltage") annotation(
    Placement(transformation(origin = {84, 30}, extent = {{-10, -10}, {10, 10}})));
  Branches.LineConstantImpedance line3(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation(
    Placement(transformation(origin = {84, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Buses.Bus bus3(UNom = 24000) annotation(
    Placement(transformation(origin = {84, -8}, extent = {{-10, -10}, {10, 10}})));
  Machines.SynchronousMachine4Windings machine3(H = 6, PPF = 500000000, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, redeclare model ComponentPF = PowerGrids.Electrical.PowerFlow.SlackBus(UNom = 24000, SNom = 5e8, setPhase = false) "slack bus is used in EPF instead of the PVBus, please manually fill the relevant parameters", useEPFtoSetExternalOffset = true) annotation(
    Placement(transformation(origin = {84, -18}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Controls.FreeOffset PmPu3 annotation(
    Placement(transformation(origin = {51, -53}, extent = {{-7, -7}, {7, 7}})));
  PowerGrids.Controls.FreeOffset ufPu3 annotation(
    Placement(transformation(origin = {29, -65}, extent = {{-7, -7}, {7, 7}})));
  Loads.LoadPQVoltageDependence loadPQ3(UNom = 24000, SNom = 550000000, PRefConst = 500000000, QRefConst = 300000000) annotation(
    Placement(transformation(extent = {{74, 48}, {94, 28}})));
  PowerFlow.PQBus LoadPQ1(P = 500000000, Q = 300000000, SNom = 550000000, UNom = 24000) annotation(
    Placement(transformation(origin = {-80, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerFlow.LineConstantImpedancePF line1(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation(
    Placement(transformation(origin = {-80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerFlow.BusPF bus1(UNom = 24000) annotation(
    Placement(transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.SlackBus slackBus1(SNom = 5e8, UNom = 24000, UPhase(displayUnit = "rad"), setPhase = false) annotation(
    Placement(transformation(origin = {-80, -26}, extent = {{-10, -10}, {10, 10}})));
  PowerFlow.PhaseReferenceBusPF VrefBus1(UNom = 24000, SNom = 5e8)  annotation(
    Placement(transformation(origin = {-80, 28}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(LoadPQ2.terminalAC, refBus2.terminalAC) annotation(
    Line(points = {{2, 38}, {2, 28}}));
  connect(bus2.terminalAC, machine2.terminalAC) annotation(
    Line(points = {{2, -10}, {2, -20}}));
  connect(bus2.terminalAC, line2.terminalAC_b) annotation(
    Line(points = {{2, -10}, {2, 0}}));
  connect(line2.terminalAC_a, refBus2.terminalAC) annotation(
    Line(points = {{2, 20}, {2, 28}}));
  connect(PmPu2.y, machine2.PmPu) annotation(
    Line(points = {{-15.3, -55}, {-12.3, -55}, {-12.3, -22}, {-4, -22}}, color = {0, 0, 127}));
  connect(ufPu2.y, machine2.ufPuIn) annotation(
    Line(points = {{-43.3, -65}, {-10.6, -65}, {-10.6, -28}, {-4, -28}}, color = {0, 0, 127}));
  connect(machine3.ufPuIn, ufPu3.y) annotation(
    Line(points = {{78, -26}, {70, -26}, {70, -65}, {36.7, -65}}, color = {0, 0, 127}));
  connect(refBus3.terminalAC, line3.terminalAC_a) annotation(
    Line(points = {{84, 30}, {84, 20}}, color = {0, 0, 0}));
  connect(line3.terminalAC_b, bus3.terminalAC) annotation(
    Line(points = {{84, 0}, {84, -8}}, color = {0, 0, 0}));
  connect(bus3.terminalAC, machine3.terminalAC) annotation(
    Line(points = {{84, -8}, {84, -18}}, color = {0, 0, 0}));
  connect(loadPQ3.terminalAC, refBus3.terminalAC) annotation(
    Line(points = {{84, 38}, {84, 30}}, color = {0, 0, 0}));
  connect(PmPu3.y, machine3.PmPu) annotation(
    Line(points = {{58, -52}, {66, -52}, {66, -20}, {78, -20}}, color = {0, 0, 127}));
  connect(line1.terminalAC_b, bus1.terminalAC) annotation(
    Line(points = {{-80, 0}, {-80, -10}}));
  connect(slackBus1.terminalAC, bus1.terminalAC) annotation(
    Line(points = {{-80, -26}, {-80, -10}}));
  connect(VrefBus1.terminalAC, LoadPQ1.terminalAC) annotation(
    Line(points = {{-80, 28}, {-80, 38}}));
  connect(line1.terminalAC_a, VrefBus1.terminalAC) annotation(
    Line(points = {{-80, 20}, {-80, 28}}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    Documentation(info = "<html><head></head>

<body>
<p>This example is to verify the matching between the EPF solution and the initialization of the correspondent dynamic model on a simple network that includes a <a href=\"modelica://PowerGrids.Electrical.Machines.SynchronousMachine4Windings\">generator</a>, a <a href=\"modelica://PowerGrids.Electrical.Loads.LoadImpedancePQ\">fixed-impedance load</a> (<i>green</i> box) or a <a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependence\">fixed-power load</a> (<i>red</i> box), a <a href=\"modelica://PowerGrids.Electrical.Branches.LineConstantImpedance\">line</a> and a <a href=\"modelica://PowerGrids.Electrical.Buses.ReferenceBus\">reference bus</a>.</p>

<p> The test includes also the model of the power-flow generated by the EPF (<i>blue</i> box) so that the match can be checked directly from the simulation results reported on the diagram window.</p>

<p>The adopted EPF strategy is to move the <i>EPF slack</i> node to the same node of the generator (by redeclaring its EPF component as a <a href=\"modelica://PowerGrids.Electrical.PowerFlow.SlackBus\">SlackBus</a>) and to set the generator flag <code>useEPFtoSetExternalOffset = true</code> so that the the generator is initialized by the <code>P</code> and the <code>Q</code> calculated by the <i>EPF slack</i>.</p>

<p>In order to maintain the same <i>reference node</i> in both the EPF and the <i>dynamic</i> model, the <i>EPF slack</i> node doesn't prescribe the <i>reference angle</i> (flag <code>setPhase = false</code> in the redeclaration of the EPF component in the <i>generator</i>), the <i>reference angle</i> is still prescribed by the EPF component of the <i>reference node</i> (<a href=\"modelica://PowerGrids.Electrical.PowerFlow.PhaseReferenceBusPF\">PhaseReferenceBusPF</a>, redeclared as EPF component in the <i>reference node</i>).</p>

<p>The <i>generator</i> has no <i>control</i> so two <a href=\"modelica://PowerGrids.Controls.FreeOffset\"><i>free offset</i></a> components have been used in order to calculate the values of the <code>PmPu</code> and the <code>ufPuIn</code> inputs that maintain the solution calculated by the EPF. The values of the <code>PmPu</code> and the <code>ufPuIn</code> inputs are back-calculated by the <i>dynamic</i> initialization, starting from the solution calculated by the EPF</p>

<p>The following figure shows the simulation results:</p><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Test/SynchronousMachine4WindingsPF2.png\">
</figure>

It is possible to see that the working point calculated by the dynamic initialization is exactly the same calculated by the EPF, independently from the type of the load (<i>constant impedance</i> or <i>constant power</i>). This becuse the EPF strategy has maintained the same <i>reference node</i> of the dynamic initialization.

<p>An alternative way should be to move also the <i>reference node</i> together with the <i>slack</i> in the EPF, in this case the <i>reference node</i> in the <i>dynamic</i> model should be redeclared as a normal <i>PF bus</i> in the EPF (the <i>reference node</i> has been moved in the EPF...). This strategy has two main caveats, so it is not advisable:</p>
<ol>
    <li>The <i>reference voltage</i> and the <i>reference angle</i> in the <i>dynamic</i> model becomes the ones calulated by the EPF in the redeclared <i>PF bus</i> and they will be generally different from the <i>reference values</i> originally set by the user in the dynamic component,</li><br>
    <li>the result of the dynamic initialisation will be probably different from the one calculated by the EPF because the <i>reference nodes</i> are placed in different positions in the EPF and in the <i>dynamic</i> models.</li>
</ol></body>
</html>"),
    Diagram(graphics = {Rectangle(origin = {2, 11}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-26, 53}, {26, -53}}), Rectangle(origin = {84, 11}, lineColor = {238, 46, 47}, lineThickness = 2, extent = {{-26, 53}, {26, -53}}), Rectangle(origin = {-78, 11}, lineColor = {0, 85, 255}, lineThickness = 2, extent = {{-26, 53}, {26, -53}})}, coordinateSystem(extent = {{-120, -80}, {120, 80}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end SynchronousMachine4WindingsPF2;