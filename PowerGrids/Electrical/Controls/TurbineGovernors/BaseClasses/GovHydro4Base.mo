within PowerGrids.Electrical.Controls.TurbineGovernors.BaseClasses;

partial model GovHydro4Base "Base class for Governors of hydraulic turbines"
  parameter Modelica.SIunits.PerUnit db1 = 0 "Intentional dead-band width" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.PerUnit db2 = 0 "Unintentional dead-band width" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.Time Tp = 0.1 "Pilot servo time constant" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.Time Tg = 0.5 "Gate servo time constant" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.Time Tr = 5 "Dashpot time constant" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.PerUnit uo = 0.2 "Max gate opening velocity" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.PerUnit uc = -0.2 "Max gate closing velocity" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.PerUnit gMax = 1 "Maximum gate opening" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.PerUnit gMin = 0 "Minimum gate opening" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.PerUnit rPerm = 0.05 "Permanent droop" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Modelica.SIunits.PerUnit rTemp = 0.3 "Temporary droop" annotation(
    Dialog(group = "Control and Actuators"));
  parameter Real GvPgvTable[:, :] = [0, 0; 1, 1] "Points to define the curve Pgv = f(Gv)" annotation(
    Dialog(group = "Turbine"));
  parameter Modelica.Blocks.Types.Smoothness GvPgvSmoothness = Modelica.Blocks.Types.Smoothness.LinearSegments "Smoothness of curve Pgv = f(Gv)" annotation(
    Dialog(group = "Turbine"));
  parameter Modelica.SIunits.PerUnit at = 1.2 "Turbine gain" annotation(
    Dialog(group = "Turbine"));
  parameter Modelica.SIunits.PerUnit qnl = 0.08 "No-load flow at nominal head" annotation(
    Dialog(group = "Turbine"));
  parameter Modelica.SIunits.Time Tw = 1 "Water inertia time constant" annotation(
    Dialog(group = "Turbine"));
  parameter Modelica.SIunits.PerUnit hDam = 1 "Head available at dam" annotation(
    Dialog(group = "Turbine"));
  parameter Modelica.SIunits.PerUnit dTurb = 0.5 "Turbine damping factor" annotation(
    Dialog(group = "Turbine"));
  parameter Modelica.SIunits.PerUnit qStart "Turbine flow Start value" annotation(
    Dialog(group = "Initialization"));
  Modelica.Blocks.Interfaces.RealInput deltaOmegaPu annotation(
    Placement(visible = true, transformation(origin = {-200, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PrefPu annotation(
    Placement(visible = true, transformation(origin = {-140, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PmPu annotation(
    Placement(visible = true, transformation(origin = {190, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.DiscontinuousDeadBand deadbandDb1(uMax = db1 / 2) annotation(
    Placement(visible = true, transformation(origin = {-158, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 add1(k2 = -1, k3 = -1) annotation(
    Placement(visible = true, transformation(origin = {-116, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FirstOrder lagTp(T = Tp, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = 1) annotation(
    Placement(visible = true, transformation(origin = {-76, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limU(limitsAtInit = true, uMax = uo, uMin = uc) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.IntegratorWithNonWindupLimiter limIntG(initType = Modelica.Blocks.Types.Init.SteadyState, yMax = gMax, yMin = gMin, yStart = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-110, 14}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainRperm(k = rPerm) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  PowerGrids.Controls.DerivativeLag derlagTrRtemp(Td = Tr*rTemp, T1 = Tr, initType = Modelica.Blocks.Types.Init.SteadyState, yStart = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division div1 annotation(
    Placement(visible = true, transformation(origin = {-130, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product square1 annotation(
    Placement(visible = true, transformation(origin = {-90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constHdam(k = hDam) annotation(
    Placement(visible = true, transformation(origin = {-66, -74}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant constQnl(k = qnl) annotation(
    Placement(visible = true, transformation(origin = {16, -74}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Math.Product prod1 annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainAt(k = at) annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3(k1 = -1) annotation(
    Placement(visible = true, transformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add4(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {32, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add5(k1 = -1) annotation(
    Placement(visible = true, transformation(origin = {150, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainDturb(k = dTurb) annotation(
    Placement(visible = true, transformation(origin = {130, -10}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Gain gainTg(k = 1 / Tg) annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gainRtemp(k = rTemp) annotation(
    Placement(visible = true, transformation(origin = {-10, -10}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator intTw(initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1 / Tw, y_start = qStart) annotation(
    Placement(visible = true, transformation(origin = {-16, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.DeadBand deadBandDb2(uMax = db2 / 2) annotation(
    Placement(visible = true, transformation(origin = {80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add5.y, PmPu) annotation(
    Line(points = {{162, -50}, {192, -50}}, color = {0, 0, 127}));
  connect(intTw.y, div1.u2) annotation(
    Line(points = {{-4, -50}, {0, -50}, {0, -92}, {-148, -92}, {-148, -56}, {-142, -56}}, color = {0, 0, 127}));
  connect(deadBandDb2.y, gainRtemp.u) annotation(
    Line(points = {{92, 50}, {100, 50}, {100, -10}, {0, -10}, {0, -10}}, color = {0, 0, 127}));
  connect(deadBandDb2.y, gainRperm.u) annotation(
    Line(points = {{92, 50}, {100, 50}, {100, 20}, {-40, 20}, {-40, 20}}, color = {0, 0, 127}));
  connect(deadBandDb2.y, product1.u2) annotation(
    Line(points = {{92, 50}, {124, 50}, {124, 42}, {124, 42}}, color = {0, 0, 127}));
  connect(limIntG.y, deadBandDb2.u) annotation(
    Line(points = {{52, 50}, {68, 50}, {68, 50}, {68, 50}}, color = {0, 0, 127}));
  connect(derlagTrRtemp.y, add2.u2) annotation(
    Line(points = {{-60, -10}, {-80, -10}, {-80, 8}, {-98, 8}, {-98, 8}}, color = {0, 0, 127}));
  connect(constQnl.y, add4.u2) annotation(
    Line(points = {{16, -62}, {16, -62}, {16, -56}, {20, -56}, {20, -56}}, color = {0, 0, 127}));
  connect(gainDturb.y, add5.u1) annotation(
    Line(points = {{130, -18}, {130, -18}, {130, -44}, {138, -44}, {138, -44}}, color = {0, 0, 127}));
  connect(product1.y, gainDturb.u) annotation(
    Line(points = {{130, 20}, {130, 20}, {130, 0}, {130, 0}}, color = {0, 0, 127}));
  connect(gainRperm.y, add2.u1) annotation(
    Line(points = {{-58, 20}, {-96, 20}, {-96, 20}, {-98, 20}}, color = {0, 0, 127}));
  connect(intTw.y, add4.u1) annotation(
    Line(points = {{-4, -50}, {0, -50}, {0, -44}, {18, -44}, {18, -44}}, color = {0, 0, 127}));
  connect(add4.y, prod1.u2) annotation(
    Line(points = {{42, -50}, {48, -50}, {48, -56}, {58, -56}, {58, -56}}, color = {0, 0, 127}));
  connect(add3.y, intTw.u) annotation(
    Line(points = {{-38, -50}, {-28, -50}, {-28, -50}, {-28, -50}}, color = {0, 0, 127}));
  connect(gainRtemp.y, derlagTrRtemp.u) annotation(
    Line(points = {{-18, -10}, {-38, -10}, {-38, -10}, {-38, -10}}, color = {0, 0, 127}));
  connect(gainTg.y, limU.u) annotation(
    Line(points = {{-32, 50}, {-12, 50}, {-12, 50}, {-12, 50}}, color = {0, 0, 127}));
  connect(lagTp.y, gainTg.u) annotation(
    Line(points = {{-64, 50}, {-50, 50}, {-50, 50}, {-50, 50}}, color = {0, 0, 127}));
  connect(deltaOmegaPu, product1.u1) annotation(
    Line(points = {{-200, 50}, {-176, 50}, {-176, 72}, {136, 72}, {136, 42}, {136, 42}}, color = {0, 0, 127}));
  connect(constHdam.y, add3.u2) annotation(
    Line(points = {{-66, -65}, {-66, -56}, {-62, -56}}, color = {0, 0, 127}));
  connect(deltaOmegaPu, deadbandDb1.u) annotation(
    Line(points = {{-200, 50}, {-170, 50}, {-170, 50}, {-170, 50}}, color = {0, 0, 127}));
  connect(gainAt.y, add5.u2) annotation(
    Line(points = {{118, -50}, {126, -50}, {126, -56}, {138, -56}, {138, -56}}, color = {0, 0, 127}));
  connect(prod1.y, gainAt.u) annotation(
    Line(points = {{82, -50}, {100, -50}, {100, -50}, {100, -50}}, color = {0, 0, 127}));
  connect(square1.y, prod1.u1) annotation(
    Line(points = {{-78, -50}, {-74, -50}, {-74, -32}, {50, -32}, {50, -44}, {58, -44}, {58, -44}}, color = {0, 0, 127}));
  connect(square1.y, add3.u1) annotation(
    Line(points = {{-78, -50}, {-74, -50}, {-74, -44}, {-62, -44}, {-62, -44}}, color = {0, 0, 127}));
  connect(div1.y, square1.u2) annotation(
    Line(points = {{-118, -50}, {-112, -50}, {-112, -56}, {-102, -56}, {-102, -56}}, color = {0, 0, 127}));
  connect(div1.y, square1.u1) annotation(
    Line(points = {{-118, -50}, {-112, -50}, {-112, -44}, {-102, -44}, {-102, -44}}, color = {0, 0, 127}));
  connect(PrefPu, add1.u1) annotation(
    Line(points = {{-140, 100}, {-140, 100}, {-140, 58}, {-128, 58}, {-128, 58}}, color = {0, 0, 127}));
  connect(add2.y, add1.u3) annotation(
    Line(points = {{-122, 14}, {-136, 14}, {-136, 42}, {-128, 42}, {-128, 42}}, color = {0, 0, 127}));
  connect(limU.y, limIntG.u) annotation(
    Line(points = {{12, 50}, {28, 50}, {28, 50}, {28, 50}}, color = {0, 0, 127}));
  connect(add1.y, lagTp.u) annotation(
    Line(points = {{-104, 50}, {-88, 50}, {-88, 50}, {-88, 50}}, color = {0, 0, 127}));
  connect(deadbandDb1.y, add1.u2) annotation(
    Line(points = {{-146, 50}, {-128, 50}, {-128, 50}, {-128, 50}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {30, 24}, extent = {{-88, 14}, {30, -36}}, textString = "Hydro4"), Text(origin = {-3, 122}, lineColor = {0, 0, 255}, extent = {{-49, 12}, {49, -12}}, textString = "%name"), Text(origin = {18, 76}, extent = {{-88, 14}, {54, -44}}, textString = "Governor")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body>This base model implements a control diagram wich can be specialized in governors for hydraulic turbines.<div><br></div><div>The upper part of the&nbsp;diagram&nbsp;implements the frequency primary regulation and the dynamic of the gates servomotor; the lower part completes the turbine model.&nbsp;</div><div><span style=\"line-height: 12px;\"><br></span></div><span style=\"line-height: 12px;\">The gates travel over a range of 1.0 per unit from fully closed to fully opened. The gates are at a position greater than zero at zero power and, normally, less than 1.0 when power is 1.0 pu. Gmax and Gmin are operating limits.</span><br><div><span style=\"line-height: 12px;\"><br></span></div><div><span style=\"line-height: 12px;\">The caracteristic function of the turbine is omitted, because it depends on the turbine type (Pelton-Francis-Kaplan)</span>. Said characteristic shall connect the deadBandDb2 output to the input u1 of the div1 block, and shall be&nbsp;implemented&nbsp;in the specialized class.</div><div>In the specialized class can be also implemented additional inputs, if needed.</div><div><br></div><div><span lang=\"en-US\" style=\"line-height: 12px;\">The </span><span style=\"line-height: 12px;\">caracteristic function&nbsp;describes the relationship of flow through the turbine to stroke of the gate actuating servomotor.&nbsp;</span></div><div><span style=\"line-height: 12px;\"><br></span></div><div><span style=\"line-height: 12px;\">This curve is proportional to turbine power, with the constant of proportionality being a function of available head. This constant must be specified by the turbine gain At.</span></div><div><span style=\"line-height: 12px;\"><br></span></div><div><span style=\"line-height: 12px;\">The typical value of At is&nbsp;slightly greater than unity while the typical range of Qnl &nbsp;is 0 - 0.15.</span></div>
	
	
	


</body></html>"));
end GovHydro4Base;
