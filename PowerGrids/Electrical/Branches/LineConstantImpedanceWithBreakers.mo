within PowerGrids.Electrical.Branches;

model LineConstantImpedanceWithBreakers "Transmission line with constant impedance and breakers"
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/CM.abs(Complex(R,X)),
    final hasSubPF = false,
    redeclare PowerGrids.Electrical.PowerFlow.LineConstantImpedanceWithBreakersPF componentPF(
      UNom = UNom,
      SNom = SNom,
      R = R,
      X = X,
      G = G,
      B = B,
      final useBreakerA = false,
      final useBreakerB = false,
      final breakerAStatusStart = breakerAStatusStart,
      final breakerBStatusStart = breakerBStatusStart));
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceWithBreakersVI(
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC_b);    
end LineConstantImpedanceWithBreakers;
