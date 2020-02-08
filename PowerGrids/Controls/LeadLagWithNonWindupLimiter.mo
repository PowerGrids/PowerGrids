within PowerGrids.Controls;

model LeadLagWithNonWindupLimiter "Lead-lag filter with non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO(y(start = yStart));
  parameter Real k = 1 "Gain";
  parameter SI.Time T1 = 1 "Lead time constant";
  parameter SI.Time T2 = 10 "Lag time constant";
  parameter Real yMax = 1 "Upper limits of output signal";
  parameter Real yMin = -yMax "Lower limits of output signal";
  parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.InitialState "Type of initialization (1: no init, 2: steady state, 3,4: initial output)" annotation(
   Dialog(group = "Initialization"));
  parameter Real yStart = 0 "Initial or guess value of output (= state)" annotation(
   Dialog(group = "Initialization"));
  parameter Boolean strict = false "= true, if strict limits with noEvent(..)" annotation(
    Evaluate = true,
    choices(checkBox = true),
    Dialog(tab = "Advanced"));
  Modelica.Blocks.Math.Gain gain_dir(k = k * T1 / T2) annotation(
    Placement(visible = true, transformation(origin = {-4, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter_y(limitsAtInit = true, strict = strict, uMax = yMax, uMin = yMin) annotation(
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback_y annotation(
    Placement(visible = true, transformation(origin = {46, -52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integ_fb(initType = initType, k = 1 / T1, y_start = yStart) annotation(
    Placement(visible = true, transformation(origin = {10, -52}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain_fb(k = (1 - T2 / T1) / k) annotation(
    Placement(visible = true, transformation(origin = {-60, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback_u annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  assert(T1 > 0, "T1 must be positive");
  assert(T2 > 0, "T2 must be positive");
equation
  connect(gain_fb.y, feedback_u.u2) annotation(
    Line(points = {{-60, -17}, {-60, -8}}, color = {0, 0, 127}));
  connect(integ_fb.y, gain_fb.u) annotation(
    Line(points = {{1, -52}, {-60, -52}, {-60, -40}}, color = {0, 0, 127}));
  connect(feedback_u.y, gain_dir.u) annotation(
    Line(points = {{-51, 0}, {-16, 0}}, color = {0, 0, 127}));
  connect(u, feedback_u.u1) annotation(
    Line(points = {{-120, 0}, {-68, 0}}, color = {0, 0, 127}));
  connect(integ_fb.y, feedback_y.u2) annotation(
    Line(points = {{-1, -52}, {-15, -52}, {-15, -74}, {45, -74}, {45, -60}, {46, -60}}, color = {0, 0, 127}));
  connect(feedback_y.y, integ_fb.u) annotation(
    Line(points = {{37, -52}, {23, -52}}, color = {0, 0, 127}));
  connect(limiter_y.y, feedback_y.u1) annotation(
    Line(points = {{43, 0}, {67, 0}, {67, -52}, {54, -52}}, color = {0, 0, 127}));
  connect(limiter_y.y, y) annotation(
    Line(points = {{45, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(gain_dir.y, limiter_y.u) annotation(
    Line(points = {{7, 0}, {13, 0}, {13, 0}, {19, 0}, {19, 0}, {19, 0}, {19, 0}, {19, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Line(origin = {0, 1.05741}, points = {{-80, -121.057}, {-40, -121.057}, {42, 118.943}, {80, 118.943}}), Rectangle( lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {14, -36}, extent = {{-60, 22}, {60, -22}}, textString = "1 + sT2"), Line(origin = {4, 0}, points = {{-64, 0}, {86, 0}}), Text(origin = {12, 32}, extent = {{-60, 22}, {60, -22}}, textString = "1 + sT1"), Text(origin = {-56, -4}, extent = {{-60, 22}, {12, -12}}, textString = "k")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, initialScale = 0.1)),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">Model to implement a lead-lag filter:</span><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>y<span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>&nbsp; &nbsp;&nbsp;1 + s*T1</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>- = k * ----------------</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>u<span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>&nbsp; &nbsp;&nbsp;1 + s*T2</div><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\">It is required that T1 &gt; 0 and T2 &gt; 0.</div><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\">Output limiter with anti-windup is also implemented.</div></body></html>"));
end LeadLagWithNonWindupLimiter;
