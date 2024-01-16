within PowerGrids.Electrical.PowerFlow;

model BusPF
  extends Icons.Bus(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase);
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF(
    final SNom = 1);

equation
  port.i = Complex(0);
end BusPF;
