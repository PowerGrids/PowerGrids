within PowerGrids.Electrical.PowerFlow;

model LineConstantImpedanceWithBreakersPF
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceWithBreakersVI(
    VNomA = portA.VNom,
    VNomB = portB.VNom,
    INomA = portA.INom,
    INomB = portB.INom,
    vA = portA.v,
    vB = portB.v,
    iA = portA.i,
    iB = portB.i);

  extends PowerGrids.Electrical.BaseClasses.TwoPortACPF(
    final isLinear = true,
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/CM.abs(Complex(R,X)));
end LineConstantImpedanceWithBreakersPF;
