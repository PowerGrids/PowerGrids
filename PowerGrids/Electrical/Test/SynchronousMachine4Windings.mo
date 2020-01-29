within PowerGrids.Electrical.Test;

model SynchronousMachine4Windings
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus bus(SNom = 5.5e+08, UNom = 24000, UStart = 24000, X = 0, portVariablesPhases = true, portVariablesPu = true, theta = 0) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings machine(H = 6, PStart = -5.52e+08, QStart = -2.52e+08, SNom = 5.5e+08, Tpd0 = 8, Tppd0 = 0.03, Tppq0 = 0.07, Tpq0 = 1, UNom = 24000, UStart = 24000, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, portVariablesPhases = true, raPu = 0.003, timeConstApprox = PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition, xdPu = 1.81, xlPu = 0.15, xpdPu = 0.3, xppdPu = 0.23, xppqPu = 0.25, xpqPu = 0.65, xqPu = 1.76) annotation(
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
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p>Test case for the conversion of external parameter to internal parameters taken from Kundur, Power System Stability and Control, example 4.1. Note that the system frequency for this example is 60 Hz.</p>
<p>The machine is directly connected to an ideal bus with UNom = 24 kV and phase = 0 and initialized in steady-state with PmPu = 0.9, ufPu = 0.000939, using the Kundur base excitation voltage.</p>
<table>
<tbody><tr> <th>Parameter</th><th>Meaning</th><th>Value</th><th>Unit</th></tr>
<tr> <td>SNom</td><td>Rated power</td><td>550</td><td>MVA</td></tr>
<tr> <td>UNom</td><td>Rated phase-to-phase voltage</td><td>24</td><td>kV</td></tr>
<tr> <td>xlPu</td><td>Stator Leakage</td><td>0.15</td><td>pu</td></tr>
<tr> <td>xdPu</td><td>Direct axis reactance</td><td>1.81</td><td>pu</td></tr>
<tr> <td>xpdPu</td><td>Direct axis transient reactance</td><td>0.3</td><td>pu</td></tr>
<tr> <td>xppdPu</td><td>Direct axis sub-transient reactance</td><td>0.23</td><td>pu</td></tr>
<tr> <td>Tpd0</td><td>Direct axis open circuit transient time constant</td><td>8</td><td>s</td></tr>
<tr> <td>Tppd0</td><td>Direct axis open circuit sub-transient time constant</td><td>0.03</td><td>s</td></tr>
<tr> <td>xqPu</td><td>Quadrature axis reactance</td><td>1.76</td><td>pu</td></tr>
<tr> <td>xpqPu</td><td>Quadrature axis transient reactance</td><td>0.65</td><td>pu</td></tr>
<tr> <td>xppqPu</td><td>Quadrature axis sub-transient reactance</td><td>0.25</td><td>pu</td></tr>
<tr> <td>Tpq0</td><td>Quadrature axis open circuit transient time constant</td><td>1</td><td>s</td></tr>
<tr> <td>Tppq0</td><td>Quadrature axis open circuit sub-transient time constant</td><td>0.07</td><td>s</td></tr>
<tr> <td>raPu</td><td>Armature resistance</td><td>0.003</td><td>pu</td></tr>
<tr> <td>mrcPu</td><td>Canay's mutual inductance</td><td>0</td><td>pu</td></tr>
</tbody></table>
<p>The following internal parameter values are reported from Kundur and match the ones computed by the model with timeConstantApproximation=classicalDefinitions.</p>
<table>
<tbody><tr> <th>PowerGrids</th><th>Kundur</th><th>Meaning</th><th>Value</th><th>Unit</th></tr>
<tr><td>LdPu</td><td>Ll</td><td>Direct axis stator leakage</td><td>0.15</td><td>pu</td></tr>
<tr> <td>MdPu</td><td>Lad</td><td>Direct axis mutual inductance</td><td>1.66</td><td>pu</td></tr>
<tr> <td>LDPu</td><td>L1d</td><td>Direct axis damper leakage</td><td>0.1713</td><td>pu</td></tr>
<tr> <td>rDPu</td><td>R1d</td><td>Direct axis damper resistance</td><td>0.0284</td><td>pu</td></tr>
<tr> <td>LfPu</td><td>Lfd</td><td>Excitation winding leakage</td><td>0.165</td><td>pu</td></tr>
<tr> <td>rfPu</td><td>Rfd</td><td>Excitation windings resistance</td><td>0.000605</td><td>pu</td></tr>
<tr> <td>LqPu</td><td>Ll</td><td>Quadrature axis stator leakage </td><td>0.15</td><td>pu</td></tr>
<tr> <td>MqPu</td><td>Laq</td><td>Quadrature axis mutual inductance</td><td>1.61</td><td>pu</td></tr>
<tr> <td>LQ1Pu</td><td>L1q</td><td>Quadrature axis 1st damper leakage</td><td>0.7252</td><td>pu</td></tr>
<tr> <td>rQ1Pu</td><td>R1q</td><td>Quadrature axis 1st damper resistance</td><td>0.0062</td><td>pu</td></tr>
<tr> <td>LQ2Pu</td><td>L2q</td><td>Quadrature axis 2nd damper leakage</td><td>0.125</td><td>pu</td></tr>
<tr> <td>rQ2Pu</td><td>R2q</td><td>Quadrature axis 2nd damper resistance</td><td>0.02368</td><td>pu</td></tr>
</tbody></table>
<p>The following table reports the steady-state solution computed by Kundur in Example 3.2 and by the PowerGrids model. Note that the Kundur example unfortunately includes a the effect of an 83.5% magnetic saturation, which is not accounted for in the PowerGrids model, so the two sets of values do not match exactly, particularly as regards the reactive power and the quadrature current. However, the difference is compatible with the effect of the reduced inductances. Also note that the sign convention for id, iq is opposite to Kundur's.</p>
<table>
<tbody><tr> <th>Variable</th><th>Name</th><th>Value Kundur</th><th>Value PowerGrids</th><th>Unit</th></tr>
<tr> <td>PGenPu</td><td>Generated active power</td><td>0.9</td><td>0.89667</td><td>pu</td></tr>
<tr> <td>QGenPu</td><td>Generated reactive power</td><td>0.436</td><td>0.55206</td><td>pu</td></tr>
<tr> <td>theta</td><td>Machine angle</td><td>39.1</td><td>38.61</td><td>deg</td></tr>
<tr> <td>udPu</td><td>Direct axis voltage</td><td>0.631</td><td>0.6240</td><td>pu</td></tr>
<tr> <td>uqPu</td><td>Quadrature axis voltage</td><td>0.776</td><td>0.7814</td><td>pu</td></tr>
<tr> <td>idPu</td><td>Direct axis current</td><td>0.906</td><td>-0.9909</td><td>pu</td></tr>
<tr> <td>iqPu</td><td>Quadrature axis current</td><td>0.423</td><td>-0.3562</td><td>pu</td></tr>
</tbody></table>
<p></p>
</body></html>"));
end SynchronousMachine4Windings;
