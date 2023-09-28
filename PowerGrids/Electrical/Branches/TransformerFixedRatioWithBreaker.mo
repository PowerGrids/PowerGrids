within PowerGrids.Electrical.Branches;
model TransformerFixedRatioWithBreaker
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    SNom = UNomB^2/CM.abs(Complex(R,X)),
    final hasSubPF = false,
    redeclare PowerGrids.Electrical.PowerFlow.TransformerFixedRatioWithBreakerPF componentPF(
      UNomA = UNomA,
      UNomB = UNomB,
      SNom = SNom,
      R = R,
      X = X,
      G = G,
      B = B,
      final useBreaker = false,
      final breakerStatusStart = breakerStatusStart));
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioWithBreakerVI(
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC_b);    
end TransformerFixedRatioWithBreaker;
