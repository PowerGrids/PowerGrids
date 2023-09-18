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
      Icon(graphics = {Line(origin = {0, -20}, points = {{0, 20}, {0, -20}, {0, -20}}), Polygon(origin = {0, -70}, fillPattern = FillPattern.Solid, points = {{-40, 30}, {40, 30}, {0, -30}, {-40, 30}}), Text(origin = {0, -116}, textColor = {0, 0, 255}, extent = {{-100, 10}, {100, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));end Load;

  model Machine
  equation

  annotation(
      Icon(graphics = {Text(origin = {0, -116}, textColor = {0, 0, 255}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), 
        Rectangle(origin = {0, -50},fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-50, 50}, {50, -50}}),
        Ellipse(origin = {2, -51}, extent = {{-40, 41}, {40, -40}}),
        Line(origin = {0.00014, -50.5485},points = 
          {{-20, 0}, 
          {-15.375,13.3},
          {-13.8,16.6},
          {-12.35,18.65},
          {-10.95,19.775},
          {-9.8,19.95},
          {-8.15,19.15},
          {-6.725,17.425},
          {-5.325,14.85},
          {-3.725,11.025},
          {-1.7075,5.3},
          {1.7075,-5.3},
          {3.725,-11.025},
          {5.325,-14.85},
          {6.725,-17.425},
          {8.15,-19.15},
          {9.8,-19.95},
          {10.95,-19.775},
          {12.35,-18.65},
          {13.8,-16.6},
          {15.375,-13.3},
          {20,0}}, smooth = Smooth.Bezier)}, coordinateSystem(initialScale = 0.1)));end Machine;

  model CapacitorBank
  equation

    annotation(
      Icon(graphics = {Polygon(origin = {0, -70}, fillPattern = FillPattern.Solid, points = {{-40, 30}, {40, 30}, {0, -30}, {-40, 30}}), Rectangle(origin = {0, -14}, fillPattern = FillPattern.Solid, extent = {{-20, 2}, {20, -2}}), Rectangle(origin = {0, -26}, fillPattern = FillPattern.Solid, extent = {{-20, 2}, {20, -2}}), Line(origin = {0, -7}, points = {{0, 7}, {0, -7}}), Line(origin = {0, -34}, points = {{0, 8}, {0, -8}}), Text(origin = {-1, -119}, lineColor = {0, 0, 255}, extent = {{-81, 11}, {81, -11}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
  end CapacitorBank;

  model Grid
  equation

    annotation(
      Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {-3, 150}, textColor = {0, 0, 255}, extent = {{-81, 12}, {81, -12}}, textString = "%name"), Rectangle(origin = {0, 68},fillColor = {255, 255, 255},fillPattern = FillPattern.CrossDiag, extent = {{-60, 60}, {60, -60}}), Rectangle(fillPattern = FillPattern.Solid, extent = {{-100, 8}, {100, -8}})}));
  end Grid;

  model Fault
  annotation (
      Icon(coordinateSystem(grid = {0.1, 0.1}), graphics={Line(origin = {3.23656, -70.242}, points = {{-3.01972, 29.9973}, {18.9803, 9.99729}, {-19.0197, -12.0027}, {2.98028, -30.0027}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Rectangle(origin = {0, -15}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-20, 25}, {20, -25}})}));
  end Fault;
  
  model Short
  annotation (
      Icon(coordinateSystem(grid = {0.1, 0.1}), graphics = {Rectangle(origin = {0, -46}, fillPattern = FillPattern.Solid, extent = {{-24, 6}, {24, -6}}), Line(origin = {0, -20}, points = {{0, 20}, {0, -20}}), Text(origin = {5, -76}, textColor = {0, 0, 255}, extent = {{-75, 16}, {75, -16}}, textString = "%name")}));
  end Short;
end Icons;
