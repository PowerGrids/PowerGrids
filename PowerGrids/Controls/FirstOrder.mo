within PowerGrids.Controls;
model FirstOrder
  extends Modelica.Blocks.Interfaces.SISO(y(start = y_start));
  parameter Boolean noDynamics = not(T > 0) "Trivial configuration with no dynamics G(s) = k";
  parameter Real k=1 "Gain";
  parameter SI.Time T "Time Constant";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(
      Evaluate=true,
      Dialog(group="Initialization"));
  parameter Real y_start=0 "Initial or guess value of output (= state)" annotation (
   Dialog(group="Initialization"));


  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = T, initType = initType, k = k, y_start = y_start)  if not noDynamics annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = k)  if noDynamics annotation(
    Placement(visible = true, transformation(origin = {-10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain.y, y) annotation(
    Line(points = {{2, -20}, {40, -20}, {40, 0}, {110, 0}, {110, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(firstOrder1.y, y) annotation(
    Line(points = {{2, 20}, {40, 20}, {40, 0}, {110, 0}, {110, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(u, firstOrder1.u) annotation(
    Line(points = {{-120, 0}, {-60, 0}, {-60, 20}, {-22, 20}, {-22, 20}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(u, gain.u) annotation(
    Line(points = {{-120, 0}, {-60, 0}, {-60, -20}, {-22, -20}, {-22, -20}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {12, 28}, extent = {{-44, 34}, {26, -16}}, textString = "k"), Text(origin = {2, -44}, extent = {{-60, 22}, {60, -22}}, textString = "1 + sT"), Line(origin = {4, 0}, points = {{-86, 0}, {86, 0}})}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, initialScale = 0.1), graphics = {Line(origin = {85, -61}, points = {{75, 25}})}),
  Documentation(info = "<html><head></head><body>Low-pass first order filter (no output limitations):<div><br></div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>y<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>&nbsp; &nbsp; &nbsp;k</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- = ----------------</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>u<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>1&nbsp;+ s*T</div><div><br></div><div>Neither output limitation nor anti-windup are implemented.</div><div><br></div><div>The dynamic parts are removed if T=0; in this case the block implements a static gain.</div><div><br></div><div>By default, T is a structural parameter, so it cannot be changed at runtime without recompiling the model. In order to do so, set the noDynamics parameter explicitly to false (note that you can't change T to zero at runtime in this case).</div></body></html>"));
    
end FirstOrder;
