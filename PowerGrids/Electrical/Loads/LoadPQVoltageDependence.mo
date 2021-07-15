within PowerGrids.Electrical.Loads;

model LoadPQVoltageDependence "Load model with voltage dependent P and Q"
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final portVariablesPu=true,
    PStart = PRefConst,
    QStart = QRefConst);
  extends Icons.Load;

  parameter Types.PerUnit alpha = 0 "Exponential of voltage ratio for actual P calculation";
  parameter Types.PerUnit beta = 0 "Exponential of voltage ratio for actual Q calculation";
  
  parameter Types.ActivePower PRefConst = 0 "Constant active power entering the load at reference voltage";
  parameter Types.ReactivePower QRefConst = 0 "Constant reactive power entering the load at reference voltage";
  parameter Types.Voltage URef = UNom "Reference value of phase-to-phase voltage";

  Types.ActivePower PRef(nominal = SNom) =  PRefConst "Active power at reference voltage, the default binding can be changed when instantiating";
  Types.ActivePower QRef(nominal = SNom) =  QRefConst "Reactive power at reference voltage, the default binding can be changed when instantiating";
    Types.PerUnit U_URef(start = UStart/UNom) "Ratio between voltage and reference voltage";
equation
  U_URef = port.U / URef;
  port.P = PRef*U_URef^alpha;
  port.Q = QRef*U_URef^ beta;
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
end LoadPQVoltageDependence;
