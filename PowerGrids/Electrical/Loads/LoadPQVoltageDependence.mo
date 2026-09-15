within PowerGrids.Electrical.Loads;

model LoadPQVoltageDependence "Load model with voltage dependent P and Q"
  extends Icons.Load(PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(PStart = if computePF then PStartPF else PRefConst, QStart = if computePF then QStartPF else QRefConst, final hasSubPF, final localInit, final isLinear = false, redeclare PowerGrids.Electrical.PowerFlow.PQBus componentPF(SNom = SNom, UNom = UNom, P = PRefConst, Q = QRefConst));
  parameter Boolean lowVoltageAsImpedance = systemPowerGrids.loadLowVoltageAsImpedance "true, if the load shall work as a fixed-impedance at low-voltage condition" annotation(
    Evaluate = true);
  parameter Types.PerUnit VPuThr = 0.5 "Threshold of p.u. voltage for low-voltage fixed-impedance approximation";
  parameter Types.PerUnit alpha = 0 "Exponential of voltage ratio for actual P calculation";
  parameter Types.PerUnit beta = 0 "Exponential of voltage ratio for actual Q calculation";
  parameter Types.ActivePower PRefConst = 0 "Constant active power entering the load at reference voltage, reference P for the embedded PF";
  parameter Types.ReactivePower QRefConst = 0 "Constant reactive power entering the load at reference voltage, reference Q for the embedded PF";
  parameter Types.Voltage URef = UStart "Reference value of phase-to-phase voltage";
  Types.ActivePower PRef(nominal = SNom) = PRefConst "Active power at reference voltage, the default binding can be changed when instantiating";
  Types.ActivePower QRef(nominal = SNom) = QRefConst "Reactive power at reference voltage, the default binding can be changed when instantiating";
  Types.PerUnit U_URef(final start = UStart/UNom) "Ratio between voltage and reference voltage (for monitoring purpose only), it uses UNom instead of URef to calculate the start value because some compilers produce an error 0/0 at the start of the initialization if UREf is used (probably they don't implement the right dependency between URef and UStart when calculate the start values), but this doesn't influence the convergence due to U_URef is not used in the model equations)";
equation
  U_URef = port.U/URef "for monitoring purpose only";
  if port.VPu > VPuThr or not lowVoltageAsImpedance then
    port.P = PRef*(port.U/URef)^alpha;
    port.Q = QRef*(port.U/URef)^beta;
  else
    port.v = port.i/CM.conj(Complex(PRef*(UNom*VPuThr/URef)^alpha, QRef*(UNom*VPuThr/URef)^beta)/(UNom*VPuThr)^2);
  end if;
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body><p>Model of a PQ load with voltage dependence.</p>
<p><code>port.P = PRef*(port.U/URef)^alpha;</code> <br> <code>port.Q = QRef*(port.U/URef)^beta</code>.</p>
<p>By default <br><br>
<code>URef = UStart</code><br>
<code>PRef = PRefConst</code><br>
<code>QRef = QRefConst</code>,<br><br> 
so by just setting the <code>PRefConst</code> and <code>QRefConst</code>&nbsp;parameters one can obtain a PQ source with fixed reference P and Q values.</p>
<p>The default <code>URef = UStart</code> ensures that the power calculated by the Embedded Power Flow (if used) is the same of the one calculated by the dynamic initialization, starting from the one calulated by the EPF.
</p>
<p>It is possible to change the binding of <code>PRef</code> and  <code>QRef</code> when instantiating the model, to obtain time-varying PQ loads without the need of signal generator blocks, e.g.<br><br>
<code>LoadPQVoltageDependence myLoad(PRef = 1e8 + (if time &lt; 10 then 0 else 1e7)); </code>
</p>
in which case, the constant reference value PRefConst is ignored. Alternatively, one can use the <a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependenceInputs\">LoadPQVoltageDependenceInputs</a> model that has input connectors for <code>PRef</code> and <code>QRef</code>.<p></p>
<p>By default <code>alpha = beta = 0</code> so there is no voltage dependence.</p>
</body></html>"));
end LoadPQVoltageDependence;