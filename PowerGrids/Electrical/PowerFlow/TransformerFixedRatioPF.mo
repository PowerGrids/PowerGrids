within PowerGrids.Electrical.PowerFlow;

model TransformerFixedRatioPF
  extends PowerGrids.Electrical.BaseComponents.TransformerFixedRatioVI(
    redeclare connector TerminalAC_a = Interfaces.TerminalACPF_a,
    redeclare connector TerminalAC_b = Interfaces.TerminalACPF_b);
  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF(
    final isLinear = true,
    SNom = UNomB^2/CM.abs(Complex(R,X)));
end TransformerFixedRatioPF;
