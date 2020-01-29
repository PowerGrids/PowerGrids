within PowerGrids.Electrical.Controls.TurbineGovernors;
model GovHydro4GeneralPurpose "Simple general-purpose governor for hydraulic turbines"
  extends BaseClasses.GovHydro4Base;
equation
  connect(deadBandDb2.y, div1.u1) annotation(
    Line(points = {{92, 50}, {100, 50}, {100, -26}, {-148, -26}, {-148, -44}, {-142, -44}, {-142, -44}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {2, -56}, extent = {{-62, 22}, {62, -22}}, textString = "General")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><div><div style=\"font-size: 12px;\"><span style=\"line-height: 12px;\">This class extends the <a href=\"Modelica:///PowerGrids.Electrical.Controls.TurbineGovernors.BaseClasses.GovHydro4Base\">GovHydro4Base</a> base class, implementing</span><span style=\"line-height: 12px;\">&nbsp;a general-purpose governor which can be used&nbsp;</span><span style=\"line-height: 12px;\">for hydraulic turbines.</span></div></div><div><span style=\"line-height: 12px;\"><br></span></div><div><span style=\"line-height: 12px;\">The turbine characteristic</span><span style=\"line-height: 12px;\">&nbsp;is linear, with slope = 1.&nbsp;</span></div><div><p class=\"western\" style=\"margin-bottom: 2.82mm; line-height: 12px;\"><span lang=\"en-US\">Said characteristic</span>&nbsp;describes the relationship of flow through the turbine to stroke of the gate actuating servomotor.&nbsp;</p><p class=\"western\" style=\"margin-bottom: 2.82mm; line-height: 12px;\">This curve is proportional to turbine power, with the constant of proportionality being a function of available head. This constant must be specified by the turbine gain At.</p><p class=\"western\" style=\"margin-bottom: 2.82mm; line-height: 12px;\">The typical value of At is&nbsp;slightly greater than unity while the typical range of Qnl &nbsp;is 0 - 0.15.</p></div></body></html>"));
end GovHydro4GeneralPurpose;
