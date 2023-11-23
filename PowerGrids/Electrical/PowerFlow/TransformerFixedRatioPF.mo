within PowerGrids.Electrical.PowerFlow;

model TransformerFixedRatioPF
  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF(
    SNom = UNomB^2/CM.abs(Complex(R,X)));
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioVI(
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC_b);
end TransformerFixedRatioPF;
