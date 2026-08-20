within PowerGrids.Controls.Test;

model TestFreeOffset
  extends Modelica.Icons.Example;
  PowerGrids.Controls.FreeOffset freeOffset1 annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FreeOffset freeOffset2(use_u = true)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(f = 1)  annotation(
    Placement(visible = true, transformation(origin = {-44, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow)  annotation(
    Placement(transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}})));
initial equation
  freeOffset1.y = 1;
  freeOffset2.y = 2;
equation
  connect(sine.y, freeOffset2.u) annotation(
    Line(points = {{-32, -20}, {-10, -20}, {-10, -20}, {-10, -20}, {-10, -20}}, color = {0, 0, 127}));
annotation(
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    Documentation(info = "<html>
<body>

<p>This is a test for the <a href=\"modelica://PowerGrids.Controls.FreeOffset\">PowerGrids.Controls.FreeOffset</a> model. </p>
<p>
The test contains to <code>FreeOffset</code>  blocks, the first (<code>freeOffset1</code>) has no input, the second (<code>freeOffset2</code>) has a variable input (sinusoid).</p>
<p>Two additional inital equations are written in the model (see in the <i>text view</i>), they fix the <i>offset1</i> to be equal to 1 and the <i>offset2</i> to be equal to 2.</p>

<p>The expected results are:</p>
<ul>
    <li><code>freeOffset1.y = 1</code>, constant during the entire simulation,</li>
    <li><code>freeOffset2.y = sunusoid with mean value equal to 2</code>.</li>
</ul>


</body>
</html>"));
end TestFreeOffset;