within PowerGrids.Electrical.PowerFlow;

model CapacitorBankFixedPF
  extends Icons.CapacitorBank;
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF;
  extends PowerGrids.Electrical.BaseComponents.ShuntConductanceVI(
    Y = Complex(0,B),
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC,
    final computePF = false);
  parameter Types.Susceptance B = 0 "Capacitor bank susceptance";
end CapacitorBankFixedPF;
