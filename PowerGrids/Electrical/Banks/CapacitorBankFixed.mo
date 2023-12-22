within PowerGrids.Electrical.Banks;
model CapacitorBankFixed "Capacitor bank with fixed capacitance"
  extends Icons.CapacitorBank;
  extends PowerGrids.Electrical.BaseComponents.ShuntConductanceVI(
    final isOnePortAC = true,
    redeclare connector TerminalAC = Interfaces.TerminalAC,
    terminalAC(
      computePF = computePF,
      terminalACPF(v = vPF, i = iPF)),
    Y = Complex(0,B));
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare PowerGrids.Electrical.PowerFlow.CapacitorBankFixedPF componentPF(
      SNom = SNom, 
      UNom = UNom,
      B = B));

  parameter Types.Susceptance B = 0 "Capacitor bank susceptance";
end CapacitorBankFixed;
