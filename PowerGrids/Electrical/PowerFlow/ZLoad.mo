within PowerGrids.Electrical.PowerFlow;

model ZLoad "Load with constant impedance"
  extends BaseClasses.OnePortAC;
  extends Icons.Load;
  parameter Types.ActivePower PNom = SNom "Nominal active power";
  parameter Types.ActivePower QNom = 0 "Nominal reactive power";
    
  parameter Types.ComplexImpedance Z = UNom^2/Complex(PNom, -QNom) "Constant impedance of the load";
equation
  port.v = Z*port.i;
annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {72, -60}, extent = {{-20, 20}, {20, -20}}, textString = "PQ")}),
    Documentation(info = "<html>
<p>Load with constant impedance <code>Z</code>. The impedance is computed by default from the nominal values <code>PNom, QNom, UNom,</code> but can also be provided directly, by overriding the default binding for <code>Z</code>.</p>
</body></html>"));
end ZLoad;
