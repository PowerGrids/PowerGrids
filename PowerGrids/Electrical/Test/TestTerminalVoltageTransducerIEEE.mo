within PowerGrids.Electrical.Test;

model TestTerminalVoltageTransducerIEEE
  extends Modelica.Icons.Example;
  PowerGrids.Electrical.VoltageTransducers.TerminalVoltageTransducerIEEE terminalVoltageTransducer(Rc = 1, Xc = 1, Tr = 1, initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.ComplexBlocks.Sources.ComplexConstant V(k.re = -1, k.im = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.Sources.ComplexConstant I(k.re = 1, k.im = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(I.y, terminalVoltageTransducer.It) annotation(
    Line(points = {{-58, -30}, {-48, -30}, {-48, -12}, {-20, -12}, {-20, -12}}, color = {85, 170, 255}));
  connect(V.y, terminalVoltageTransducer.Vt) annotation(
    Line(points = {{-58, 10}, {-20, 10}, {-20, 12}, {-20, 12}}, color = {85, 170, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body><span style=\"font-size: 12px;\">This model demonstrates the correct behaviour of the terminal Voltage Transducer IEEE</span><span style=\"font-size: 12px;\">&nbsp;</span><span style=\"font-size: 12px;\">in a simple case.</span></body></html>"));
end TestTerminalVoltageTransducerIEEE;