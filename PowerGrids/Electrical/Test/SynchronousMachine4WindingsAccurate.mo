within PowerGrids.Electrical.Test;

model SynchronousMachine4WindingsAccurate
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus bus(SNom = 5.5e+08, UNom = 24000, UStart = 24000, X = 0, portVariablesPhases = true, portVariablesPu = true, theta = 0) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine(H = 6, PStart = -5.52e+08, QStart = -2.52e+08, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, UStart = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, portVariablesPhases = true, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.accurateEstimation, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids(fNom = 60) annotation(
    Placement(visible = true, transformation(origin = {68, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step PmPu(height = 0.0, offset = 0.9, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step ufPu(height = 0, offset = 0.000939) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(bus.terminal, machine.terminal) annotation(
    Line(points = {{0, 20}, {0, 0}}));
  connect(ufPu.y, machine.ufPuIn) annotation(
    Line(points = {{-38, -30}, {-24, -30}, {-24, -14}, {-10, -14}, {-10, -14}}, color = {0, 0, 127}));
  connect(PmPu.y, machine.PmPu) annotation(
    Line(points = {{-38, 10}, {-24, 10}, {-24, -6}, {-10, -6}, {-10, -6}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(homotopyOnFirstTry = "()"),
  Documentation(info = "<html><head></head><body>
<p>This test case is the same as <a href=\"modelica://PowerGrids.Electrical.Test.SynchronousMachine4Windings\">SynchronousMachine4Windings</a>, except that the accurate time constant estimation is performed.</p><p> </p><p>The use of homotopy may be necessary to achieve convergence of the intital equations, as the solution is first computed for the classical approximation, for which convergence is easily achieved, and then brought to the accurate (but less numerically robust) one by a continuous homotopy path.</p>
<p>The external parameters are the same as in <a href=\"modelica://PowerGrids.Electrical.Test.SynchronousMachine4Windings\"> SynchronousMachine4Windings</a>. The computed internal parameters are shown in the following table</p>
<table>
<tbody><tr> <th>PowerGrids</th><th>Meaning</th><th>Approx. Value</th><th>Accurate Value</th><th>Unit</th></tr>
<tr><td>LdPu</td><td>Direct axis stator leakage</td><td>0.15</td><td>0.15</td><td>pu</td></tr>
<tr> <td>MdPu</td><td>Direct axis mutual inductance</td><td>1.66</td><td>1.66</td><td>pu</td></tr>
<tr> <td>LDPu</td><td>Direct axis damper leakage</td><td>0.1714</td><td>0.1716</td><td>pu</td></tr>
<tr> <td>rDPu</td><td>Direct axis damper resistance</td><td>0.0284</td><td>0.0278</td><td>pu</td></tr>
<tr> <td>LfPu</td><td>Excitation winding leakage</td><td>0.1649</td><td>0.1648</td><td>0.1699</td><td>pu</td></tr>
<tr><td>rfPu</td><td>Excitation windings resistance</td><td>0.000605</td><td>0.000619</td><td>0.000618</td><td>pu</td></tr>
<tr><td>LqPu</td><td>Quadrature axis stator leakage </td><td>0.15</td><td>0.15</td><td>0.15</td><td>pu</td></tr>
<tr> <td>MqPu</td><td>Quadrature axis mutual inductance</td><td>1.61</td><td>1.61</td><td>1.61</td><td>pu</td></tr>
<tr><td>LQ1Pu</td><td>Quadrature axis 1st damper leakage</td><td>0.7252</td><td>0.9682</td><td>0.9282</td><td>pu</td></tr>
<tr><td>rQ1Pu</td><td>Quadrature axis 1st damper resistance</td><td>0.00619</td><td>0.00868</td><td>0.00770</td><td>pu</td></tr>
<tr><td>LQ2Pu</td><td>Quadrature axis 2nd damper leakage</td><td>0.1250</td><td>0.1198</td><td>0.1205</td><td>pu</td></tr>
<tr><td>rQ2Pu</td><td>Quadrature axis 2nd damper resistance</td><td>0.02368</td><td>0.02163</td><td>0.0235</td><td>pu</td></tr>
</tbody>
</table>

</body></html>"));
end SynchronousMachine4WindingsAccurate;
