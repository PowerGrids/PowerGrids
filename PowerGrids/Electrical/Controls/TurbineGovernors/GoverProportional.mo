within PowerGrids.Electrical.Controls.TurbineGovernors;

block GoverProportional "Simple proportional governor"
  extends Controls.BaseClasses.BaseControllerFramework;

  parameter SI.PerUnit KGover "Mechanical power sensitivity to frequency";
  parameter SI.PerUnit PMaxPu = 1 "Maximum mechanical power p.u.";
  parameter SI.PerUnit PMinPu = 0 "Minimum mechanical power p.u.";
  parameter SI.PerUnit PPuStart = 1 "Required start value of PPu when fixInitialControlledVariable = true" annotation(
  Dialog(enable = fixInitialControlledVariable));
  parameter SI.PerUnit oversaturationPu = 0.1 "abs(u-usat)/(Vmax-Vmin) in case of saturated initial condition" annotation(
  Dialog(enable = fixInitialControlledVariable));
  final parameter Real delta = (limiter.uMax-limiter.uMin)*oversaturationPu "Actuator saturation margin";

  outer PowerGrids.Electrical.System systemPowerGrids "Reference to system object";

  Modelica.Blocks.Interfaces.RealInput PmRefPu "Reference frequency/load input [pu]" annotation(
    Placement(visible = true, transformation(origin = {-140, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput omegaPu "Frequency [pu]" annotation(
    Placement(visible = true, transformation(origin = {-140, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PMechPu "Mechanical turbine power [pu]" annotation(
    Placement(visible = true, transformation(origin = {130,50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  
  Modelica.Blocks.Math.Feedback errPu annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback deltaOmegaPu annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant omegaRefPu(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain(k = KGover)  annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = PMaxPu, uMin = PMinPu)  annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PPu "Generator Active Power p.u." annotation(
    Placement(visible = true, transformation(origin = {74, 118}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {60, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
initial equation
  /* The following equation could be written as
 
     if fixInitialControlledVariable then
       if limiter.u > limiter.uMax then
         limiter.u = limiter.uMax + delta;
       elseif limiter.u < limiter.uMin then
         limiter.u = limiter.uMin - delta;
       else
         PPu = PPuStart;
      end if;
      
      However, we need to use homotopy with a simplified linear model, to
      avoid the need of explicitly initializing all the internal controller
      variables. This is only possible by writing those equations in implicit form
  */
  if fixInitialControlledVariable then
    0 = homotopy(
      actual = if limiter.u > limiter.uMax then limiter.u - (limiter.uMax + delta)
               else if limiter.u < limiter.uMin then limiter.u - (limiter.uMin - delta)
               else PPu - PPuStart,
      simplified = PPu - PPuStart);
  end if;
equation
  connect(omegaRefPu.y, deltaOmegaPu.u2) annotation(
    Line(points = {{-90, -58}, {-90, -58}, {-90, -38}, {-90, -38}}, color = {0, 0, 127}));
  connect(PmRefPu, errPu.u1) annotation(
    Line(points = {{-140, 50}, {-8, 50}}, color = {0, 0, 127}));
  connect(omegaPu, deltaOmegaPu.u1) annotation(
    Line(points = {{-140, -30}, {-100, -30}, {-100, -30}, {-98, -30}}, color = {0, 0, 127}));
  connect(deltaOmegaPu.y, gain.u) annotation(
    Line(points = {{-80, -30}, {-64, -30}, {-64, -30}, {-62, -30}}, color = {0, 0, 127}));
  connect(gain.y, errPu.u2) annotation(
    Line(points = {{-38, -30}, {0, -30}, {0, 42}, {0, 42}}, color = {0, 0, 127}));
  connect(errPu.y, limiter.u) annotation(
    Line(points = {{10, 50}, {36, 50}, {36, 50}, {38, 50}}, color = {0, 0, 127}));
  connect(limiter.y, PMechPu) annotation(
    Line(points = {{62, 50}, {124, 50}, {124, 50}, {130, 50}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(origin = {-1, -1}, extent = {{-99, 101}, {101, -99}}), Text(origin = {37, -9}, extent = {{-105, 67}, {31, -47}}, textString = "GOV
PROP"), Text(origin = {0, 120}, lineColor = {0, 0, 255}, extent = {{-80, 12}, {80, -12}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><p>The class implements a model of a simple proportional governor with saturation.</p>
<p>If <code>fixInitialControlledVariable = true</code>, an initial equation is added to ensure that the mechanical power output <code>PMechPu</code> is equal to its start value <code>PMechPuStart</code>. In order to fulfill this condition, the initial value of the reference signal should be free, so that the Modelica tool can back-compute it automatically. For this purpose, the <a href=\"modelica://PowerGrids.Controls.FreeOffset\">PowerGrids.Controls.FreeOffset</a> block should be used to generate the reference signal to be connected to the <code>VrefPu</code> input.</p>
<p>In case the condition <code>PMechPu = PMechPuStart</code> cannot be fulfilled without violating the controller saturations, then an alternative initial condition is enforced, which prescribes the saturation block input so as to obtain a certain degree of oversaturation <code>oversaturationPu</code>. This allows to back-compute a unique initial value of the reference signal, which is of course dependent on <code>oversaturationPu</code> and hence somewhat arbitrary.</p>
</body></html>"));
end GoverProportional;
