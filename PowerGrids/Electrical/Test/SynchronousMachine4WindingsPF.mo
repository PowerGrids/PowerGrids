within PowerGrids.Electrical.Test;
model SynchronousMachine4WindingsPF
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine1(H = 6, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, PPF = 500000000) annotation (
    Placement(transformation(origin={-78,-20},    extent = {{-10, -10}, {10, 10}})));
  inner PowerGrids.Electrical.System systemPowerGrids(fNom = 60, showDataOnDiagramsPu = false, showDataOnDiagramsSI = true, initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow) annotation (
    Placement(transformation(origin={110,-70},   extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression PmPu1(y = 0.9) annotation (
    Placement(transformation(origin={-106,-54},   extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression ufPu1(y = 0.000939) annotation (
    Placement(transformation(origin={-106,-68},   extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQ LoadPQ1(UNom = 24000, SNom = 550000000, PRefConst = 500000000, QRefConst = 300000000, URef = 24000) annotation (
    Placement(transformation(origin={-78,38},    extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.ReferenceBus refBus1(UNom = 24000, SNom = 500000000) annotation (
    Placement(transformation(origin={-78,28},    extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance line1(SNom = 550000000, UNom = 24000, R = 0.01, X = 0.1) annotation (
    Placement(transformation(origin={-78,10},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Buses.Bus bus1(UNom = 24000) annotation (
    Placement(transformation(origin={-78,-10},    extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine2(H = 6, PPF = 500000000, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76, redeclare
      model ComponentPF =
        PowerGrids.Electrical.PowerFlow.SlackBus (                                                                                                                                                                                                        UNom = 24000, SNom = 5.5e8, U = 25.4e3, UPhase = 4.3*Modelica.Constants.pi/180)) annotation (
    Placement(transformation(origin={2,-20},     extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Loads.LoadImpedancePQ LoadPQ2(PRefConst = 500000000, QRefConst = 300000000, SNom = 550000000, UNom = 24000, URef = 24000) annotation (
    Placement(transformation(origin={2,38},     extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Buses.ReferenceBus refBus2(SNom = 500000000, UNom = 24000, redeclare
      replaceable model ComponentPF =
        PowerGrids.Electrical.PowerFlow.BusPF (                                                                                                                    UNom = 24000), forceSlackPowerToZero = true) annotation (
    Placement(transformation(origin={2,28},     extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance line2(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation (
    Placement(transformation(origin={2,10},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Buses.Bus bus2(UNom = 24000) annotation (
    Placement(transformation(origin={2,-10},     extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Controls.FreeOffset PmPu2 annotation (
    Placement(transformation(origin={-23,-55},   extent = {{-7, -7}, {7, 7}})));
  PowerGrids.Controls.FreeOffset ufPu2 annotation (
    Placement(transformation(origin={-51,-65},    extent = {{-7, -7}, {7, 7}})));
  Buses.ReferenceBus refBus3(redeclare replaceable model ComponentPF =
        PowerGrids.Electrical.PowerFlow.BusPF (                                                              UNom = 24000), SNom = 500000000, UNom = 24000, forceSlackPowerToZero = true) annotation (
    Placement(transformation(origin={84,30},    extent = {{-10, -10}, {10, 10}})));
  Branches.LineConstantImpedance line3(R = 0.01, SNom = 550000000, UNom = 24000, X = 0.1) annotation (
    Placement(transformation(origin={84,10},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Buses.Bus bus3(UNom = 24000) annotation (
    Placement(transformation(origin={84,-8},     extent = {{-10, -10}, {10, 10}})));
  Machines.SynchronousMachine4Windings machine3(redeclare model ComponentPF =
        PowerGrids.Electrical.PowerFlow.SlackBus (                                                                     SNom = 5.5e8, U = 25.4e3, UNom = 24000, UPhase = 4.3*Modelica.Constants.pi/180), H = 6, PPF = 500000000, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76) annotation (
    Placement(transformation(origin={84,-18},    extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Controls.FreeOffset PmPu3 annotation (
    Placement(transformation(origin={51,-53},    extent = {{-7, -7}, {7, 7}})));
  PowerGrids.Controls.FreeOffset ufPu3 annotation (
    Placement(transformation(origin={29,-65},     extent = {{-7, -7}, {7, 7}})));
  Loads.LoadPQVoltageDependence loadPQ3(
    UNom=24000,
    SNom=550000000,
    PRefConst=500000000,
    QRefConst=300000000)
    annotation (Placement(transformation(extent={{74,48},{94,28}})));
equation
  connect(ufPu1.y, machine1.ufPuIn) annotation (
    Line(points={{-95,-68},{-90,-68},{-90,-28},{-84,-28}},          color = {0, 0, 127}));
  connect(PmPu1.y, machine1.PmPu) annotation (
    Line(points={{-95,-54},{-91.5,-54},{-91.5,-22},{-84,-22}},          color = {0, 0, 127}));
  connect(LoadPQ1.terminalAC, refBus1.terminalAC) annotation (
    Line(points={{-78,38},{-78,28}}));
  connect(bus1.terminalAC, machine1.terminalAC) annotation (
    Line(points={{-78,-10},{-78,-20}}));
  connect(bus1.terminalAC, line1.terminalAC_b) annotation (
    Line(points={{-78,-10},{-78,0}}));
  connect(line1.terminalAC_a, refBus1.terminalAC) annotation (
    Line(points={{-78,20},{-78,28}}));
  connect(LoadPQ2.terminalAC, refBus2.terminalAC) annotation (
    Line(points={{2,38},{2,28}}));
  connect(bus2.terminalAC, machine2.terminalAC) annotation (
    Line(points={{2,-10},{2,-20}}));
  connect(bus2.terminalAC, line2.terminalAC_b) annotation (
    Line(points={{2,-10},{2,0}}));
  connect(line2.terminalAC_a, refBus2.terminalAC) annotation (
    Line(points={{2,20},{2,28}}));
  connect(PmPu2.y, machine2.PmPu) annotation (
    Line(points={{-15.3,-55},{-12.3,-55},{-12.3,-22},{-4,-22}},      color = {0, 0, 127}));
  connect(ufPu2.y, machine2.ufPuIn) annotation (
    Line(points={{-43.3,-65},{-10.6,-65},{-10.6,-28},{-4,-28}},      color = {0, 0, 127}));
  connect(machine3.ufPuIn, ufPu3.y) annotation (Line(points={{78,-26},{70,-26},
          {70,-65},{36.7,-65}}, color={0,0,127}));
  connect(refBus3.terminalAC, line3.terminalAC_a)
    annotation (Line(points={{84,30},{84,20}}, color={0,0,0}));
  connect(line3.terminalAC_b, bus3.terminalAC)
    annotation (Line(points={{84,0},{84,-8}}, color={0,0,0}));
  connect(bus3.terminalAC, machine3.terminalAC)
    annotation (Line(points={{84,-8},{84,-18}}, color={0,0,0}));
  connect(loadPQ3.terminalAC, refBus3.terminalAC)
    annotation (Line(points={{84,38},{84,30}}, color={0,0,0}));
  connect(PmPu3.y, machine3.PmPu) annotation(
    Line(points = {{58, -52}, {66, -52}, {66, -20}, {78, -20}}, color = {0, 0, 127}));
  annotation (
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    Documentation(info = "<html><head></head><body>
<p>This example tests the embedded power flow on a simple network that includes a generator, a load, a line and a reference node.&nbsp;</p>
<p>It shows two different ways to set the position of the slack node: the first (blue box) is the default behavior of the Embedded Power Flow (EPF) that uses the reference bus as slack node (S is shown in the icon) and the generator as a PVBus; the second (green box) redeclares the EPF components in &nbsp;the reference bus and the generator in order to move the slack bus to the generator node (S is shown in the generator icon), in this case the reference bus is redeclared as a generic bus in the EPF (note that it still works as a <a href=\"modelica://PowerGrids.Electrical.Buses.ReferenceBus\">reference bus</a> during both the dynamic initialization and the simulation phases).
</p><p>Herebelow the simulation result in the two cases (do not consider the model in the red box for the moment):</p><p></p><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Test/SynchronousMachine4WindingsPF.png\">
</figure>
<p> In the first case (default behaviour - blue box) the slack bus in the EPF (reference node) sets a voltage of <b>24kV</b> at <b>0°</b> of phase at the reference node, and the PVBus in the EPF (generator) injects <b>500MW</b> of active power at <b>24kV</b> of voltage. The dynamic initialisation, starting from the working point calculated by the EPF, converges to a working point in which voltage and phase at the reference node are the same of the EPF, the generator injects&nbsp;<b>493MW</b> and <b>324.8Mvar</b>, and the reference node balances the network. The difference between the voltage (<b>24kV</b>) and the active power (<b>500MW</b>) prescribed by the generator during the EPF and those at the end of the dynamic initialization is due to the fact that the <b>PmPu</b> and <b>ufPu</b> are fixed to values that are slightly different from those calculated by the EPF, so the &nbsp;initialisation of the dynamic model moves the system to a working point that is near to the one calculated by the EPF, but not exactly the same.</p>
<p>In the second case (green box) the reference bus plays as a normal bus in the EPF and the slack bus in the EPF is moved to the generator node, where fixes a voltage of <b>25.4kV</b> at <b>4.3°</b> of phase. The <b>free offset</b> blocks compute <b>PmPu</b> and <b>ufPu</b> during the dynamic initialization (the initialisation type in the system object is set to <code>globalSteadyStateFixedPowerFlow</code> in order to activate the offset blocks), the flag <code>forceSlackPowerToZero</code> in the reference node is set to <code>true</code> so that the offsets are calculated in order to keep null the active and reactive power that the reference node can supply (keep in mind that it still works as a <a href=\"modelica://PowerGrids.Electrical.Buses.ReferenceBus\">reference bus</a> during both the initialisation and the simulation phases). The EPF converges to a working point in which the generator injects <b>499.8MW</b> and <b>354.7Mvar</b>,&nbsp;<b>PmPu</b> and <b>ufPu</b> calculated by the offset are <b>0.91217</b> and <b>0.000971</b> respectively.</p> 
<p> Both active reactive powers injected by the reference node are null (as required) but load absoption is slightly different from the one set for the EPF (<b>500MW</b> and <b>300Mvar</b>); this occurs because the load is modelled as a constant impedance, so its working point depends on the voltage at its terminal, while the EPF load model sets active and reactive powers regardless of it. This difference slightly changes the working point during the initialisation of the dynamic model.</p>
<p>The numerical results are very near in the two cases, because both voltage and phase at the generator (slack) node in the second case has been set to be equal to the result of the first one (and actually is very near to it). Generally, the differences could be larger, because the initialization of the dynamic model is&nbsp;structurally&nbsp;different from the EPF's.</p><p>The example shows also a third model (red box) which is a variation of the second one: In this case, the slack node is still in the generator, but the load is constant power (as in the PF). Therefore the power absorbed by the load stays wautll to the one in the first example (gree box).</p>
</body></html>"),
    Diagram(graphics={  Rectangle(origin={-80,11},    lineColor = {85, 170, 255}, lineThickness = 2, extent = {{-26, 53}, {26, -53}}), Rectangle(origin={2,11},     lineColor = {85, 170, 0}, lineThickness = 2, extent = {{-26, 53}, {26, -53}}),
                                                                                                                                       Rectangle(
          origin={84,13},
          lineColor={238,46,47},
          lineThickness=2,
          extent={{-26,53},{26,-53}})},                                                                                                                                                                                                        coordinateSystem(extent={{-120,
            -80},{120,80}})),
    Icon(coordinateSystem(extent={{-120,-80},{120,80}})));
end SynchronousMachine4WindingsPF;
