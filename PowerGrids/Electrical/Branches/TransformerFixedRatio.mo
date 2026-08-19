within PowerGrids.Electrical.Branches;

model TransformerFixedRatio "Transformer with fixed voltage ratio" 
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
      RccPu = RccPu,
      XccPu = XccPu,
      GPu = GPu,
      BPu = BPu));
end TransformerFixedRatio;
