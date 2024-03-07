within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsPF
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine(H = 6, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur,  raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, PPF = 500000000) annotation(
    Placement(transformation(origin = {-30, -38}, extent = {{-10, -10}, {10, 10}})));
  inner PowerGrids.Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true) annotation(
    Placement(visible = true, transformation(origin = {68, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu(y = 0.9) annotation(
    Placement(transformation(origin = {-70, -66}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPu(y = 0.000939) annotation(
    Placement(transformation(origin = {-70, -80}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQ LoadPQ(UNom = 24000, SNom = 550000000, PRefConst = 500000000, QRefConst = 300000000, URef = 24000)  annotation(
    Placement(transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.ReferenceBus referenceBus(UNom = 24000, SNom = 500000000)  annotation(
    Placement(transformation(origin = {-30, 8}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance line(SNom = 550000000, UNom = 24000, R = 0.01, X = 0.1)  annotation(
    Placement(transformation(origin = {-30, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Buses.Bus bus(UNom = 24000)  annotation(
    Placement(transformation(origin = {-30, -28}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine_SlackPF(H = 6, PPF = 500000000, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, redeclare model ComponentPF = PowerGrids.Electrical.PowerFlow.SlackBus(UNom = 24000, SNom = 5.5e8, U = 25.4e3, UPhase=4.3*3.1415/180)) annotation(
    Placement(transformation(origin = {30, -38}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQ LoadPQ1(PRefConst = 500000000, QRefConst = 300000000, SNom = 550000000, UNom = 24000, URef = 24000) annotation(
    Placement(transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.ReferenceBus referenceBus_BusPF(SNom = 500000000, UNom = 24000, redeclare replaceable model ComponentPF = PowerGrids.Electrical.PowerFlow.BusPF) annotation(
    Placement(transformation(origin = {30, 8}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance line1(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation(
    Placement(transformation(origin = {30, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Buses.Bus bus1(UNom = 24000) annotation(
    Placement(transformation(origin = {30, -28}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ufPu.y, machine.ufPuIn) annotation(
    Line(points = {{-59, -80}, {-50, -80}, {-50, -46}, {-36, -46}}, color = {0, 0, 127}));
  connect(PmPu.y, machine.PmPu) annotation(
    Line(points = {{-59, -66}, {-53.5, -66}, {-53.5, -40}, {-36, -40}}, color = {0, 0, 127}));
  connect(LoadPQ.terminalAC, referenceBus.terminalAC) annotation(
    Line(points = {{-30, 20}, {-30, 8}}));
  connect(bus.terminalAC, machine.terminalAC) annotation(
    Line(points = {{-30, -28}, {-30, -38}}));
  connect(bus.terminalAC, line.terminalAC_b) annotation(
    Line(points = {{-30, -28}, {-30, -18}}));
  connect(line.terminalAC_a, referenceBus.terminalAC) annotation(
    Line(points = {{-30, 2}, {-30, 8}}));
  connect(LoadPQ1.terminalAC, referenceBus_BusPF.terminalAC) annotation(
    Line(points = {{30, 20}, {30, 8}}));
  connect(bus1.terminalAC, machine_SlackPF.terminalAC) annotation(
    Line(points = {{30, -28}, {30, -38}}));
  connect(bus1.terminalAC, line1.terminalAC_b) annotation(
    Line(points = {{30, -28}, {30, -18}}));
  connect(line1.terminalAC_a, referenceBus_BusPF.terminalAC) annotation(
    Line(points = {{30, 2}, {30, 8}}));
  connect(PmPu.y, machine_SlackPF.PmPu) annotation(
    Line(points = {{-58, -66}, {10, -66}, {10, -40}, {24, -40}}, color = {0, 0, 127}));
  connect(ufPu.y, machine_SlackPF.ufPuIn) annotation(
    Line(points = {{-58, -80}, {16, -80}, {16, -46}, {24, -46}}, color = {0, 0, 127}));
  annotation(
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    Documentation(info = "<html><head></head><body>
<p>This example is to test the embedded power flow on a simple network that icludes a generator, a load, a line and a reference node.&nbsp;</p><p>Moreover, it shows two different ways set the slack node: the first (blue box) is the default behavior that uses the reference bus as slack node in the EPF and the generator as a PVBus in the EPF; the second (green box) redeclares the EPF components in both the reference bus and the generator, in order to use the generator as the slack node in the EPF (in this case the reference bus must set to be a generic bus in the EPF).</p><p>Herebelow the simulation results:</p><p></p><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Test/Test.SynchronousMachine4WindingsPF.png\">
</figure><p> In the first case (default behaviour - blue box) the slack bus in the EPF (reference node) fixes a voltage of 24 kV at 0° of phase and the PVBus in the EPF (generator) injects 500MW of active power at 24kV of voltage.</p><p>In the second case (green box) the reference bus plays as a normal bus in the EPF and the slack bus in the EPF (generator) fixes a voltage of 25.4kV at 4.3° of phase at the generator node.</p><p>The numerical result is quite the same but not exactly the same, this because the two cases have been set in order to produce the same result, i.e. the voltage and phase at the generator node in the second case have been set according to the result of the first case.</p><p>Generally the results will be different, because the EPF are structurally different in the two cases, so that also the initialization of the dynamic model will be different (according to the relevant EPF) and thus they will converge to different initial working points.</p>

</body></html>"),
  Diagram(graphics = {Rectangle(origin = {-32, -7}, lineColor = {85, 170, 255}, lineThickness = 2, extent = {{-26, 53}, {26, -53}}), Rectangle(origin = {30, -7}, lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-26, 53}, {26, -53}})}));
end SynchronousMachine4WindingsPF;
