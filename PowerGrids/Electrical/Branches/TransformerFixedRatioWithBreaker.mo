within PowerGrids.Electrical.Branches;
model TransformerFixedRatioWithBreaker
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioWithBreakerVI(
    redeclare connector TerminalAC_a = Interfaces.TerminalAC_a,
    redeclare connector TerminalAC_b = Interfaces.TerminalAC_b,
    terminalAC_a(
      computePF = computePF,
      terminalACPF(v = vPF_a, i = iPF_a)),
    terminalAC_b(
      computePF = computePF,
      terminalACPF(v = vPF_b, i = iPF_b)));
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    SNom = UNomB^2/CM.abs(Complex(R,X)),
    final hasSubPF,
    redeclare PowerGrids.Electrical.PowerFlow.TransformerFixedRatioWithBreakerPF componentPF(
      UNomA = UNomA,
      UNomB = UNomB,
      SNom = SNom,
      rFixed = rFixed,
      R = R,
      X = X,
      G = G,
      B = B,
      final useBreaker = false,
      final breakerStatusStart = breakerStatusStart));
end TransformerFixedRatioWithBreaker;
