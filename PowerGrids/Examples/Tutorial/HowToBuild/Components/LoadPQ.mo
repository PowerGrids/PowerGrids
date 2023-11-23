within PowerGrids.Examples.Tutorial.HowToBuild.Components;

model LoadPQ "Load model with prescribed P and Q values"
  extends Icons.Load;
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    redeclare PowerGrids.Electrical.PowerFlow.PQBus componentPF(
      SNom = SNom, UNom = UNom, P = PPF, Q = QPF),
    final hasSubPF);
  parameter Types.ActivePower PPF = SNom "Initial active power to compute the embedded PF (positive entering)" annotation(Dialog(tab = "Initialization", enable = computePF));
  parameter Types.ActivePower QPF = 0 "Initial reactive power to compute the embedded PF (positive entering)" annotation(Dialog(tab = "Initialization", enable = computePF));

  Modelica.Blocks.Interfaces.RealInput P(unit = "W", displayUnit = "MW") "Active power, W"
    annotation(
    Placement(visible = true, transformation(origin = {-100, 36}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Q(unit = "W", displayUnit = "Mvar") "Reactive power, var"
    annotation(
    Placement(visible = true, transformation(origin = {-100, -44}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
    port.P = P;
    port.Q = Q;
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body><p>Model of a PQ load with voltage dependence.</p>
<p><code>port.P = PRef*(port.U/URef)^alpha;</code> <br> <code>port.Q = QRef*(port.U/URef)^beta</code>.</p>
<p>By default <br><br><code>PRef = PRefConst</code><br><code>QRef = QRefConst</code>,<br><br> so by just setting the <code>PRefConst</code> and <code>QRefConst</code>&nbsp;parameters one can obtain a PQ source with fixed reference P and Q values.</p>
<p>It is possible to change the binding of <code>PRef</code> and  <code>QRef</code> when instantiating the model, to obtain time-varying PQ loads without the need of signal generator blocks, e.g.<br><br>
<code>LoadPQVoltageDependence myLoad(PRef = 1e8 + (if time &lt; 10 then 0 else 1e7)); </code>
</p>
in which case, the constant reference value PRefConst is ignored. Alternatively, one can use the <a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependenceInputs\">LoadPQVoltageDependenceInputs</a> model that has input connectors for <code>PRef</code> and <code>QRef</code>.<p></p>
<p>By default <code>alpha = beta = 0</code> so there is no voltage dependence.</p>
</body></html>"));
end LoadPQ;
