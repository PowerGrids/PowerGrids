within PowerGrids.Electrical.PowerFlow;

model TransformerFixedRatioWithBreakerPF
  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF(
    SNom = UNomB^2/CM.abs(Complex(R,X)));
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioWithBreakerVI(
    redeclare PowerGrids.Interfaces.TerminalACPF_a terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalACPF_b terminalAC_b);
end TransformerFixedRatioWithBreakerPF;
