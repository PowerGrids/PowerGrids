within PowerGrids.Electrical.Loads;

model LoadPQVoltageDependenceWithBreaker
  extends LoadPQVoltageDependence(
    final PRef = PRefCur,
    final QRef = QRefCur,
    final breakerStatusStartPF = breakerStatusStart);

  extends BaseClasses.LoadBreakerPQ(
    SNomBrk = SNom,
    PStartBrk = PStart,
    QStartBrk = QStart,
    PRefConstBrk = PRefConst,
    QRefConstBrk = QRefConst);

annotation(
    Documentation(info = "<html>
<body>
<p>This model extends the <a href=\"modelica://PowerGrids.Electrical.Loads.LoadPQVoltageDependence\">LoadPQVoltageDependence</a> by adding a breaker. The breaker can be activated by setting the flag <code>useBreaker</code></p>
<p>When the breaker is closed (boolean input = <code>true</code>) then the model works as a <i>Load PQ with voltage dependence</i>, when the breaker is open (boolean input = <code>false</code>) then both <code>P</code> and <code>Q</code> are forced to zero.</p>
<p>If the EPF is used, the power consumption in the EPF is according to the initial status of the breaker. If <code>breakerStatusStart=true</code> then the load consumption in the EPF is <code>(PStart, QStart)</code>, otherwise the load consumption in the EPF is forced to zero.</p>
</body>
</html>"));

end LoadPQVoltageDependenceWithBreaker;