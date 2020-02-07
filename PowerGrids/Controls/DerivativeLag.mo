within PowerGrids.Controls;
model DerivativeLag "Derivative filter with lag"
  extends Modelica.Blocks.Interfaces.SISO(y(start = yStart));
  parameter SI.Time T1 "Lag time constant";
  parameter SI.Time Td = T1 "Derivative time constant";
  parameter Boolean noDynamics = not(T1 > 0) "Trivial configuration with no dynamics G(s) = 1";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate=true,
      Dialog(group="Initialization"));
  parameter Real yStart=0 "Initial or guess value of output (= state)" annotation (
  Dialog(group="Initialization"));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = if noDynamics then 1 else Td / T1)  annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(
    initType = initType, 
    k = 1 / T1,
    y_start = yStart*Td/T1) if not noDynamics  annotation(
    Placement(visible = true, transformation(origin = {2, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero if noDynamics annotation(
    Placement(visible = true, transformation(origin = {-68, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  assert((T1 > 0 and Td > 0) or ((not T1 > 0) and (not Td > 0)), "Either T1 = T2 = 0 or T1 > 0 and T2 > 0");
equation
  connect(zero.y, feedback.u2) annotation(
    Line(points = {{-56, -40}, {-30, -40}, {-30, -8}, {-30, -8}, {-30, -8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(integrator.y, feedback.u2) annotation(
    Line(points = {{-9, -40}, {-30, -40}, {-30, -8}}, color = {0, 0, 127}));
  connect(feedback.y, integrator.u) annotation(
    Line(points = {{-20, 0}, {30, 0}, {30, -40}, {14, -40}}, color = {0, 0, 127}));
  connect(feedback.y, y) annotation(
    Line(points = {{-20, 0}, {104, 0}, {104, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(gain.y, feedback.u1) annotation(
    Line(points = {{-48, 0}, {-38, 0}, {-38, 0}, {-38, 0}}, color = {0, 0, 127}));
  connect(u, gain.u) annotation(
    Line(points = {{-120, 0}, {-72, 0}, {-72, 0}, {-72, 0}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {4, -36}, extent = {{-60, 22}, {60, -22}}, textString = "1 + sT1"), Line(origin = {-12, 0}, points = {{-64, 0}, {86, 0}}), Text(origin = {8, 34}, extent = {{-60, 22}, {32, -14}}, textString = "sTd")}),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}}, initialScale = 0.1), graphics = {Text(origin = {-92, -63}, extent = {{-2, 5}, {194, -23}}, textString = "The case noDynamics = true is handled via conditional blocks (see text view)
When noDynamics = true the integrator block is not instantiated
and the zero block is instantiated instead")}),
  Documentation(info = "<html><head></head><body>Implements a derivative filter with lag, a.k.a. real differentiator:<div><br></div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>y<span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>s*Td</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>- = -------------</div><div><span class=\"Apple-tab-span\" style=\"white-space:pre\">	</span>u &nbsp; &nbsp; 1 + s*T1</div><div><br></div><div>If Td = T1 &gt; 0, a high-pass or washout filter with cut-off frequency 1/Td is obtained.</div><div><br></div><div>If Td = T1 = 0 a filter with transfer function 1 is obtained.&nbsp;</div><div><br></div><div><span style=\"font-size: 12px;\">By default, T1 and T2 are structural parameters, so they cannot be changed at runtime without recompiling the model. In order to do so, set the noDynamics parameter explicitly to false&nbsp;</span>(note that you can't set T1 &nbsp;and T2 to zero = 0 at runtime in this case)<span style=\"font-size: 12px;\">.</span></div></body></html>"));
end DerivativeLag;
