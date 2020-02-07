within PowerGrids.Controls;
model RampTrackingFilter "Ramp tracking filter"
  extends Modelica.Blocks.Interfaces.SISO(y(start = yStart));
  parameter Integer N(min = 0) = 1 "N Order";
  parameter Integer M(min = 0) = 1 "M Order";
  parameter Real k(unit="1")=1 "Gain";
  parameter SI.Time T1 "Lead time constant";
  parameter SI.Time T2 "Lag time constant";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate=true,
      Dialog(group="Initialization"));
  parameter Real yStart=0 "Initial or guess value of output (= state)" annotation (
  Dialog(group="Initialization"));
  PowerGrids.Controls.LeadMOrderLag leadMOrderLagCascade[N](each M = M, each T1 = T1, each T2 = T2, each initType = initType, each k = 1, each yStart = yStart)  annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = k)  annotation(
    Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  assert((N > 0 and M > 0) or N == 0, "If N > 0 then also M must be positive");
  assert((T1 > 0 and T2 > 0) or ((not T1 > 0) and (not T2 > 0)), "Either T1 = T2 = 0 or T1 > 0 and T2 > 0");
equation
  connect(u, gain.u) annotation(
    Line(points = {{-120, 0}, {-76, 0}, {-76, 0}, {-74, 0}}, color = {0, 0, 127}));
  if N == 0 then
    connect(gain.y, y);
  else
    connect(gain.y, leadMOrderLagCascade[1].u) annotation(
    Line(points = {{-50, 0}, {-26, 0}, {-26, 0}, {-24, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
    connect(y, leadMOrderLagCascade[N].y) annotation(
    Line(points = {{110, 0}, {20, 0}, {20, 0}, {22, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
    if N > 1 then
      for i in 1:N-1 loop
        connect(leadMOrderLagCascade[i].y, leadMOrderLagCascade[i+1].u);
      end for;
    end if;
  end if;

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-16, -20}, extent = {{-60, 22}, {78, -36}}, textString = "(1 + sT2)"), Line(origin = {-16.2294, -0.321101}, points = {{-56, 0}, {86, 0}}), Text(origin = {-18, 42}, extent = {{-60, 22}, {78, -34}}, textString = "(1 + sT1)"), Text(origin = {-66, -4}, extent = {{-60, 22}, {12, -12}}, textString = "k"), Text(origin = {100, -26}, extent = {{-60, 22}, {-4, -2}}, textString = "M"), Text(origin = {122, 48}, extent = {{-60, 22}, {-4, -2}}, textString = "N"), Line(origin = {-75.3211, 0.3211}, points = {{5, 60}, {-5, 60}, {-5, -60}, {5, -60}}), Line(origin = {75, -1.3211}, points = {{-5, 61.3211}, {5, 61.3211}, {5, -58.6789}, {-5, -58.6789}})}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, initialScale = 0.1), graphics = {Text(origin = {-75, -23}, extent = {{-15, 7}, {175, -41}}, textString = "leadMOrderLagCascade is an array of cascaded-connected
LeadMOrderLag blocks, see text view"), Line(origin = {-38.5, 0}, points = {{-11.5, 0}, {12.5, 0}, {10.5, 0}}, color = {0, 0, 177}, pattern = LinePattern.Dash), Line(origin = {61.5, 0}, points = {{-39.5, 0}, {40.5, 0}, {36.5, 0}}, color = {0, 0, 158}, pattern = LinePattern.Dash)}),
  Documentation(info = "<html><head></head><body>Model to implement the following transfer function:<div><font face=\"Courier New\"><span class=\"Apple-tab-span\" style=\"font-size: 12px; white-space: pre;\">		</span><span style=\"font-size: 12px;\">&nbsp;_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_</span></font></div><div style=\"font-size: 12px;\"><font face=\"Courier New\"><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|^N</font></div><div style=\"font-size: 12px;\"><div style=\"font-size: medium;\"><div style=\"font-size: 12px;\"><font face=\"Courier New\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>y &nbsp; &nbsp; &nbsp; | &nbsp;(1 +&nbsp;s*T1) &nbsp;|</font></div><div style=\"font-size: 12px;\"><font face=\"Courier New\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>- = k * |--------------|</font></div><div style=\"font-size: 12px;\"><font face=\"Courier New\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>u &nbsp; &nbsp; &nbsp; | (1 + s*T2)^M |</font></div><div style=\"font-size: 12px;\"><font face=\"Courier New\"><span class=\"Apple-tab-span\" style=\"white-space:pre\">		</span>|_ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;_|</font></div><div style=\"font-size: 12px;\"><br></div></div></div><div>If N = 0 then the block implements a static gain, otherwise both M and N must be greater than 0. If T1 = 0 and T2 = 0, the block also implements a static gain.</div><div><br></div><div>Neither output limitation nor anti-windup are implemented.</div></body></html>"));
end RampTrackingFilter;
