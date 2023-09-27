within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsPowerSwing
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus bus(SNom = 5.5e+08, UNom = 24000, UStart = 24000, X = 0, portVariablesPhases = true, theta = 0) annotation(
    Placement(visible = true, transformation(origin = {58, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine(H = 6, PStart = -4.95e+08, QStart = -2.5e+08, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.nominalStatorVoltageNoLoad, portVariablesPhases = true, raPu = 0, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.exactComputation, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76) annotation(
    Placement(transformation(origin = {0, 18}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  inner PowerGrids.Electrical.System systemPowerGrids(final computePF = false) annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step PmPu(height = 0.0, offset = 0.9, startTime = 0) annotation(
    Placement(transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Step ufPu(height = 0, offset = machine.ufPuInStart) annotation(
    Placement(transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}})));
  PowerGrids.Electrical.Branches.LineConstantImpedance line(PStartA = 0, PStartB = 0, R = 0, SNom = 1e+08, UNom = 24000, X = 1, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {30, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependenceInputs load(PStart = 4.95e+08, QStart = 2.5e+08, SRef = 5.5e+08, portVariablesPhases = true, URef = 24000, PRefConst = 495000000000000, QRefConst = 250000000000000) annotation(
    Placement(visible = true, transformation(origin = {0, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step P(height = -10e6, offset = 495e6, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step Q(height = 0, offset = 250e6) annotation(
    Placement(visible = true, transformation(origin = {-50, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Buses.Bus machineBus(UPhaseStart = 0.680678, UNom = 24000) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ufPu.y, machine.ufPuIn) annotation(
    Line(points = {{-39, 70}, {-21.5, 70}, {-21.5, 26}, {-6, 26}}, color = {0, 0, 127}));
  connect(line.terminalAC_b, bus.terminalAC) annotation(
    Line(points = {{40, -8}, {58, -8}}));
  connect(PmPu.y, machine.PmPu) annotation(
    Line(points = {{-39, 20}, {-6, 20}}, color = {0, 0, 127}));
  connect(P.y, load.PRefIn) annotation(
    Line(points = {{-38, -26}, {-10, -26}}, color = {0, 0, 127}));
  connect(Q.y, load.QRefIn) annotation(
    Line(points = {{-38, -58}, {-24, -58}, {-24, -32}, {-10, -32}}, color = {0, 0, 127}));
  connect(machine.terminalAC, machineBus.terminalAC) annotation(
    Line(points = {{0, 18}, {0, 0}}));
  connect(machineBus.terminalAC, line.terminalAC_a) annotation(
    Line(points = {{0, 0}, {0, -8}, {20, -8}}));
  connect(load.terminalAC, machineBus.terminalAC) annotation(
    Line(points = {{0, -22}, {0, 0}}));
  annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--daeMode -d=initialization,evaluateAllParameters",
    Documentation(info = "<html><head></head><body><p>Test case for the dynamic operation of the <a href=\"modelica://PowerGrids.Electrical.SynchronousMachine4Windings\">SynchronousMachine4Windings</a> model. The machine, whose parameters are the same as in <a href=\"modelica://PowerGrids.Electrical.Test.SynchronousMachine4Windings\">Test.SynchronousMachine4Windings</a>, except for a system frequency of 50 Hz and for a zero stator resistance, is connected to a local PQ load absorbing 495 MW of active power and 250 MVA of reactive power, which correspond to the machine power input and excitation voltage. A purely inductive line of 1 Ohm impedance, which corresponds to 0.96 p.u., connects the machine to an infinite bus, and is initially unloaded, so that all the initial voltage angles at all ports are close to zero, while the machine angle is 41.35 deg.</p>
<p>At time = 1, the active power absorption of the load is reduced by 10 MW. As a consequence, the excess active power is rerouted to the transmission line, causing an increase of the load angle. The classical oscillatory swinging motion of the machine angle <code>machine.theta</code> ensues, with a pseudo-period of about 1.40 s, which is close to the theoretical value 2*pi*sqrt(2*H*XPu/omegaBase) = 1.21 of the simplified swing equation assuming ideal voltage control. The machine oscillations dampen out in about 40 s due to power dissipation in the damper windings, with the machine angle settling down to a new value of 42.37 deg. </p>
<p>Due to the absence of voltage regulation, <code>machine.port.VPU</code> decreases and settles down in about 150 s to a new, slightly lower value.</p>
</body></html>"));
end SynchronousMachine4WindingsPowerSwing;
