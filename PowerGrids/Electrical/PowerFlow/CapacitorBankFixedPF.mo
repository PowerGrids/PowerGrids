within PowerGrids.Electrical.PowerFlow;

model CapacitorBankFixedPF
  extends Icons.CapacitorBank;
  extends PowerGrids.Electrical.BaseComponents.ShuntConductanceVI(
    redeclare connector TerminalAC = Interfaces.TerminalACPF,
    final Y = Complex(0,B));
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF(
      final isLinear = true);
  parameter Types.Susceptance B = 0 "Capacitor bank susceptance";
end CapacitorBankFixedPF;
