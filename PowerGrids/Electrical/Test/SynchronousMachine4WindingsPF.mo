within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsPF
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine1(H = 6, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, PPF = 500000000) annotation(
    Placement(transformation(origin = {-38, -38}, extent = {{-10, -10}, {10, 10}})));
  inner PowerGrids.Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation(
    Placement(visible = true, transformation(origin = {68, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu1(y = 0.9) annotation(
    Placement(transformation(origin = {-66, -72}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPu1(y = 0.000939) annotation(
    Placement(transformation(origin = {-66, -86}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQ LoadPQ1(UNom = 24000, SNom = 550000000, PRefConst = 500000000, QRefConst = 300000000, URef = 24000) annotation(
    Placement(transformation(origin = {-38, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.ReferenceBus refBus1(UNom = 24000, SNom = 500000000) annotation(
    Placement(transformation(origin = {-38, 10}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance line1(SNom = 550000000, UNom = 24000, R = 0.01, X = 0.1) annotation(
    Placement(transformation(origin = {-38, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Buses.Bus bus1(UNom = 24000) annotation(
    Placement(transformation(origin = {-38, -28}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine2(H = 6, PPF = 500000000, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, redeclare model ComponentPF = PowerGrids.Electrical.PowerFlow.SlackBus(UNom = 24000, SNom = 5.5e8, U = 25.4e3, UPhase = 4.3*Modelica.Constants.pi/180), useEPFtoSetExternalOffset = true) annotation(
    Placement(transformation(origin = {42, -38}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQ LoadPQ2(PRefConst = 500000000, QRefConst = 300000000, SNom = 550000000, UNom = 24000, URef = 24000) annotation(
    Placement(transformation(origin = {42, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.ReferenceBus refBus2(SNom = 500000000, UNom = 24000, redeclare replaceable model ComponentPF = PowerGrids.Electrical.PowerFlow.BusPF(UNom = 24000)) annotation(
    Placement(transformation(origin = {42, 10}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance line2(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation(
    Placement(transformation(origin = {42, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Buses.Bus bus2(UNom = 24000) annotation(
    Placement(transformation(origin = {42, -28}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Controls.FreeOffset PmPu2 annotation(
    Placement(transformation(origin = {17, -73}, extent = {{-7, -7}, {7, 7}})));
  PowerGrids.Controls.FreeOffset ufPu2 annotation(
    Placement(transformation(origin = {17, -91}, extent = {{-7, -7}, {7, 7}})));
equation
  connect(ufPu1.y, machine1.ufPuIn) annotation(
    Line(points = {{-55, -86}, {-50, -86}, {-50, -46}, {-44, -46}}, color = {0, 0, 127}));
  connect(PmPu1.y, machine1.PmPu) annotation(
    Line(points = {{-55, -72}, {-51.5, -72}, {-51.5, -40}, {-44, -40}}, color = {0, 0, 127}));
  connect(LoadPQ1.terminalAC, refBus1.terminalAC) annotation(
    Line(points = {{-38, 20}, {-38, 10}}));
  connect(bus1.terminalAC, machine1.terminalAC) annotation(
    Line(points = {{-38, -28}, {-38, -38}}));
  connect(bus1.terminalAC, line1.terminalAC_b) annotation(
    Line(points = {{-38, -28}, {-38, -18}}));
  connect(line1.terminalAC_a, refBus1.terminalAC) annotation(
    Line(points = {{-38, 2}, {-38, 10}}));
  connect(LoadPQ2.terminalAC, refBus2.terminalAC) annotation(
    Line(points = {{42, 20}, {42, 10}}));
  connect(bus2.terminalAC, machine2.terminalAC) annotation(
    Line(points = {{42, -28}, {42, -38}}));
  connect(bus2.terminalAC, line2.terminalAC_b) annotation(
    Line(points = {{42, -28}, {42, -18}}));
  connect(line2.terminalAC_a, refBus2.terminalAC) annotation(
    Line(points = {{42, 2}, {42, 10}}));
  connect(PmPu2.y, machine2.PmPu) annotation(
    Line(points = {{24.7, -73}, {27.7, -73}, {27.7, -40}, {35.7, -40}}, color = {0, 0, 127}));
  connect(ufPu2.y, machine2.ufPuIn) annotation(
    Line(points = {{24.7, -91}, {29.7, -91}, {29.7, -46}, {35.7, -46}}, color = {0, 0, 127}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    Documentation(info = "<html><head></head><body>
<p>This example is to test the embedded power flow on a simple network that icludes a generator, a load, a line and a reference node.&nbsp;</p>
<p>Moreover, it shows two different ways to set the position of the slack node: the first (blue box) is the default behavior of the Embedded Power Flow (EPF) that uses the reference bus as slack node (S is shown in the icon) and the generator as a PVBus; the second (green box) redeclares the EPF components in both the reference bus and the generator, in order to use the generator as slack node (S is shown in the icon), in this case the reference bus must be set as generic bus in the EPF (note that it still works as reference bus during the initialization of the dynamic model).
</p><p>Herebelow the simulation results:</p><p></p><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Test/Test.SynchronousMachine4WindingsPF.png\">
</figure>
<p> In the first case (default behaviour - blue box) the slack bus in the EPF (reference node) fixes a voltage of <b>24kV</b> at <b>0°</b> of phase at the reference bus node, and the PVBus in the EPF (generator) injects <b>500MW</b> of active power at <b>24kV</b> of voltage. The dynamic initialisation, starting from the working point calculated by the EPF, converge to a working point in that both the voltage and the phase at the reference node are the same of the EPF, the generator injects a power of <b>493MW</b> and the reference node balaces the network. The difference between the power injected by the generator during the EPF and the same at the end of the dynamic initialization is because both the <b>PmPu</b> and <b>ufPu</b> are fixed to a values that move the system to a working point that is near to that is produced by the EPF, but not exactly the same.</p>
<p>In the second case (green box) the reference bus plays as a normal bus in the EPF and the slack bus in the EPF (generator) fixes a voltage of <b>25.4kV</b> at <b>4.3°</b> of phase at the generator node. The <b>free offset</b> blocks compute both the <b>PmPu</b> and the <b>ufPu</b> during the dynamic initialization (the initialisation type in the system object is set to <code>globalSteadyStateFixedPowerFlow</code> in order to activate the offset blocks), the flag <code>useEPFtoSetExternalOffset</code> in the generator is set to <code>true</code> so that the offset are calculated in order to maintain the same P and Q calculated by the EPF at the generator node. The EPF converges in a working point in that the generator injects <b>505.9MW</b> and <b>359.7MVAR</b>, the <b>PmPu</b> and <b>ufPu</b> calculated by the offset are <b>0.923</b> and <b>0.000979</b> respectively. 
<br> Note that also in this case, in which the generator set points are calculated starting from the EPF, the reference node has to balance the network, this because the dynamic model of the load takes into account the voltage and phase at its node to calculate the power consumption where the EPF model prescribes both the active and reactive power consumption independently from the voltage and the phase at its node. This produces a little unbalancing between the EPF and the dynamic models, that is balanced by the reference node. The magnitude of the unbalancing depends on  the differences between the dynamic and the EPF load models and also on both the voltage and the phase prescribed by the slack node.</p>
<p>The numerical result is quite the same in the two cases, this because the two cases have been set in order to produce as much as possible the same result, i.e. the voltage and phase at the generator node in the second case have been set as much as possible according to the result of the first case. Generally the result will be different in the two cases, because the EPF is structurally different, so that also the initialization of the dynamic model will be different and thus it will converge to a different initial working point, according to the relevant EPF.</p>

</body></html>"),
    Diagram(graphics = {Rectangle(origin = {-40, -7}, lineColor = {85, 170, 255}, lineThickness = 2, extent = {{-26, 53}, {26, -53}}), Rectangle(origin = {42, -7}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-26, 53}, {26, -53}})}));
end SynchronousMachine4WindingsPF;
