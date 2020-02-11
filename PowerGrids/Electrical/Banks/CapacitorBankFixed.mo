within PowerGrids.Electrical.Banks;
model CapacitorBankFixed "Capacitor bank with fixed capacitance"
  extends Icons.CapacitorBank;
  extends BaseClasses.ShuntConductance(Y = Complex(0,B));
  parameter Types.Susceptance B = 0 "Capacitor bank susceptance";
end CapacitorBankFixed;
