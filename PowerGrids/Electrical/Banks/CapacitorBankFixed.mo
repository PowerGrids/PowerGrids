within PowerGrids.Electrical.Banks;
model CapacitorBankFixed "Capacitor bank with fixed capacitance"
  extends Icons.CapacitorBank;
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final hasSubPF = false,
    redeclare PowerGrids.Electrical.PowerFlow.CapacitorBankFixedPF componentPF(
      SNom = SNom, 
      UNom = UNom,
      B = B));
  extends PowerGrids.Electrical.BaseComponents.ShuntConductanceVI(Y = Complex(0,B));
  parameter Types.Susceptance B = 0 "Capacitor bank susceptance";
end CapacitorBankFixed;
