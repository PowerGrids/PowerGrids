within PowerGrids.Controls.Test;

model TestFreeOffset
  extends Modelica.Icons.Example;
  PowerGrids.Controls.FreeOffset freeOffset1 annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FreeOffset freeOffset2(use_u = true)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(freqHz = 1)  annotation(
    Placement(visible = true, transformation(origin = {-44, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  freeOffset1.y = 1;
  freeOffset2.y = 2;
equation
  connect(sine.y, freeOffset2.u) annotation(
    Line(points = {{-32, -20}, {-10, -20}, {-10, -20}, {-10, -20}, {-10, -20}}, color = {0, 0, 127}));
annotation(
    Documentation(info = "<html>
<p>Tests for the <a href=\"modelica://PowerGrids.Controls.FreeOffset\">PowerGrids.Controls.FreeOffset</a> model. The two required additional equations are found in the text view.
</html>"));
end TestFreeOffset;
