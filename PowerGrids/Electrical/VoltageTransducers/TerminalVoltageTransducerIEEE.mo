within PowerGrids.Electrical.VoltageTransducers;
model TerminalVoltageTransducerIEEE "Terminal voltage transducer IEEE"
  parameter Modelica.SIunits.Time Tr = 0 "Transducer time constant";
  parameter Modelica.SIunits.PerUnit Rc = 0 "Load compensation resistance";
  parameter Modelica.SIunits.PerUnit Xc = 0 "Load compensation reactance";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate=true,
      Dialog(group="Initialization"));
  parameter Real yStart=0 "Initial or guess value of output (= state)" annotation (
  Dialog(group="Initialization"));
  Modelica.ComplexBlocks.Interfaces.ComplexInput Vt annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.ComplexBlocks.Interfaces.ComplexInput It annotation(
    Placement(visible = true, transformation(origin = {-170, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Vc annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.RealToComplex constZc annotation(
    Placement(visible = true, transformation(origin = {-110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constRc(k = Rc)  annotation(
    Placement(visible = true, transformation(origin = {-150, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constXc(k = Xc)  annotation(
    Placement(visible = true, transformation(origin = {-150, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.Product prod1 annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.ComplexToPolar complexToPolar annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Tr, initType = initType, y_start = yStart)  annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(firstOrder.y, Vc) annotation(
    Line(points = {{62, -10}, {82, -10}, {82, -10}, {90, -10}}, color = {0, 0, 127}));
  connect(complexToPolar.len, firstOrder.u) annotation(
    Line(points = {{22, -4}, {30, -4}, {30, -10}, {38, -10}, {38, -10}}, color = {0, 0, 127}));
  connect(add1.y, complexToPolar.u) annotation(
    Line(points = {{-18, -10}, {-2, -10}, {-2, -10}, {-2, -10}}, color = {85, 170, 255}));
  connect(Vt, add1.u1) annotation(
    Line(points = {{-170, 70}, {-52, 70}, {-52, -4}, {-42, -4}, {-42, -4}}, color = {85, 170, 255}));
  connect(prod1.y, add1.u2) annotation(
    Line(points = {{-58, -10}, {-52, -10}, {-52, -16}, {-42, -16}, {-42, -16}}, color = {85, 170, 255}));
  connect(It, prod1.u1) annotation(
    Line(points = {{-170, 30}, {-90, 30}, {-90, -4}, {-82, -4}, {-82, -4}}, color = {85, 170, 255}));
  connect(constZc.y, prod1.u2) annotation(
    Line(points = {{-98, -10}, {-94, -10}, {-94, -16}, {-82, -16}, {-82, -16}}, color = {85, 170, 255}));
  connect(constXc.y, constZc.im) annotation(
    Line(points = {{-138, -36}, {-132, -36}, {-132, -16}, {-122, -16}, {-122, -16}}, color = {0, 0, 127}));
  connect(constRc.y, constZc.re) annotation(
    Line(points = {{-138, -4}, {-122, -4}, {-122, -4}, {-122, -4}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-4, 119}, lineColor = {0, 0, 255}, extent = {{-48, 11}, {48, -11}}, textString = "%name"), Text(origin = {0, 26}, extent = {{-56, 36}, {56, -36}}, textString = "Vt It"), Text(origin = {-3, -25}, extent = {{-79, 59}, {87, -51}}, textString = "Transducer")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>This model implements a terminal voltage transducer according to the IEEE Std 421.5TM-2005.<div><br></div><div>It includes a load compensator and a time constant, which is common for the combined voltage sensing and compensation signal.</div></body></html>"));
end TerminalVoltageTransducerIEEE;
