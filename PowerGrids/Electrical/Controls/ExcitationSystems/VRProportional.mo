within PowerGrids.Electrical.Controls.ExcitationSystems;
block VRProportional
  extends Controls.BaseClasses.BaseControllerFramework;

  parameter SI.PerUnit Ka(min = 0) "Overall equivalent gain";
  parameter SI.PerUnit VrMax "Output voltage max limit in p.u.";
  parameter SI.PerUnit VrMin "Output voltage min limit in p.u.";
  parameter Types.Time LagMax = 0 "Time lag before taking action when u going above uMax";
  parameter Types.Time LagMin = 0 "Time lag before taking action when u going below uMin";
  parameter PowerGrids.Controls.LimiterWithLag.State stateStart = PowerGrids.Controls.LimiterWithLag.State.notSat "Saturation initial state" annotation(
  Dialog(tab = "Initialization"));
  parameter SI.PerUnit VcPuStart = 1 "Required start value of VcPu when fixInitialControlledVariable = true" annotation(
  Dialog(enable = fixInitialControlledVariable));
  parameter SI.PerUnit oversaturationPu = 0.1 "abs(u-usat)/(Vmax-Vmin) in case of saturated initial condition" annotation(
  Dialog(enable = fixInitialControlledVariable));
  final parameter Real delta = (limiterWithLag.uMax-limiterWithLag.uMin)*oversaturationPu "Actuator saturation margin";

  outer PowerGrids.Electrical.System systemPowerGrids "Reference to system object";

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
initial equation
  /* The following equation could be written as
 
     if fixInitialControlledVariable then
       if limiterWithLag.u > limiterWithLag.uMax then
         limiterWithLag.u = limiterWithLag.uMax + delta;
       elseif limiterWithLag.u < limiterWithLag.uMin then
         limiterWithLag.u = limiterWithLag.uMin - delta;
       else
         VcPu = VcPuStart;
       end if;
     end if;
      
     However, we need to use homotopy with a simplified linear model, to
     avoid the need of explicitly initializing all the internal controller
     variables. This is only possible by writing those equations in implicit form
  */
  if fixInitialControlledVariable then
    0 = homotopy(
      actual = if limiterWithLag.u > limiterWithLag.uMax then limiterWithLag.u - (limiterWithLag.uMax + delta)
               else if limiterWithLag.u < limiterWithLag.uMin then limiterWithLag.u - (limiterWithLag.uMin - delta)
               else VcPu - VcPuStart,
      simplified = VcPu - VcPuStart);
  end if;
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
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(origin = {0, 1}, extent = {{-100, 99}, {100, -101}}), Text(origin = {24, 4}, extent = {{-94, 70}, {56, -72}}, textString = "VR
PROP"), Text(origin = {0, 120}, lineColor = {0, 0, 255}, extent = {{-80, 14}, {80, -14}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><p>The class implements a simple model of a proportional static exictation with limiter.</p><p><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The Limiter enforces saturations only after they were violated without interruption during a certain amount of time.</span>&nbsp;</p>
<p>If <code>fixInitialControlledVariable = true</code>, an initial equation is added to ensure that the machine voltage <code>VcPu</code> is equal to its start value <code>VcPuStart</code>. In order to fulfill this condition, the initial value of the reference signal should be free, so that the Modelica tool can back-compute it automatically. For this purpose, the <a href=\"modelica://PowerGrids.Controls.FreeOffset\">PowerGrids.Controls.FreeOffset</a> block should be used to generate the reference signal to be connected to the <code>VrefPu</code> input.</p>
<p>In case the condition <code>VcPu = VcPuStart</code> cannot be fulfilled without violating the controller saturations, then an alternative initial condition is enforced, which prescribes the saturation block input so as to obtain a certain degree of oversaturation <code>oversaturationPu</code>. This allows to back-compute a unique initial value of the reference signal, which is of course dependent on <code>oversaturationPu</code> and hence somewhat arbitrary.</p>
</body></html>"));
end VRProportional;
