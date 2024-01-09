within PowerGrids.Electrical.Branches;

model TransformerFixedRatio "Transformer with fixed voltage ratio" 
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioVI(
    final isTwoPortAC = true,
    redeclare connector TerminalAC_a = Interfaces.TerminalAC_a,
    redeclare connector TerminalAC_b = Interfaces.TerminalAC_b,
    terminalAC_a(
      final computePF = computePF,
      terminalACPF(final v = vPF_a, final i = iPF_a)),
    terminalAC_b(
      final computePF = computePF,
      terminalACPF(final v = vPF_b, final i = iPF_b)));
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    final isLinear = true,
    final hasSubPF,
    SNom = UNomB^2/CM.abs(Complex(R,X)),
    redeclare PowerGrids.Electrical.PowerFlow.TransformerFixedRatioPF componentPF(
      UNomA = UNomA,
      UNomB = UNomB,
      SNom = SNom,
      rFixed = rFixed,
      thetaFixed = thetaFixed,
      R = R,
      X = X,
      G = G,
      B = B));
end TransformerFixedRatio;
