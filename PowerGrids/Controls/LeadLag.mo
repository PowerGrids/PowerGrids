within PowerGrids.Controls;
model LeadLag "Simple lead-lag filter"
  extends Modelica.Blocks.Interfaces.SISO(y(start = yStart));
  parameter Real k = 1 "Gain";
  parameter SI.Time T1 "Lead time constant";
  parameter SI.Time T2 "Lag time constant";
  parameter Boolean noDynamics = not(T2 > 0) "Trivial configuration with no dynamics G(s) = k";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate=true,
      Dialog(group="Initialization"));
  parameter Real yStart=0 "Initial or guess value of output (= state)" annotation (
  Dialog(group="Initialization"));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = if noDynamics then k else k * T1 / T2)  annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    T = T1,
    initType = initType,k = (T1 - T2) / (k * T1), y_start = yStart * (T1 - T2) / (k * T1)) if not noDynamics  
    annotation(
    Placement(visible = true, transformation(origin = {2, -46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero if noDynamics annotation(
    Placement(visible = true, transformation(origin = {-70, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  assert((T1 > 0 and T2 > 0) or ((not T1 > 0) and (not T2 > 0)), "Either T1 = T2 = 0 or T1 > 0 and T2 > 0");
equation
  connect(zero.y, feedback.u2) annotation(
    Line(points = {{-58, -46}, {-40, -46}, {-40, -8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(firstOrder.y, feedback.u2) annotation(
    Line(points = {{-8, -46}, {-40, -46}, {-40, -8}}, color = {0, 0, 127}));
  connect(u, feedback.u1) annotation(
    Line(points = {{-120, 0}, {-48, 0}}, color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation(
    Line(points = {{-31, 0}, {-10, 0}}, color = {0, 0, 127}));
  connect(gain.y, firstOrder.u) annotation(
    Line(points = {{14, 0}, {60, 0}, {60, -46}, {14, -46}, {14, -46}, {14, -46}}, color = {0, 0, 127}));
  connect(gain.y, y) annotation(
    Line(points = {{14, 0}, {102, 0}, {102, 0}, {110, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {14, -36}, extent = {{-60, 22}, {60, -22}}, textString = "1 + sT2"), Line(origin = {4, 0}, points = {{-64, 0}, {86, 0}}), Text(origin = {12, 32}, extent = {{-60, 22}, {60, -22}}, textString = "1 + sT1"), Text(origin = {-56, -4}, extent = {{-60, 22}, {12, -12}}, textString = "k")}),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}}, initialScale = 0.1), graphics = {Text(origin = {-78, -82}, extent = {{-18, 14}, {186, -10}}, textString = "The case noDynamics = true is handled via conditional blocks (see text view)\nWhen noDynamics = true the firstOrder block is not instantiated\nand the zero block is instantiated instead")}),
  Documentation(info = "<html><head></head><body>Lead-lag filter (no output limitations):<div><br></div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>y<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>&nbsp; &nbsp;&nbsp;1 + s*T1</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- = k * ----------------</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>u<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>&nbsp; &nbsp;&nbsp;1 + s*T2</div><div><br></div><div>Neither output limitation nor anti-windup are implemented.</div><div><br></div><div>The dynamic parts are removed if T1=0 and T2=0. Otherwise, both T1 and T2 need to be positive.</div><div><br></div><div>By default, T1 and T2 are structural parameters, so they cannot be changed at runtime without recompiling the model. In order to do so, set the noDynamics parameter explicitly to false (note that you can't change T1 and T2 to zero at runtime in this case).</div></body></html>"));
end LeadLag;
