within PowerGrids.Electrical.Branches;

model TransformerFixedRatio "Transformer with fixed voltage ratio" 
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    SNom = UNomB^2/CM.abs(Complex(R,X)),
    final hasSubPF = false,
    redeclare PowerGrids.Electrical.PowerFlow.TransformerFixedRatioPF componentPF(
      UNomA = UNomA,
      UNomB = UNomB,
      rFixed = rFixed,
      thetaFixed = thetaFixed,
      R = R,
      X = X,
      G = G,
      B = B));
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioVI(
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC_b);    
end TransformerFixedRatio;
