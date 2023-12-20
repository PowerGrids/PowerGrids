within PowerGrids.Electrical.PowerFlow;

model LineConstantImpedancePF
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceVI(
    redeclare connector TerminalAC_a = Interfaces.TerminalACPF_a,
    redeclare connector TerminalAC_b = Interfaces.TerminalACPF_b);
  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF(
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/CM.abs(Complex(R,X)));
end LineConstantImpedancePF;
