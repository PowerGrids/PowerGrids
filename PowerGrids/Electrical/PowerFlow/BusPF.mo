within PowerGrids.Electrical.PowerFlow;

model BusPF
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF(
    final SNom = 1);
  extends Icons.Bus;

equation
  port.i = Complex(0);
end BusPF;
