within PowerGrids.Electrical.Buses;

model Ground
  extends Icons.Bus;
  extends Icons.Ground;
  PowerGrids.Interfaces.TerminalACBus terminalAC(UStart = 0, UPhaseStart = 0) annotation(
    Placement(visible = true, transformation(origin = {-54, 48}, extent = {{-100, -100}, {100, 100}}, rotation = 0), iconTransformation(origin = {-3.55271e-15, 4.44089e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  terminalAC.v = Complex(0);
end Ground;
