within PowerGrids.Functions;

package Test
  extends Modelica.Icons.ExamplesPackage;

  model TestTimeConstants
    extends Modelica.Icons.Example;
    Real T1 = largerTimeConstant(8, 15);
    Real T2 = smallerTimeConstant(8, 15);
    annotation(experiment(StopTime = 1),
      Documentation(info = "<html><head></head><body>Computes the time constants of 1 + 8s + 15 = (1+3s)(1+5s)
</body></html>"));
  end TestTimeConstants;


end Test;
