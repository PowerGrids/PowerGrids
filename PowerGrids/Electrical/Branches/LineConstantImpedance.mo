within PowerGrids.Electrical.Branches;
model LineConstantImpedance "Transmission line with constant impedance"
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceVI(
    redeclare connector TerminalAC_a = Interfaces.TerminalAC_a,
    redeclare connector TerminalAC_b = Interfaces.TerminalAC_b,
    terminalAC_a(
      computePF = computePF,
      terminalACPF(v = vPF_a, i = iPF_a)),
    terminalAC_b(
      computePF = computePF,
      terminalACPF(v = vPF_b, i = iPF_b)));
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/CM.abs(Complex(R,X)),
    final hasSubPF,
    redeclare Electrical.PowerFlow.LineConstantImpedancePF componentPF(
      final UNom = UNom,
      final SNom = SNom,
      final R = R,
      final X = X,
      final G = G,
      final B = B));
annotation(
    Documentation(info = "<html>
<p>Transmission line with constant series impedance R+jX and constant shunt admittance G+jB. </p>
<p>Implemented as a child class of <a href=\"modelica://PowerGrids.Electrical.BaseComponents.PiNetworkVI\">PiNetworkVI</a>, where Ya=Yb=(G+jB)/2 and k = 1, see the corresponding documentation.</p>
</html>"));
end LineConstantImpedance;
