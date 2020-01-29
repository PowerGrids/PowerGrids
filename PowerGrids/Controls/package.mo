within PowerGrids;
package Controls "Control blocks"
  extends Modelica.Icons.Package;
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html>
<p>This package contains basic building blocks to implement governors, AVRs and PSSs.</p>
<p>The blocks are implemented according to IEEE Standard 421.5-2016, Annex E, with some implementation details taken from <a href=\"modelica://iPSL.NonElectrical.Continuous\">iPSL.NonElectrical.Continuous</a>.
</html>"));
end Controls;
