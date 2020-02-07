within PowerGrids.Controls;
model LeadMOrderLag "Lead-lag filter with M poles"
  extends Modelica.Blocks.Interfaces.SISO(y(start = yStart));
  parameter Integer M = 1 "Lag Order";
  parameter Real k(unit="1") = 1 "Gain";
  parameter SI.Time T1 "Lead time constant";
  parameter SI.Time T2 "Lag time constant";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate=true,
      Dialog(group="Initialization"));
  parameter Real yStart=0 "Initial or guess value of output (= state)" annotation (
  Dialog(group="Initialization"));
  LeadLag leadLag(T1 = T1, T2 = T2, initType = initType, k = k, yStart = yStart)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FirstOrder firstOrderCascade[max(0,M-1)](each T = T2, each initType = initType, each k = 1, each y_start = yStart) if M > 1 annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  assert((T1 > 0 and T2 > 0) or ((not T1 > 0) and (not T2 > 0)), "Either T1 = T2 = 0 or T1 > 0 and T2 > 0");
  assert(M > 0, "minimum lag order is 1");
equation
  connect(u, leadLag.u) annotation(
    Line(points = {{-120, 0}, {-62, 0}}, color = {0, 0, 127}));
  
  if M > 1 then
    connect(leadLag.y, firstOrderCascade[1].u);
    connect(firstOrderCascade[M-1].y, y);
  else
    connect(leadLag.y, y);
  end if;  
  
  if M > 2 then
    for i in 1:M-2 loop
      connect(firstOrderCascade[i].y, firstOrderCascade[i+1].u);
    end for;
  end if;

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-2, -24}, extent = {{-60, 22}, {78, -36}}, textString = "(1 + sT2)"), Line(origin = {4, 0}, points = {{-64, 0}, {86, 0}}), Text(origin = {8, 28}, extent = {{-60, 22}, {60, -22}}, textString = "1 + sT1"), Text(origin = {-56, -2}, extent = {{-60, 22}, {12, -12}}, textString = "k"), Text(origin = {114, -28}, extent = {{-60, 22}, {-4, -2}}, textString = "M")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, initialScale = 0.1), graphics = {Text(origin = {-139, -3}, extent = {{31, -19}, {243, -37}}, textString = "firstOrderCascade is an array of cascaded-connected\nFirstOrder blocks, see text view"), Line(origin = {-21, 0}, points = {{-15, 0}, {15, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash), Line(origin = {61, 0}, points = {{-37, 0}, {37, 0}}, color = {0, 0, 127}, pattern = LinePattern.Dash)}),
  Documentation(info = "<html><head></head><body>Model to implement the following transfer function:<div><br></div><div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>y &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 +&nbsp;s*T1</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>- = k * ---------------</div><div style=\"font-size: 12px;\"><span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>u &nbsp; &nbsp; &nbsp; &nbsp;(1 + s*T2)^M</div></div><div><br></div><div>It is required that M &gt; 0. If T1 = 0 and T2 = 0 then the block is a static gain, otherwise it is required that T1 &gt;0, and T2 &gt; 0.</div><div><br></div></body></html>"));
end LeadMOrderLag;
