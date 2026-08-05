within PowerGrids.Electrical.Branches;

model LineConstantImpedanceWithBreakers "Transmission line with constant impedance and breakers"
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceWithBreakersVI(
    VNomA = portA.VNom,
    VNomB = portB.VNom,
    INomA = portA.INom,
    INomB = portB.INom,
    vA = portA.v,
    vB = portB.v,
    iA = portA.i,
    iB = portB.i);

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
