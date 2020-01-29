within PowerGrids.Functions;

function smallerTimeConstant
  extends Modelica.Icons.Function;
  input Real a;
  input Real b;
  output Real T;
algorithm
  T := 2*b/(a + sqrt(abs(a^2-4*b)));
  annotation(
    Inline = true,
    Documentation(info = "<html>
Given a polynomial (1 + sT1)(1 + sT2) = 1 + as + bs^2, with T1 > T2, <code>largerTimeConstant(a, b)</code> returns T1.
</html>"));
end smallerTimeConstant;
