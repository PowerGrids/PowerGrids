within PowerGrids.Electrical.Controls.ExcitationSystems;

model IEEE_ST4B "Static excitation system - IEEE type ST4B "
  parameter SI.PerUnit kpr = 10.75 "Voltage regulator proportional gain";
  parameter Real kir(unit = "1/s") = 10.75 "Voltage regulator integral gain";
  parameter SI.Time Ta = 0.02 "Voltage regulator time constant";
  parameter SI.PerUnit vrmax = 1 "Maximum voltage regulator output";
  parameter SI.PerUnit vrmin = -0.87 "Minimum voltage regulator output";
  parameter SI.PerUnit kpm = 1 "Voltage regulator proportional gain output";
  parameter Real kim(unit = "1/s") = 0 "Voltage regulator integral gain output";
  parameter SI.PerUnit vmmax = 99 "Maximum inner loop output";
  parameter SI.PerUnit vmmin = -99 "Minimum inner loop output";
  parameter SI.PerUnit kg = 0 "Feedbak gain of the inner loop field regulator";
  parameter SI.PerUnit kc = 0.113 "Rectifier loading factor proportional to commutating reactance";
  parameter SI.PerUnit vbmax = 11.63 "Maximum excitation voltage";
  Modelica.Blocks.Interfaces.RealInput VsPu "PSS output p.u" annotation(
    Placement(visible = true, transformation(origin = {-160, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VcPu "Machine terminal voltage p.u." annotation(
    Placement(visible = true, transformation(origin = {-160, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VePu "Exciter voltage back of commutating reactance p.u." annotation(
    Placement(visible = true, transformation(origin = {-160, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput IfdPu "Machine field current p.u." annotation(
    Placement(visible = true, transformation(origin = {-160, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VrefPu "Voltage reference p.u." annotation(
    Placement(visible = true, transformation(origin = {-160, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput VuelPu "Underexcitation limit p.u." annotation(
    Placement(visible = true, transformation(origin = {-160, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput VoelPu "Overexcitation limit p.u." annotation(
    Placement(visible = true, transformation(origin = {50, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput EfdPu "Exciter output voltage p.u." annotation(
    Placement(visible = true, transformation(origin = {150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MultiSum sum1(k = {+1, +1, -1, +1}, nu = 4) annotation(
    Placement(visible = true, transformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.PIWithNonWindupLimiter voltageRegulatorPI(Ki = kir, Kp = kpr, initType = Modelica.Blocks.Types.Init.SteadyState, yMax = vrmax, yMin = vrmin, yStart = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FirstOrder voltageRegulatorTa(T = Ta, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Controls.PIWithNonWindupLimiter voltageRegulatorOutput(Ki = kim, Kp = kpm, initType = Modelica.Blocks.Types.Init.SteadyState, yMax = vmmax, yMin = vmmin, yStart = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Min lvGate annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainKg(k = kg) annotation(
    Placement(visible = true, transformation(origin = {90, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product prod1 annotation(
    Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division div1 annotation(
    Placement(visible = true, transformation(origin = {-110, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainKc(k = kc) annotation(
    Placement(visible = true, transformation(origin = {-70, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BaseClasses.ExciterRectifierRegulationCharacteristicEquationsIEEE exciterRectifierRegulationCharacteristicEquationsIEEE annotation(
    Placement(visible = true, transformation(origin = {-30, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product prod2 annotation(
    Placement(visible = true, transformation(origin = {10, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiterVbmax(limitsAtInit = true, uMax = vbmax, uMin = -Modelica.Constants.inf) annotation(
    Placement(visible = true, transformation(origin = {50, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(limiterVbmax.y, prod1.u2) annotation(
    Line(points = {{62, -56}, {92, -56}, {92, 24}, {98, 24}, {98, 24}}, color = {0, 0, 127}));
  connect(prod2.y, limiterVbmax.u) annotation(
    Line(points = {{22, -56}, {38, -56}, {38, -56}, {38, -56}}, color = {0, 0, 127}));
  connect(VePu, prod2.u2) annotation(
    Line(points = {{-160, -80}, {-12, -80}, {-12, -62}, {-2, -62}, {-2, -62}}, color = {0, 0, 127}));
  connect(exciterRectifierRegulationCharacteristicEquationsIEEE.y, prod2.u1) annotation(
    Line(points = {{-18, -56}, {-12, -56}, {-12, -50}, {-2, -50}, {-2, -50}}, color = {0, 0, 127}));
  connect(gainKc.y, exciterRectifierRegulationCharacteristicEquationsIEEE.u) annotation(
    Line(points = {{-58, -56}, {-42, -56}, {-42, -56}, {-42, -56}}, color = {0, 0, 127}));
  connect(div1.y, gainKc.u) annotation(
    Line(points = {{-98, -56}, {-82, -56}, {-82, -56}, {-82, -56}}, color = {0, 0, 127}));
  connect(VePu, div1.u2) annotation(
    Line(points = {{-160, -80}, {-132, -80}, {-132, -62}, {-122, -62}, {-122, -62}}, color = {0, 0, 127}));
  connect(IfdPu, div1.u1) annotation(
    Line(points = {{-160, -50}, {-122, -50}, {-122, -50}, {-122, -50}}, color = {0, 0, 127}));
  connect(gainKg.y, feedback.u2) annotation(
    Line(points = {{80, 60}, {0, 60}, {0, 40}, {0, 40}, {0, 38}}, color = {0, 0, 127}));
  connect(prod1.y, gainKg.u) annotation(
    Line(points = {{122, 30}, {128, 30}, {128, 60}, {102, 60}, {102, 60}}, color = {0, 0, 127}));
  connect(prod1.y, EfdPu) annotation(
    Line(points = {{122, 30}, {144, 30}, {144, 30}, {150, 30}}, color = {0, 0, 127}));
  connect(lvGate.y, prod1.u1) annotation(
    Line(points = {{82, 30}, {88, 30}, {88, 36}, {98, 36}, {98, 36}}, color = {0, 0, 127}));
  connect(lvGate.u1, VoelPu) annotation(
    Line(points = {{58, 36}, {50, 36}, {50, 100}, {50, 100}}, color = {0, 0, 127}));
  connect(voltageRegulatorOutput.y, lvGate.u2) annotation(
    Line(points = {{42, 30}, {48, 30}, {48, 24}, {58, 24}, {58, 24}}, color = {0, 0, 127}));
  connect(feedback.y, voltageRegulatorOutput.u) annotation(
    Line(points = {{10, 30}, {18, 30}, {18, 30}, {18, 30}}, color = {0, 0, 127}));
  connect(voltageRegulatorTa.y, feedback.u1) annotation(
    Line(points = {{-18, 30}, {-10, 30}, {-10, 30}, {-8, 30}}, color = {0, 0, 127}));
  connect(voltageRegulatorPI.y, voltageRegulatorTa.u) annotation(
    Line(points = {{-58, 30}, {-42, 30}, {-42, 30}, {-42, 30}}, color = {0, 0, 127}));
  connect(sum1.y, voltageRegulatorPI.u) annotation(
    Line(points = {{-98, 30}, {-84, 30}, {-84, 30}, {-82, 30}}, color = {0, 0, 127}));
  connect(VrefPu, sum1.u[4]) annotation(
    Line(points = {{-160, 0}, {-124, 0}, {-124, 28}, {-120, 28}, {-120, 30}}, color = {0, 0, 127}));
  connect(VcPu, sum1.u[3]) annotation(
    Line(points = {{-160, 30}, {-120, 30}, {-120, 30}, {-120, 30}}, color = {0, 0, 127}));
  connect(VuelPu, sum1.u[2]) annotation(
    Line(points = {{-160, 60}, {-130, 60}, {-130, 32}, {-120, 32}, {-120, 30}}, color = {0, 0, 127}));
  connect(VsPu, sum1.u[1]) annotation(
    Line(points = {{-160, 90}, {-126, 90}, {-126, 34}, {-120, 34}, {-120, 30}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-4, -117}, lineColor = {0, 0, 255}, extent = {{-50, 11}, {50, -11}}, textString = "%name"), Text(origin = {-2, 50}, extent = {{-76, 24}, {76, -24}}, textString = "Exciter"), Text(origin = {0, -2}, extent = {{-76, 24}, {76, -24}}, textString = "IEEE"), Text(origin = {-2, -52}, extent = {{-76, 24}, {76, -24}}, textString = "ST4B")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body>The class implements a model of a static exictation system according to the&nbsp;<span style=\"font-size: 12px;\">IEEE Std 421.5TM-2005.</span><div><span style=\"font-size: 12px;\"><br></span></div><div>The type implemented is the ST4B, described in the chapter 7.4 of the same&nbsp;<span style=\"font-size: 12px;\">IEEE Std 421.5TM-2005.</span></div></body></html>"));
end IEEE_ST4B;
