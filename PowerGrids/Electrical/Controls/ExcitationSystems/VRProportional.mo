within PowerGrids.Electrical.Controls.ExcitationSystems;
block VRProportional
  parameter SI.PerUnit Ka(min = 0) "Overall equivalent gain";
  parameter SI.PerUnit VrMax "Output voltage max limit in p.u.";
  parameter SI.PerUnit VrMin "Output voltage min limit in p.u.";
  parameter Types.Time LagMax = 0 "Time lag before taking action when u going above uMax";
  parameter Types.Time LagMin = 0 "Time lag before taking action when u going below uMin";
  parameter PowerGrids.Controls.LimiterWithLag.State stateStart = PowerGrids.Controls.LimiterWithLag.State.notSat "Saturation initial state" annotation(
  Dialog(tab = "Initialization"));

  Modelica.Blocks.Interfaces.RealInput VcPu "Machine terminal voltage p.u." annotation(
    Placement(visible = true, transformation(origin = {-140, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput VrefPu "Voltage reference p.u." annotation(
    Placement(visible = true, transformation(origin = {-140, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-98, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput efdPu "Exciter output voltage p.u." annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback Verr annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Controls.LimiterWithLag limiterWithLag(LagMax = LagMax, LagMin = LagMin, stateStart = stateStart,uMax = VrMax, uMin = VrMin)  annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = Ka)  annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(VrefPu, Verr.u1) annotation(
    Line(points = {{-140, -30}, {-100, -30}, {-100, -30}, {-98, -30}}, color = {0, 0, 127}));
  connect(VcPu, Verr.u2) annotation(
    Line(points = {{-140, 0}, {-90, 0}, {-90, -22}, {-90, -22}}, color = {0, 0, 127}));
  connect(limiterWithLag.y, efdPu) annotation(
    Line(points = {{11, -30}, {70, -30}}, color = {0, 0, 127}));
  connect(Verr.y, gain.u) annotation(
    Line(points = {{-80, -30}, {-62, -30}, {-62, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(gain.y, limiterWithLag.u) annotation(
    Line(points = {{-38, -30}, {-12, -30}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(origin = {0, 1}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 99}, {100, -101}}), Text(origin = {24, 4}, extent = {{-94, 70}, {56, -72}}, textString = "VR
PROP"), Text(origin = {0, 120}, textColor = {0, 0, 255}, extent = {{-80, 14}, {80, -14}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><p>The class implements a simple model of a proportional static exictation with limiter.</p><p><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The Limiter enforces saturations only after they were violated without interruption during a certain amount of time.</span>&nbsp;</p>
</body></html>"));
end VRProportional;