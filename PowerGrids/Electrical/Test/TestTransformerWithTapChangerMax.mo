within PowerGrids.Electrical.Test;

model TestTransformerWithTapChangerMax
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.Buses.InfiniteBusVariableVoltage infiniteBus(R = 0, SNom = 1e+06, UNom = 1000, X = 0, portVariablesPu = true, useUIn = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax trafo(B = 0, G = 0, K = {1, 2, 3, 4, 5}, Ntap = 5, R = 1, SNom = 1e+06, UMax = 4500, UNomA = 1000, UNomB = 1000, UStop = 2600, X = 1, actionSel = PowerGrids.Electrical.Branches.TransformerWithTapChangerInterval.ActionType.direct, portVariablesPu = true, t1st = 1, tNext = 2, tapStart = 5) annotation(
    Placement(visible = true, transformation(origin = {2.66454e-15, 1.55431e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus busLoad(R = 1000, SNom = 1e+06, UNom = 1000, X = 0, portVariablesPu = true, theta = 0) annotation(
    Placement(visible = true, transformation(origin = {30, 1.33227e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression Uset(y = 500 * (sin(6.28 * time / 40) + 1)) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Uset.y, infiniteBus.UIn) annotation(
    Line(points = {{-39, 30}, {-26, 30}, {-26, 10}}, color = {0, 0, 127}));
  connect(trafo.terminalB, busLoad.terminal) annotation(
    Line(points = {{10, 0}, {30, 0}}));
  connect(infiniteBus.terminal, trafo.terminalA) annotation(
    Line(points = {{-30, 0}, {-10, 0}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-06, Interval = 0.16),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", emit_protected = "()"),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model demonstrates the correct behaviour of a transformer with a tap-changer logic of type MAX.</span><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">The test circuit is composed by a transformer whth a simple linear load. The transformer is supplied by an ideal infinte bus with variable voltage.&nbsp;</span><span style=\"font-size: 12px;\">The linear load is obtained using a real bus with fixed voltage, the internal impedance of the bus is used as linear load.</span></div><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">The voltage applied at the transformer primary input has sinusoidal shape, the tap-changer logic follows the shape of said voltage.&nbsp;</span><span style=\"font-size: 12px;\">The tap position starts to decrease when the monitored voltage portB.U becomes higher than UMax threshold, and stops when said monitored voltage reaches and stays under the UStop threshold.</span></div><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">Values of voltages and and transformer ratio for each tap position are not realistic, they are just to show the tap changer logic behaviour.</span></div><div><span style=\"font-size: 12px;\"><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Branches/TestTransformerTapChangerMaxTransient.png\">
</figure>
</span></div>
<div><span style=\"font-size: 12px;\"><figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Branches/TestTransformerTapChangerMaxTransientTap.png\">
</figure>
</span></div><div><span style=\"font-size: 12px;\"><br></span></div><div><br></div></body></html>"));
end TestTransformerWithTapChangerMax;
