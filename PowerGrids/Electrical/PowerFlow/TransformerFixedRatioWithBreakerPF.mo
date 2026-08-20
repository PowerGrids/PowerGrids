within PowerGrids.Electrical.PowerFlow;

model TransformerFixedRatioWithBreakerPF
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioWithBreakerVI(
    rFixed = UNomB/UNomA,
    VNomA = portA.VNom,
    VNomB = portB.VNom,
    INomA = portA.INom,
    INomB = portB.INom,
    vA = portA.v,
    vB = portB.v,
    iA = portA.i,
    iB = portB.i,
    final ZBaseB = portB.ZBase,
    final YBaseB = portB.YBase);

  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF(
    final isLinear = true,
    SNom = UNomB^2/CM.abs(Complex(R,X)));
end TransformerFixedRatioWithBreakerPF;
