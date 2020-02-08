within PowerGrids.Controls;
model PIWithNonWindupLimiter "Proportional-Integral filter with non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real Kp "Proportional gain";
  parameter Real Ki(unit = "1/s") = 0 "Integral constant";
  parameter Boolean noDynamics = not(Ki > 0) and not(Ki < 0) "Trivial configuration with no dynamics G(s) = k";
  parameter Real yMax = 1 "Upper limits of output signal";
  parameter Real yMin = -yMax "Lower limits of output signal";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialState "Type of initialization (1: no init, 2: steady state, 3,4: initial output)" annotation(
    Evaluate = true,
    Dialog(group = "Initialization"));
  parameter Real yStart = 0 "Initial or guess value of output (= state)" annotation(
    Dialog(group = "Initialization"));
  parameter Boolean strict = false "= true, if strict limits with noEvent(..)" annotation(
    Evaluate = true,
    choices(checkBox = true),
    Dialog(tab = "Advanced"));
  Modelica.Blocks.Nonlinear.Limiter lim(limitsAtInit = true, strict = strict, uMax = yMax, uMin = yMin) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain G(k = Kp) annotation(
    Placement(visible = true, transformation(origin = {-72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Kp / Ki, initType = initType, k = -1, y_start = -yStart) if not noDynamics  annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero if noDynamics annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  assert(Kp*Ki >= 0, "Kp and Ki must not have opposite sign");
equation
  connect(zero.y, feedback.u2) annotation(
    Line(points = {{-78, -40}, {-40, -40}, {-40, -8}, {-40, -8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(feedback.y, lim.u) annotation(
    Line(points = {{-30, 0}, {-12, 0}, {-12, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(G.y, feedback.u1) annotation(
    Line(points = {{-60, 0}, {-48, 0}}, color = {0, 0, 127}));
  connect(firstOrder.y, feedback.u2) annotation(
    Line(points = {{-12, -40}, {-40, -40}, {-40, -8}}, color = {0, 0, 127}));
  connect(u, G.u) annotation(
    Line(points = {{-120, 0}, {-84, 0}, {-84, 0}, {-84, 0}}, color = {0, 0, 127}));
  connect(lim.y, firstOrder.u) annotation(
    Line(points = {{12, 0}, {36, 0}, {36, -40}, {12, -40}, {12, -40}}, color = {0, 0, 127}));
  connect(lim.y, y) annotation(
    Line(points = {{11, 0}, {110, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Line(origin = {0, 1.05741}, points = {{-80, -121.057}, {-40, -121.057}, {42, 118.943}, {80, 118.943}}), Rectangle( lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-56,0}, extent = {{-60, 22}, {60, -22}}, textString = "Kp"), Text(origin = {48, 28}, extent = {{-60, 22}, {60, -22}}, textString = "Ki"), Text(origin = {48, -26}, extent = {{-60, 22}, {60, -22}}, textString = "s"), Line(origin = {47, -2}, points = {{-33, 0}, {33, 0}}), Text(origin = {-12, 0}, extent = {{-60, 22}, {60, -22}}, textString = "+")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, initialScale = 0.1), graphics = {Text(origin = {-91, -67}, extent = {{-35, 5}, {227, -19}}, textString = "The case noDynamics = true is handled via conditional blocks (see text view)
When noDynamics = true the firstOrder block is not instantiated
and the zero block is instantiated instead")}),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">Model to implement a Proportional-Integral filter:</span><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>y &nbsp; &nbsp; &nbsp; &nbsp; Ki</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>- = Kp +&nbsp;</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>u &nbsp; &nbsp; &nbsp; &nbsp; s</div><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\">Output limiter with anti-windup is also implemented.</div></body></html>"));
end PIWithNonWindupLimiter;
