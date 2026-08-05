within PowerGrids.Electrical.Branches;
model TransformerFixedRatioWithBreaker
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioWithBreakerVI(
    rFixed = UNomB/UNomA,
    VNomA = portA.VNom,
    VNomB = portB.VNom,
    INomA = portA.INom,
    INomB = portB.INom,
    vA = portA.v,
    vB = portB.v,
    iA = portA.i,
    iB = portB.i);

  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    final isLinear = true,
    final hasSubPF,
    SNom = UNomB^2/CM.abs(Complex(R,X)),
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
