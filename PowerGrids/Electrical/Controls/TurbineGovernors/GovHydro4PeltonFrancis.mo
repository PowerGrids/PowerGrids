within PowerGrids.Electrical.Controls.TurbineGovernors;

model GovHydro4PeltonFrancis
  extends BaseClasses.GovHydro4Base;
  Modelica.Blocks.Tables.CombiTable1Ds tableGvPgv(smoothness = Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1, table = [0.1, 0; 0.4, 0.42; 0.5, 0.56; 0.7, 0.8; 0.8, 0.9; 0.9, 0.97; 1, 1]) annotation(
    Placement(visible = true, transformation(origin = {-170, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(deadBandDb2.y, tableGvPgv.u) annotation(
    Line(points = {{92, 50}, {100, 50}, {100, -26}, {-190, -26}, {-190, -50}, {-182, -50}, {-182, -50}}, color = {0, 0, 127}));
  connect(div1.u1, tableGvPgv.y[1]) annotation(
    Line(points = {{-142, -44}, {-150, -44}, {-150, -50}, {-158, -50}, {-158, -50}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {0, -39}, extent = {{-62, 17}, {62, -17}}, textString = "Pelton"), Text(origin = {4, -71}, extent = {{-62, 17}, {62, -17}}, textString = "Francis")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body><div><div style=\"font-size: 12px;\"><span style=\"line-height: 12px;\">This class extends the <a href=\"Modelica:///PowerGrids.Electrical.Controls.TurbineGovernors.BaseClasses.GovHydro4Base\">GovHydro4Base</a> base class, implementing</span><span style=\"line-height: 12px;\">&nbsp;a governor which can be used for Pelton and Francis turbines.</span></div><div style=\"font-size: 12px;\"><span style=\"line-height: 12px;\"><br></span></div><div style=\"font-size: 12px;\"><span style=\"line-height: 12px;\">The turbine characteristics is implemented as a linear interpolatipon of a given set of working points, which&nbsp;</span><span style=\"line-height: 12px;\">default values are shown in the following table:</span></div></div><div><div style=\"text-align: center;\"><span style=\"line-height: 12px;\"><br></span></div><span style=\"line-height: 12px;\"><table border=\"1\" cellspacing=\"0\" cellpadding=\"2\" style=\"text-align: center;\">
  <tbody><tr>
    <th>Stroke Position [PU]</th>
    <th>Turbine Flow [PU]</th>
  </tr>
  <tr>
    <td>0.1</td>
    <td>0</td>
  </tr>
  <tr>
    <td>0.4</td>
    <td>0.42</td>
  </tr>
  <tr>
    <td>0.5</td>
    <td>0.56</td>
  </tr>
  <tr>
    <td>0.7</td>
    <td>0.8</td>
  </tr>
  <tr>
    <td>0.8</td>
    <td>0.9</td>
  </tr>
  <tr>
    <td>0.9</td>
    <td>0.97</td>
  </tr>
  <tr>
    <td>1</td>
    <td>1</td>
  </tr>
</tbody></table>  
  
  
  
  
  
  
  
  
  </span></div><div style=\"text-align: center;\"><span style=\"line-height: 12px;\"><br></span></div><div><span lang=\"en-US\" style=\"line-height: 12px;\">The points in the table</span><span style=\"line-height: 12px;\">&nbsp;describe the relationship of flow through the turbine to stroke of the gate actuating servomotor.&nbsp;</span></div><div><span style=\"line-height: 12px;\"><br></span></div><div><span style=\"line-height: 12px;\">The first two data points will be used to extrapolate downward for stroke positions less than minimum in the table, while the last two data points will be used do extrapolate upward for stroke positions over than the maximum in the table.</span></div><div><span style=\"line-height: 12px;\"><br></span></div><div><span style=\"line-height: 12px;\">The curve are smoothed </span><span style=\"font-size: 12px;\">by means of cubic</span><span style=\"font-size: 12px;\">&nbsp;Hermite splines such that the turbine flow preserves the monotonicity and</span><span style=\"font-size: 12px;\">&nbsp;its derivative is continuous, also if extrapolated (</span><span style=\"font-size: 12px;\">Fritsch-Butland interpolation</span><span style=\"font-size: 12px;\">).</span></div><div><span style=\"line-height: 12px;\"><br></span></div><div><span style=\"line-height: 12px;\">The interpolated curve is proportional to turbine power, with the constant of proportionality being a function of available head. This constant must be specified by the turbine gain, At.</span></div><div><span style=\"line-height: 12px;\"><br></span></div><div><span style=\"line-height: 12px;\">The typical value of At is&nbsp;slightly greater than unity while the typical range of Qnl &nbsp;is 0 - 0.15.</span></div></body></html>"));
end GovHydro4PeltonFrancis;
