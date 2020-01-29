within PowerGrids.Controls;
model DiscontinuousDeadBand "Discontinuous dead-band"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real uMax(start=1) "Upper limits of dead zones";
  parameter Real uMin=-uMax "Lower limits of dead zones";
  parameter Boolean smoothed = false "Smooth operator is applied" annotation(
    choices(checkBox = true));
 
equation
  assert(uMax >= uMin, "Limits must be consistent");
  if smoothed then
    // The simplified model has no saturation, to make the controller equations linear
    y = homotopy(
      actual = smooth(0, if u < uMin then u elseif u > uMax then u else 0),
      simplified = u);  
  else
    // The simplified model has no saturation, to make the controller equations linear
    y = homotopy(
      actual = if u < uMin then u elseif u > uMax then u else 0,
      simplified = u);  
  end if;
  
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{0, -94}, {0, 94}}, color = {150, 150, 150}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-0.942429, -0.055205}, rotation = -90, points = {{0, -94}, {0, 94}}, color = {150, 150, 150}, arrow = {Arrow.None, Arrow.Filled}), Line(points = {{-80, -80}, {-20, -20}, {-20, 0}, {20, 0}, {20, 20}, {80, 80}}),  Text(origin = {-29, 14}, extent = {{-25, 26}, {17, -18}}, textString = "uMin"), Text(origin = {33, -26}, extent = {{-25, 26}, {17, -18}}, textString = "uMax")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
 Documentation(info = "<html><head></head><body>Model to implement a discontinuous dead-band:<div><br></div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">			</span>^</div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">			</span>| &nbsp; &nbsp;/</div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">			</span>| &nbsp; /</div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">			</span>| &nbsp;|</div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">		</span>-----------------&gt;</div><div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">		</span>&nbsp; &nbsp; &nbsp;| &nbsp;|</div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">		</span>&nbsp; &nbsp; / &nbsp;&nbsp;|</div><div><span class=\"Apple-tab-span\" style=\"white-space: pre;\">		</span>&nbsp; &nbsp;/ &nbsp; &nbsp;|</div></div><div><br></div><div><ul><li>Asymmetric dead-band is allowed,</li><li>If smoothed checkbox is checked than the smooth operator is applied.</li></ul></div><div><br></div><div>During initialization the homotopy operator is applied, the simplified model is y = u.</div></body></html>"));
end DiscontinuousDeadBand;
