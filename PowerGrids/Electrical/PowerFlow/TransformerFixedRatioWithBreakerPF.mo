within PowerGrids.Electrical.PowerFlow;

model TransformerFixedRatioWithBreakerPF
  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF(
    SNom = UNomB^2/CM.abs(Complex(R,X)));
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioWithBreakerVI(
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC_b,
    final computePF = false);
end TransformerFixedRatioWithBreakerPF;
