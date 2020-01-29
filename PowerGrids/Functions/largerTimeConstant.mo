within PowerGrids.Functions;

function largerTimeConstant
  extends Modelica.Icons.Function;
  input Real a;
  input Real b;
  output Real T;
algorithm
  T := (a + sqrt(abs(a^2-4*b)))/2;
  annotation(
    Inline = true,
    Documentation(info = "<html><head></head><body>Given a polynomial (1 + sT1)(1 + sT2) = 1 + as + bs^2, with T1 &gt; T2, <code>largerTimeConstant(a, b)</code> returns T2.
</body></html>"));
end largerTimeConstant;
