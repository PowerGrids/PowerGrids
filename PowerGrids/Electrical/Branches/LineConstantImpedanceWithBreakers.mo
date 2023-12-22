within PowerGrids.Electrical.Branches;

model LineConstantImpedanceWithBreakers "Transmission line with constant impedance and breakers"
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceWithBreakersVI(
    final isTwoPortAC = true,
    redeclare connector TerminalAC_a = Interfaces.TerminalAC_a,
    redeclare connector TerminalAC_b = Interfaces.TerminalAC_b,
    terminalAC_a(
      computePF = computePF,
      terminalACPF(v = vPF_a, i = iPF_a)),
    terminalAC_b(
      computePF = computePF,
      terminalACPF(v = vPF_b, i = iPF_b)));
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    final isLinear = true,
    final hasSubPF,
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/CM.abs(Complex(R,X)),
    redeclare PowerGrids.Electrical.PowerFlow.LineConstantImpedanceWithBreakersPF componentPF(
      UNom = UNom,
      SNom = SNom,
      R = R,
      X = X,
      G = G,
      B = B,
      final useBreakerA = false,
      final useBreakerB = false,
      final breakerAStatusStart = breakerAStatusStart,
      final breakerBStatusStart = breakerBStatusStart));
end LineConstantImpedanceWithBreakers;
