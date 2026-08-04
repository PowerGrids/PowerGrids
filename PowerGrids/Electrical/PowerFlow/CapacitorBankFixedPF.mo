within PowerGrids.Electrical.PowerFlow;

model CapacitorBankFixedPF
  extends Icons.CapacitorBank(PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);

  extends PowerGrids.Electrical.BaseClasses.OnePortACPF(
      final isLinear = true);

  parameter Types.Susceptance B = 0 "Capacitor bank susceptance";
  final parameter Types.ComplexAdmittance Y = Complex(0,B) "Shunt admittance";

equation
  port.i = Y*port.v;

end CapacitorBankFixedPF;
