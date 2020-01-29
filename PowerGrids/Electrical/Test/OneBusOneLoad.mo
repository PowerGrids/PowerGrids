within PowerGrids.Electrical.Test;

model OneBusOneLoad
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBus infiniteBus(SNom = 1e+07, UNom = 10000, portVariablesPu = true, theta = 0.523599) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence loadPQ(PRefConst = 1e+07, QRefConst = 0, SNom = 1e+07, UNom = 10000, portVariablesPhases = true) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(infiniteBus.terminal, loadPQ.terminal) annotation(
    Line(points = {{0, 10}, {0, -10}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
  Documentation(info = "<html>
<p>An infinite bus with zero impedance, U_abs = 10 kV, theta = 30 deg, is connected to a PQ load with P = 10 MW and Q = 0 MW.</p>

<p>As the nominal power is set to 10 MW and the nominal voltage to 10 kV on both components, all p.u. absolute values are one. Since the load is purely resistive, all phasors are rotated by 30 deg.</p>

<p>For simplicity, the Start values are set assuming theta = 0; the nonlinear solver is able to converge on the correct solution from this initial guess.</p>

<p>This model demonstrates the correct behaviour of the <a href=\"modelica://PowerGrids.Electrical.Buses.InfiniteBus\">InfiniteBus</a> and <a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependence\">LoadPQVoltageDependence</a> in a simple case. It also demonstrates that the per-unit system implemented in the <a href=\"modelica://PowerGrids.Electrical.BaseClasses.PortAC\">PortAC</a> component is correct and consistent.</p>
</html>"));
end OneBusOneLoad;
