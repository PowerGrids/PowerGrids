within PowerGrids;

package Icons "Icons for the PowerGrids library"
  extends Modelica.Icons.IconsPackage;

  model Bus
  equation

  annotation(
      Icon(graphics = {Rectangle(origin = {0, 2}, fillPattern = FillPattern.Solid, extent = {{-100, 6}, {100, -10}}), Text(origin = {0, 30}, lineColor = {0, 0, 255}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));end Bus;

  model Line
  equation

  annotation(
      Icon(graphics = {Rectangle(origin = {-1, -1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-59, 11}, {61, -11}}), Line(origin = {-80, 0}, points = {{-20, 0}, {20, 0}}), Line(origin = {80, 0}, points = {{-20, 0}, {20, 0}}), Text(origin = {0, 30}, lineColor = {0, 0, 255}, extent = {{-80, 10}, {80, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));end Line;

  model Transformer
  equation

  annotation(
      Icon(graphics = {Ellipse(origin = {-15, -7}, extent = {{-45, 47}, {35, -33}}, endAngle = 360), Ellipse(origin = {3, -9}, extent = {{57, 49}, {-23, -31}}, endAngle = 360), Line(origin = {-80, 0}, points = {{-20, 0}, {20, 0}, {20, 0}}), Line(origin = {80, 0}, points = {{-20, 0}, {20, 0}}), Text(origin = {0, 61}, lineColor = {0, 0, 255}, extent = {{-80, 11}, {80, -11}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));end Transformer;

  model Load
  equation

  annotation(
      Icon(graphics = {Line(origin = {0, -20}, points = {{0, 20}, {0, -20}, {0, -20}}), Polygon(origin = {0, -70}, fillPattern = FillPattern.Solid, points = {{-40, 30}, {40, 30}, {0, -30}, {-40, 30}}), Text(origin = {-1, -120}, lineColor = {0, 0, 255}, extent = {{-81, 10}, {81, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));end Load;

  model Machine
  equation

  annotation(
      Icon(graphics = {Ellipse(origin = {0, -1}, extent = {{-60, 61}, {60, -59}}, endAngle = 360), Text(origin = {0, 80}, lineColor = {0, 0, 255}, extent = {{-80, 10}, {80, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));end Machine;

  model CapacitorBank
  equation

    annotation(
      Icon(graphics = {Polygon(origin = {0, -70}, fillPattern = FillPattern.Solid, points = {{-40, 30}, {40, 30}, {0, -30}, {-40, 30}}), Rectangle(origin = {0, -14}, fillPattern = FillPattern.Solid, extent = {{-20, 2}, {20, -2}}), Rectangle(origin = {0, -26}, fillPattern = FillPattern.Solid, extent = {{-20, 2}, {20, -2}}), Line(origin = {0, -7}, points = {{0, 7}, {0, -7}}), Line(origin = {0, -34}, points = {{0, 8}, {0, -8}}), Text(origin = {-1, -119}, lineColor = {0, 0, 255}, extent = {{-81, 11}, {81, -11}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
  end CapacitorBank;

  model Ground
  equation

    annotation(
      Icon(graphics = {Line(origin = {0, -20}, points = {{0, 20}, {0, -20}, {0, -20}}), Line(origin = {0, -40}, points = {{-40, 0}, {40, 0}, {40, 0}, {40, 0}}), Line(origin = {0, -60}, points = {{-20, 0}, {20, 0}, {20, 0}}), Line(origin = {0, -80}, points = {{-4, 0}, {4, 0}})}, coordinateSystem(initialScale = 0.1)));
  end Ground;

  model Grid
  equation

    annotation(
      Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {0, -1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.CrossDiag, extent = {{-60, 61}, {60, -59}}), Text(origin = {-1, 80}, lineColor = {0, 0, 255}, extent = {{-81, 12}, {81, -12}}, textString = "%name")}));
  end Grid;
end Icons;