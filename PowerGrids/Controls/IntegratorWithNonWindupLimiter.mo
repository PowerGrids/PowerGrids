within PowerGrids.Controls;
model IntegratorWithNonWindupLimiter "Integrator with non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real k(unit = "1/s") = 1 "Integral constant";
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
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I(initType = initType, k = k, y_start = yStart) annotation(
    Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
equation
  connect(I.y, lim.u) annotation(
    Line(points = {{-13, 0}, {20, 0}}, color = {0, 0, 127}));
  connect(lim.y, y) annotation(
    Line(points = {{43, 0}, {110, 0}}, color = {0, 0, 127}));
  // The simplified model has no saturation, to make the controller equations linear
  I.u = homotopy(
    actual = if (u*k > 0 and lim.u > lim.uMax) or (u*k < 0 and lim.u < lim.uMin) then 0 else u,
    simplified = u);
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Line(origin = {0, 1.05741}, points = {{-80, -121.057}, {-40, -121.057}, {42, 118.943}, {80, 118.943}}), Rectangle( lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {12, 28}, extent = {{-44, 34}, {26, -16}}, textString = "k"), Text(origin = {2, -30}, extent = {{-60, 22}, {60, -22}}, textString = "s"), Line(origin = {56, 0}, points = {{-86, 0}, {-24, 0}})}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, initialScale = 0.1), graphics = {Line(origin = {-69, 0}, points = {{-29, 0}, {29, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash), Text(origin = {-65, 37}, extent = {{-109, 15}, {109, -15}}, textString = "I.u = if (u*k > 0 and lim.u > lim.uMax) or (u*k < 0 and lim.u < lim.uMin) then 0 else u

(see text view)"), Line(origin = {-68, 11}, points = {{0, 13}, {0, -7}, {0, -9}}, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Text(origin = {-135, 64}, extent = {{-17, 8}, {41, -12}}, textString = "Integrator charging\nupper limiter engaged"), Text(origin = {-43, 64}, extent = {{-17, 8}, {41, -12}}, textString = "Integrator discharging\nlower limiter engaged")}),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">Model to implement an integrator filter:</span><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>y &nbsp; &nbsp; k</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>- = -----</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>u &nbsp; &nbsp; s</div><div style=\"font-size: 12px;\"><br></div><div style=\"font-size: 12px;\">It is required that k &gt; 0K</div><div style=\"font-size: 12px;\">Output limiter with anti-windup is also implemented.</div></body></html>"));
end IntegratorWithNonWindupLimiter;
