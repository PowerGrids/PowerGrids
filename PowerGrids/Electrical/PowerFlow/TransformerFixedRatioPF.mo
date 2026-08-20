within PowerGrids.Electrical.PowerFlow;

model TransformerFixedRatioPF
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioVI(
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
end TransformerFixedRatioPF;
