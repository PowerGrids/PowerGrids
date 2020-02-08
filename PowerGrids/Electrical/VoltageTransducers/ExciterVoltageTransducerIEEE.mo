within PowerGrids.Electrical.VoltageTransducers;
model ExciterVoltageTransducerIEEE "Exciter voltage transducer"
  parameter SI.PerUnit kp = 9.3"First potential circuit gain";
  parameter SI.Angle thetap = 0 "Potential circuit phase angle Thetap";
  parameter SI.PerUnit ki = 0 "Second potential circuit gain coefficient";
  parameter SI.PerUnit xl = 0.124 "Reactance associated with potential source";
  Modelica.ComplexBlocks.Interfaces.ComplexInput Vt annotation(
    Placement(visible = true, transformation(origin = {-170, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.ComplexBlocks.Interfaces.ComplexInput It annotation(
    Placement(visible = true, transformation(origin = {-170, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Ve annotation(
    Placement(visible = true, transformation(origin = {170, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constKp(k = kp)  annotation(
    Placement(visible = true, transformation(origin = {-150, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constThetap(k = thetap)  annotation(
    Placement(visible = true, transformation(origin = {-150, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.ComplexToPolar complexToPolar annotation(
    Placement(visible = true, transformation(origin = {130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.PolarToComplex complexKp annotation(
    Placement(visible = true, transformation(origin = {-110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.Gain gainXl(k.re = 0, k.im = xl) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.Gain J(k.re = 0, k.im = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.Product prod1 annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.Add add2 annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.Product prod2 annotation(
    Placement(visible = true, transformation(origin = {-70, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.Sources.ComplexConstant constKi(k.re = ki, k.im = 0) annotation(
    Placement(visible = true, transformation(origin = {-50, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(constKi.y, add1.u2) annotation(
    Line(points = {{-50, -4}, {-50, -4}, {-50, 4}, {-42, 4}, {-42, 4}}, color = {85, 170, 255}));
  connect(Vt, prod2.u1) annotation(
    Line(points = {{-170, 50}, {-82, 50}, {-82, 50}, {-82, 50}}, color = {85, 170, 255}));
  connect(complexToPolar.len, Ve) annotation(
    Line(points = {{142, 16}, {162, 16}, {162, 16}, {170, 16}}, color = {0, 0, 127}));
  connect(add2.y, complexToPolar.u) annotation(
    Line(points = {{102, 10}, {118, 10}, {118, 10}, {118, 10}}, color = {85, 170, 255}));
  connect(prod1.y, add2.u2) annotation(
    Line(points = {{62, 10}, {70, 10}, {70, 4}, {78, 4}, {78, 4}}, color = {85, 170, 255}));
  connect(prod2.y, add2.u1) annotation(
    Line(points = {{-58, 44}, {70, 44}, {70, 16}, {78, 16}, {78, 16}}, color = {85, 170, 255}));
  connect(complexKp.y, prod2.u2) annotation(
    Line(points = {{-98, 10}, {-92, 10}, {-92, 40}, {-82, 40}}, color = {85, 170, 255}));
  connect(It, prod1.u2) annotation(
    Line(points = {{-170, -50}, {28, -50}, {28, 4}, {38, 4}, {38, 4}}, color = {85, 170, 255}));
  connect(J.y, prod1.u1) annotation(
    Line(points = {{22, 10}, {26, 10}, {26, 16}, {38, 16}, {38, 16}}, color = {85, 170, 255}));
  connect(add1.y, J.u) annotation(
    Line(points = {{-18, 10}, {-2, 10}, {-2, 10}, {-2, 10}}, color = {85, 170, 255}));
  connect(gainXl.y, add1.u1) annotation(
    Line(points = {{-58, 10}, {-54, 10}, {-54, 16}, {-42, 16}, {-42, 16}}, color = {85, 170, 255}));
  connect(complexKp.y, gainXl.u) annotation(
    Line(points = {{-98, 10}, {-82, 10}, {-82, 10}, {-82, 10}}, color = {85, 170, 255}));
  connect(constThetap.y, complexKp.phi) annotation(
    Line(points = {{-138, -16}, {-132, -16}, {-132, 4}, {-122, 4}, {-122, 4}}, color = {0, 0, 127}));
  connect(constKp.y, complexKp.len) annotation(
    Line(points = {{-138, 16}, {-124, 16}, {-124, 16}, {-122, 16}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-4, 119}, lineColor = {0, 0, 255}, extent = {{-48, 11}, {48, -11}}, textString = "%name"), Text(origin = {0, 6}, extent = {{-56, 36}, {56, -36}}, textString = "Vt It"), Text(origin = {-11, -23}, extent = {{-65, 1}, {87, -51}}, textString = "Transducer"), Text(origin = {-1, 79}, extent = {{-65, 1}, {57, -39}}, textString = "Exciter")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This class implements a model of the voltage transducer tipically used in static excitation systems,&nbsp;</span><span style=\"font-size: 12px;\">according to the IEEE Std 421.5TM-2005.</span><div><br></div><div>More precisely, said transducer is included in the exciters models of Type ST3A and ST4B of the IEEE Std 421.5TM-2005.</div></body></html>"));
end ExciterVoltageTransducerIEEE;