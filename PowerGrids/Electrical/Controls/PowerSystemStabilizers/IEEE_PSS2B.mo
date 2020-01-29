within PowerGrids.Electrical.Controls.PowerSystemStabilizers;
model IEEE_PSS2B "Power System Stabilizer IEEE type PSS2B"
  parameter SI.PerUnit Vsi1Max = 2 "Input frequency signal max limit in p.u.";
  parameter SI.PerUnit Vsi1Min = -2 "Input frequency signal min limit in p.u.";
  parameter SI.Time Tw1 = 2 "First washout on frequency signal time constant";
  parameter SI.Time Tw2 = 2 "Second washout on frequency signal time constant";
  parameter SI.PerUnit Vsi2Max = 2 "Input power signal max limit in p.u.";
  parameter SI.PerUnit Vsi2Min = -2 "Input power signal min limit in p.u.";
  parameter SI.Time Tw3 = 2 "First washout on power signal time constant";
  parameter SI.Time Tw4 = 2 "Second washout on power signal time constant";
  parameter SI.Time T1 = 0.12  "Lead time constant - leadlag1";
  parameter SI.Time T2 = 0.02 "Lag time constant - leadlag1";
  parameter SI.Time T3 = 0.3 "Lead time constant - leadlag2";
  parameter SI.Time T4 = 0.02 "Lag time constant - leadlag2";
  parameter SI.Time T6 = 0 "Time constant on frequency signal";
  parameter SI.Time T7 = 2 "Time constant on power signal";
  parameter SI.Time T8 = 0.2 "Lead of ramp tracking filter";
  parameter SI.Time T9 = 0.1 "Lag of ramp tracking filter";
  parameter SI.Time T10 = 0 "Lead time constant";
  parameter SI.Time T11 = 0 "Lag time constant";
  parameter SI.PerUnit Ks1 = 12 "Stabilizer gain";
  parameter SI.PerUnit Ks2 = 0.2 "Gain on power signal";
  parameter SI.PerUnit Ks3 = 1 "Gain on power signal before ramp-tracking filter";
  parameter Integer N = 1 "Order of ramp tracking filter";
  parameter Integer M = 5 "Denominator order of ramp tracking filter";
  parameter SI.PerUnit VstMax = 0.1 "Stabilizer output max limit in p.u.";
  parameter SI.PerUnit VstMin = -0.1 "Stabilozer output min limit in p.u.";
  Modelica.Blocks.Interfaces.RealInput Vsi1Pu annotation(
    Placement(visible = true, transformation(origin = {-222, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vsi2Pu annotation(
    Placement(visible = true, transformation(origin = {-200, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-102, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput VstPu annotation(
    Placement(visible = true, transformation(origin = {200, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiterVsi1(limitsAtInit = true, uMax = Vsi1Max, uMin = Vsi1Min)  annotation(
    Placement(visible = true, transformation(origin = {-160, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiterVsi2(limitsAtInit = true, uMax = Vsi2Max, uMin = Vsi2Min)  annotation(
    Placement(visible = true, transformation(origin = {-160, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.DerivativeLag firstWashoutVsi1( T1 = Tw1,Td = Tw1, initType = Modelica.Blocks.Types.Init.SteadyState, yStart = 0)  annotation(
    Placement(visible = true, transformation(origin = {-130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.DerivativeLag secondWashoutVsi1( T1 = Tw2,Td = Tw2, initType = Modelica.Blocks.Types.Init.SteadyState, yStart = 0)  annotation(
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.DerivativeLag firstWashoutVsi2( T1 = Tw3,Td = Tw3, initType = Modelica.Blocks.Types.Init.SteadyState, yStart = 0)  annotation(
    Placement(visible = true, transformation(origin = {-130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.DerivativeLag secondWashoutVsi2( T1 = Tw4,Td = Tw4, initType = Modelica.Blocks.Types.Init.SteadyState, yStart = 0)  annotation(
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.RampTrackingFilter rampTrackingFilter(M = M, N = N, T1 = T8, T2 = T9, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1, yStart = 0)  annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FirstOrder firstOrderVsi1(T = T6, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1, y_start = 0)  annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.LeadLag leadLag1(T1 = T1, T2 = T2, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1, yStart = 0)  annotation(
    Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.LeadLag leadLag2(T1 = T3, T2 = T4, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1, yStart = 0)  annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.LeadLag leadLag3(T1 = T10, T2 = T11, initType = Modelica.Blocks.Types.Init.SteadyState, k = 1, yStart = 0)  annotation(
    Placement(visible = true, transformation(origin = {140, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiterVst(limitsAtInit = true, uMax = VstMax, uMin = VstMin)  annotation(
    Placement(visible = true, transformation(origin = {170, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FirstOrder firstOrderVsi2(T = T7, initType = Modelica.Blocks.Types.Init.SteadyState, k = Ks2, y_start = 0)  annotation(
    Placement(visible = true, transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainKs1(k = Ks1)  annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainKs3(k = Ks3)  annotation(
    Placement(visible = true, transformation(origin = {-56, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback deltaPu annotation(
    Placement(visible = true, transformation(origin = {-190, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant refPu(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-190, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(deltaPu.u2, refPu.y) annotation(
    Line(points = {{-190, 32}, {-190, 32}, {-190, 22}, {-190, 22}}, color = {0, 0, 127}));
  connect(Vsi1Pu, deltaPu.u1) annotation(
    Line(points = {{-222, 40}, {-198, 40}}, color = {0, 0, 127}));
  connect(deltaPu.y, limiterVsi1.u) annotation(
    Line(points = {{-181, 40}, {-172, 40}}, color = {0, 0, 127}));
  connect(limiterVst.y, VstPu) annotation(
    Line(points = {{182, 40}, {192, 40}, {192, 40}, {200, 40}}, color = {0, 0, 127}));
  connect(leadLag3.y, limiterVst.u) annotation(
    Line(points = {{152, 40}, {156, 40}, {156, 40}, {158, 40}}, color = {0, 0, 127}));
  connect(leadLag2.y, leadLag3.u) annotation(
    Line(points = {{122, 40}, {128, 40}, {128, 40}, {128, 40}}, color = {0, 0, 127}));
  connect(leadLag1.y, leadLag2.u) annotation(
    Line(points = {{92, 40}, {96, 40}, {96, 40}, {98, 40}}, color = {0, 0, 127}));
  connect(gainKs1.y, leadLag1.u) annotation(
    Line(points = {{62, 40}, {68, 40}, {68, 40}, {68, 40}}, color = {0, 0, 127}));
  connect(add2.y, gainKs1.u) annotation(
    Line(points = {{32, 40}, {36, 40}, {36, 40}, {38, 40}}, color = {0, 0, 127}));
  connect(rampTrackingFilter.y, add2.u1) annotation(
    Line(points = {{2, 40}, {4, 40}, {4, 46}, {8, 46}, {8, 46}}, color = {0, 0, 127}));
  connect(add1.y, rampTrackingFilter.u) annotation(
    Line(points = {{-28, 40}, {-22, 40}, {-22, 40}, {-22, 40}}, color = {0, 0, 127}));
  connect(firstOrderVsi1.y, add1.u1) annotation(
    Line(points = {{-58, 40}, {-56, 40}, {-56, 46}, {-52, 46}, {-52, 46}}, color = {0, 0, 127}));
  connect(secondWashoutVsi1.y, firstOrderVsi1.u) annotation(
    Line(points = {{-88, 40}, {-82, 40}, {-82, 40}, {-82, 40}}, color = {0, 0, 127}));
  connect(firstWashoutVsi1.y, secondWashoutVsi1.u) annotation(
    Line(points = {{-118, 40}, {-114, 40}, {-114, 40}, {-112, 40}}, color = {0, 0, 127}));
  connect(limiterVsi1.y, firstWashoutVsi1.u) annotation(
    Line(points = {{-148, 40}, {-142, 40}, {-142, 40}, {-142, 40}}, color = {0, 0, 127}));
  connect(gainKs3.y, add1.u2) annotation(
    Line(points = {{-56, 12}, {-56, 12}, {-56, 34}, {-52, 34}, {-52, 34}}, color = {0, 0, 127}));
  connect(firstOrderVsi2.y, add2.u2) annotation(
    Line(points = {{-58, -40}, {4, -40}, {4, 34}, {8, 34}, {8, 34}}, color = {0, 0, 127}));
  connect(firstOrderVsi2.y, gainKs3.u) annotation(
    Line(points = {{-58, -40}, {-56, -40}, {-56, -12}, {-56, -12}}, color = {0, 0, 127}));
  connect(secondWashoutVsi2.y, firstOrderVsi2.u) annotation(
    Line(points = {{-88, -40}, {-82, -40}, {-82, -40}, {-82, -40}}, color = {0, 0, 127}));
  connect(firstWashoutVsi2.y, secondWashoutVsi2.u) annotation(
    Line(points = {{-118, -40}, {-114, -40}, {-114, -40}, {-112, -40}}, color = {0, 0, 127}));
  connect(limiterVsi2.y, firstWashoutVsi2.u) annotation(
    Line(points = {{-148, -40}, {-142, -40}, {-142, -40}, {-142, -40}}, color = {0, 0, 127}));
  connect(Vsi2Pu, limiterVsi2.u) annotation(
    Line(points = {{-200, -40}, {-172, -40}, {-172, -40}, {-172, -40}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 29}, extent = {{-56, 33}, {50, -25}}, textString = "IEEE"), Text(origin = {-8, -41}, extent = {{-56, 33}, {72, -21}}, textString = "PSS2B"), Text(origin = {0, 121}, lineColor = {0, 0, 255}, extent = {{-80, 13}, {80, -13}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>The class implements a model of a Power System Stabilizer according to the&nbsp;<span style=\"font-size: 12px;\">IEEE Std 421.5TM-2005.</span><div><br></div><div><span style=\"font-size: 12px;\">The type implemented is the PSS2B, described in the chapter 8.2 of the same&nbsp;</span><span style=\"font-size: 12px;\">IEEE Std 421.5TM-2005.</span></div><div><br></div><div>Since the PSS has zeros in the origin applied to both inputs, its output at steady-state is always zero. Hence, its initialization at steady state is trivial and corresponds to zero output.<br><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\"><br></span></div></div></body></html>"));
end IEEE_PSS2B;
