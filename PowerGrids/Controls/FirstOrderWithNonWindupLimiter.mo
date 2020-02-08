within PowerGrids.Controls;
model FirstOrderWithNonWindupLimiter "First order filter with non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO(y(start = yStart));
  parameter Real k = 1 "Gain";
  parameter SI.Time T "Time Constant";
  parameter Real yMax "Upper limits of output signal";
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
    Placement(visible = true, transformation(origin = {52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-56, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain G(k = 1 / T) annotation(
    Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I(initType = initType, k = 1, y_start = yStart) annotation(
    Placement(visible = true, transformation(origin = {16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Gk(k = k) annotation(
    Placement(visible = true, transformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  assert(T > 0, "T must be positive");
equation
  connect(Gk.u, u) annotation(
    Line(points = {{-94, 0}, {-108, 0}, {-108, 0}, {-120, 0}}, color = {0, 0, 127}));
  connect(Gk.y, feedback.u1) annotation(
    Line(points = {{-70, 0}, {-66, 0}, {-66, 0}, {-64, 0}}, color = {0, 0, 127}));
  connect(lim.y, feedback.u2) annotation(
    Line(points = {{63, 0}, {74, 0}, {74, -32}, {-56, -32}, {-56, -8}}, color = {0, 0, 127}));
  connect(feedback.y, G.u) annotation(
    Line(points = {{-47, 0}, {-36, 0}}, color = {0, 0, 127}));
  connect(lim.y, y) annotation(
    Line(points = {{64, 0}, {104, 0}, {104, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(I.y, lim.u) annotation(
    Line(points = {{27, 0}, {40, 0}}, color = {0, 0, 127}));
  // The simplified model has no saturation, to make the controller equations linear
  I.u = homotopy(
    actual = if (G.y >= 0 and lim.u > lim.uMax) or (G.y <= 0 and lim.u < lim.uMin) then 0 else G.y,
    simplified = G.y);
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Line(origin = {0, 1.05741}, points = {{-80, -121.057}, {-40, -121.057}, {42, 118.943}, {80, 118.943}}), Rectangle( lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {12, 28}, extent = {{-44, 34}, {26, -16}}, textString = "k"), Text(origin = {2, -44}, extent = {{-60, 22}, {60, -22}}, textString = "1 + sT"), Line(origin = {4, 0}, points = {{-86, 0}, {86, 0}})}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, initialScale = 0.1), graphics = {Line(origin = {-12.32, -0.16}, points = {{-12, 0}, {12, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash), Text(origin = {-27, 34}, extent = {{-87, 34}, {137, -28}}, textString = "I.u = if (G.y >= 0 and lim.u > lim.uMax) or (G.y <= 0 and lim.u < lim.uMin) then 0 else G.y

(see text view)"), Line(origin = {85, -61}, points = {{75, 25}}), Line(origin = {-4.62687, 9.80597}, points = {{0, 14}, {0, -8}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Text(origin = {-22, 53}, extent = {{-96, 11}, {16, -3}}, textString = "Integrator charging
 upper limiter engaged"), Text(origin = {78, 53}, extent = {{-94, 11}, {16, -3}}, textString = "Integrator discharging
 lower limiter engaged")}),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">Model to implement a first order filter:</span><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>y &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;k</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>- = -------------</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>u&nbsp; &nbsp; &nbsp; 1 + s*T</div><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\">It is required that T &gt; 0.</div><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\">Output limiter with anti-windup is also implemented.</div></body></html>"));
end FirstOrderWithNonWindupLimiter;
