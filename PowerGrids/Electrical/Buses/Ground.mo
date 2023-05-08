within PowerGrids.Electrical.Buses;

model Ground
  extends Icons.Ground;
  PowerGrids.Interfaces.PowerTerminalAC powerTerminal annotation(
    Placement(visible = true, transformation(origin = {-54, 48}, extent = {{-100, -100}, {100, 100}}, rotation = 0), iconTransformation(origin = {-3.55271e-15, 4.44089e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  powerTerminal.v = Complex(0);
end Ground;
