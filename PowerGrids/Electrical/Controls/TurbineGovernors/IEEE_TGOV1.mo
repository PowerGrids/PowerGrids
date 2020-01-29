within PowerGrids.Electrical.Controls.TurbineGovernors;
block IEEE_TGOV1 "Simple Steam Turbine Governor - IEEE type TGOV1"
  extends Controls.BaseClasses.BaseControllerFramework;

  parameter SI.PerUnit VMax = 1 "Maximum gate limit in p.u.";
  parameter SI.PerUnit VMin = 0 "Minimum gate limit in p.u.";
  parameter SI.PerUnit R = 0.05 "Controller Droop";
  parameter SI.PerUnit Dt = 0 "Frictional losses factor";
  parameter SI.Time T1 = 0.5 "Governor time constant";
  parameter SI.Time T2 = 3 "Turbine derivative time constant";
  parameter SI.Time T3 = 10 "Turbine delay time constant";
  parameter SI.PerUnit PMechPuStart = 1 "Required start value of PmechPu when fixInitialControlledVariable = true" annotation(Dialog(enable = fixInitialControlledVariable));
  parameter SI.PerUnit oversaturationPu = 0.1 "abs(u-usat)/(Vmax-Vmin) in case of saturated initial condition" annotation(Dialog(enable = fixInitialControlledVariable));
  final parameter Real delta = (firstOrderLim.yMax - firstOrderLim.yMin)*oversaturationPu "Actuator saturation margin";

  Modelica.Blocks.Interfaces.RealInput RefLPu "Reference frequency/load input [pu]" annotation(
    Placement(visible = true, transformation(origin = {-140, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput omegaPu "Frequency [pu]" annotation(
    Placement(visible = true, transformation(origin = {-140, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PMechPu "Mechanical turbine power [pu]" annotation(
    Placement(visible = true, transformation(origin = {130,50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback errPu annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback deltaOmegaPu annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant omegaRefPu(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gainDt(k = Dt)  annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainDivR(k = 1 / R)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FirstOrderWithNonWindupLimiter firstOrderLim(T = T1, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1, yMax = VMax, yMin = VMin)  annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.LeadLag leadLag(T1 = T2, T2 = T3, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback sumPMechPu annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  /* The following equation could be written as
 
    if fixInitialControlledVariable then
      if firstOrderLim.u > firstOrderLim.yMax then
        firstOrderLim.u = firstOrderLim.yMax + delta;
      elseif firstOrderLim.u < firstOrderLim.yMin then
        firstOrderLim.u = firstOrderLim.yMin - delta;
      else
        PMechPu = PMechPuStart;
      end if;
    end if;
      
      However, we need to use homotopy with a simplified linear model, to
      avoid the need of explicitly initializing all the internal controller
      variables. This is only possible by writing those equations in implicit form
  */
  if fixInitialControlledVariable then
    0 = homotopy(
      actual = if firstOrderLim.u > firstOrderLim.yMax then firstOrderLim.u - (firstOrderLim.yMax + delta)
               else if firstOrderLim.u < firstOrderLim.yMin then firstOrderLim.u - (firstOrderLim.yMin - delta)
               else PMechPu - PMechPuStart,
      simplified = PMechPu - PMechPuStart);
  end if;
equation
  connect(omegaRefPu.y, deltaOmegaPu.u2) annotation(
    Line(points = {{-90, -58}, {-90, -58}, {-90, -38}, {-90, -38}}, color = {0, 0, 127}));
  connect(gainDt.y, sumPMechPu.u2) annotation(
    Line(points = {{22, -30}, {90, -30}, {90, 42}, {90, 42}}, color = {0, 0, 127}));
  connect(deltaOmegaPu.y, gainDt.u) annotation(
    Line(points = {{-80, -30}, {-2, -30}, {-2, -30}, {-2, -30}}, color = {0, 0, 127}));
  connect(deltaOmegaPu.y, errPu.u2) annotation(
    Line(points = {{-80, -30}, {-70, -30}, {-70, 42}, {-70, 42}}, color = {0, 0, 127}));
  connect(sumPMechPu.y, PMechPu) annotation(
    Line(points = {{99, 50}, {121, 50}, {121, 50}, {129, 50}}, color = {0, 0, 127}));
  connect(leadLag.y, sumPMechPu.u1) annotation(
    Line(points = {{61, 50}, {79, 50}, {79, 50}, {81, 50}}, color = {0, 0, 127}));
  connect(firstOrderLim.y, leadLag.u) annotation(
    Line(points = {{21, 50}, {37, 50}, {37, 50}, {37, 50}}, color = {0, 0, 127}));
  connect(gainDivR.y, firstOrderLim.u) annotation(
    Line(points = {{-19, 50}, {-3, 50}, {-3, 50}, {-3, 50}}, color = {0, 0, 127}));
  connect(errPu.y, gainDivR.u) annotation(
    Line(points = {{-61, 50}, {-43, 50}, {-43, 50}, {-43, 50}}, color = {0, 0, 127}));
  connect(RefLPu, errPu.u1) annotation(
    Line(points = {{-140, 50}, {-78, 50}}, color = {0, 0, 127}));
  connect(omegaPu, deltaOmegaPu.u1) annotation(
    Line(points = {{-140, -30}, {-100, -30}, {-100, -30}, {-98, -30}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(origin = {-1, -1}, extent = {{-99, 101}, {101, -99}}), Text(origin = {49, -25}, extent = {{-127, 27}, {33, -49}}, textString = "TGOV1"), Text(origin = {0, 120}, lineColor = {0, 0, 255}, extent = {{-80, 12}, {80, -12}}, textString = "%name"), Text(origin = {-6, 46}, extent = {{-60, 26}, {70, -40}}, textString = "IEEE")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html>
<p>The class implements a model of a simple steam turbine governor according to the IEEE technical report PES-TR1 Jan 2013.</p>
<p>The type implemented is the TGOV1, described in the chapter 2.2 of the same IEEE technical report PES-TR1 Jan 2013.</p>
<p>If <code>fixInitialControlledVariable = true</code>, an initial equation is added to ensure that the mechanical power output <code>PMechPu</code> is equal to its start value <code>PMechPuStart</code>. In order to fulfill this condition, the initial value of the reference signal should be free, so that the Modelica tool can back-compute it automatically. For this purpose, the <a href=\"modelica://PowerGrids.Controls.FreeOffset\">PowerGrids.Controls.FreeOffset</a> block should be used to generate the reference signal to be connected to the <code>VrefPu</code> input.</p>
<p>In case the condition <code>PMechPu = PMechPuStart</code> cannot be fulfilled without violating the controller saturations, then an alternative initial condition is enforced, which prescribes the saturation block input so as to obtain a certain degree of oversaturation <code>oversaturationPu</code>. This allows to back-compute a unique initial value of the reference signal, which is of course dependent on <code>oversaturationPu</code> and hence somewhat arbitrary.</p>
</html>"));
end IEEE_TGOV1;
