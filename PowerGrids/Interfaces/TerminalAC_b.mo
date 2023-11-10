within PowerGrids.Interfaces;

connector TerminalAC_b
  extends TerminalAC annotation(IconMap(primitivesVisible=false), DiagramMap(primitivesVisible=false));
annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 1, grid = {2, 2})),
  Documentation(info = "<html><head></head><body>Alias of <a href=\"modelica://PowerGrids.Interfaces.TerminalAC\">TerminalAC</a> interface with a different icon, to be used  as TerminalAC_b in the two-ports components.</body></html>"));
end TerminalAC_b;
