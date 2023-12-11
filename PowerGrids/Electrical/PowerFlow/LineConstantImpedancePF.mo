within PowerGrids.Electrical.PowerFlow;

model LineConstantImpedancePF
  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF(
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/CM.abs(Complex(R,X)));
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceVI(
    redeclare PowerGrids.Interfaces.TerminalACPF_a terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalACPF_b terminalAC_b);

end LineConstantImpedancePF;
