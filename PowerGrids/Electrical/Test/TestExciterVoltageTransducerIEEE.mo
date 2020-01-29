within PowerGrids.Electrical.Test;

model TestExciterVoltageTransducerIEEE
  extends Modelica.Icons.Example;
  Modelica.ComplexBlocks.Sources.ComplexConstant V(k.re = -1, k.im = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.Sources.ComplexConstant I(k.re = 1, k.im = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.VoltageTransducers.ExciterVoltageTransducerIEEE exciterVoltageTransducerIEEE(ki = 1,kp = sqrt(2), thetap = 0.785398, xl = 1)  annotation(
    Placement(visible = true, transformation(origin = {-3.33067e-15, -4.21885e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(I.y, exciterVoltageTransducerIEEE.It) annotation(
    Line(points = {{-58, -30}, {-40, -30}, {-40, -12}, {-20, -12}, {-20, -12}}, color = {85, 170, 255}));
  connect(V.y, exciterVoltageTransducerIEEE.Vt) annotation(
    Line(points = {{-58, 10}, {-18, 10}, {-18, 12}, {-20, 12}}, color = {85, 170, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model demonstrates the correct implementation of the exciter rectifier regulation characteristic IEEE.</span></body></html>"));
end TestExciterVoltageTransducerIEEE;