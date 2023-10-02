within PowerGrids.Controls;

model LimiterInitNoLimits
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real uMax "Upper limits of input signals";
  parameter Real uMin "Lower limits of input signals";

initial equation
  assert(uMax >= uMin, "Limits must be consistent: uMax = " + String(uMax) + "; uMin = " + String(uMin));

equation
  if initial() then
    y = u;
    assert(u <= uMax, "u > uMax during initialiation phase", level = AssertionLevel.warning);
    assert(u >= uMin, "u < uMin during initialiation phase", level = AssertionLevel.warning);

  else
    y = smooth(0, if u > uMax then uMax else (if u < uMin then uMin else u));
  end if;
  
  annotation(
    Documentation(info = "<html>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the specified upper and lower
limits. If this is not the case, the corresponding limits are passed
as output.
</p>
During the initialization phase the limits are removed so the input is passed to the output without limitations.
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{0, -90}, {0, 68}}, color = {192, 192, 192}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{0, 90}, {-8, 68}, {8, 68}, {0, 90}}), Line(points = {{-90, 0}, {68, 0}}, color = {192, 192, 192}), Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, 0}, {68, -8}, {68, 8}, {90, 0}}), Line(points = {{-50, -70}, {-50, -70}, {50, 70}, {50, 70}}), Text(extent = {{-150, -150}, {150, -110}}, textString = "uMax=%uMax"), Line(origin = {-69.96, -70.19}, points = {{-20, 0}, {20, 0}, {20, 0}}, color = {255, 0, 0}, thickness = 0.3), Line(origin = {69.69, 70.08}, points = {{-20, 0}, {20, 0}, {20, 0}}, color = {255, 0, 0}, thickness = 0.3)}));
end LimiterInitNoLimits;
