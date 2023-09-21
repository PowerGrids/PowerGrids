within PowerGrids.Electrical.PowerFlow;

model LineConstantImpedancePF
  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF;
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceVI(
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC_b,
    final computePF = false);

end LineConstantImpedancePF;
