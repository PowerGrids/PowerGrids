within PowerGrids.Electrical.Controls;

package BaseClasses "Base classes for controllers"
  extends Modelica.Icons.BasesPackage;
  
  annotation(
    Documentation(info = "<html>
This base class provides the common framework to deal with the initialization of controllers with the possibility of fixing the controlled output (e.g. machine voltage, produced active power) based on the power flow start values.
</html>"));
end BaseClasses;
