within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsNoLoadExact
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus bus(PStart = 0, SNom = 5.5e+08, UNom = 24000, UStart = 24000, X = 0, portVariablesPhases = true, portVariablesPu = true, theta = 0) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine(H = 6, PStart = 0, QStart = 0, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, UStart = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.nominalStatorVoltageNoLoad, portVariablesPhases = true, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.exactComputation, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids(fNom = 50) annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step PmPu(height = 0.0, offset = 0.0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step ufPu(height = 0, offset = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(bus.terminal, machine.terminal) annotation(
    Line(points = {{0, 20}, {0, 0}}));
  connect(ufPu.y, machine.ufPuIn) annotation(
    Line(points = {{-38, -30}, {-24, -30}, {-24, -14}, {-10, -14}, {-10, -14}}, color = {0, 0, 127}));
  connect(PmPu.y, machine.PmPu) annotation(
    Line(points = {{-38, 10}, {-24, 10}, {-24, -6}, {-10, -6}, {-10, -6}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(homotopyOnFirstTry = "()"),
    Documentation(info = "<html><head></head><body><p>This test case validates the NoLoad choice of base excitation voltage of the SynchronousMachine4Windings model.</p>
<p>By setting ufPuIn = 1 and PmPu = 0, one obtains machine.port.VPu = 1 and machine.port.IPu = 0, as &nbsp;required by the base voltage definition.</p><p>The extermal machine parameters are the same as in the  <a href=\"modelica://PowerGrids.Electrical.Test.SynchronousMachine4Windings\">SynchronousMachine4Windings</a> test, but with the system frequency set at 50 Hz. The internal parameters are computed exactly.</p>
</body></html>"));
end SynchronousMachine4WindingsNoLoadExact;
