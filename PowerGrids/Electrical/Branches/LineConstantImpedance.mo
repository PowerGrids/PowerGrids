within PowerGrids.Electrical.Branches;
model LineConstantImpedance "Transmission line with constant impedance"
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceVI(
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
    redeclare Electrical.PowerFlow.LineConstantImpedancePF componentPF(
      final UNom = UNom,
      final SNom = SNom,
      final R = R,
      final X = X,
      final G = G,
      final B = B));

  final parameter Types.Impedance Zb = UNom^2/SNom "base impedance";
  final parameter Types.PerUnit Rpu = R/Zb "Series resistance in pu";
  final parameter Types.PerUnit Xpu = X/Zb "Series reactance in pu";
  final parameter Types.PerUnit Gpu = G*Zb "Shunt conductance in pu";
  final parameter Types.PerUnit Bpu = B*Zb "Shunt suscceptance in pu";

annotation(
    Documentation(info = "<html>
<p>Transmission line with constant series impedance R+jX and constant shunt admittance G+jB. </p>
<p>Implemented as a child class of <a href=\"modelica://PowerGrids.Electrical.BaseComponents.PiNetworkVI\">PiNetworkVI</a>, where Ya=Yb=(G+jB)/2 and k = 1, see the corresponding documentation.</p>
</html>"));
end LineConstantImpedance;
