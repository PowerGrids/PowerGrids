within PowerGrids.Electrical.Branches;
model LineConstantImpedance "Transmission line with constant impedance"
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/CM.abs(Complex(R,X)),
    final hasSubPF = false,
    redeclare PowerGrids.Electrical.PowerFlow.LineConstantImpedancePF componentPF(
      UNom = UNom,
      R = R,
      X = X,
      G = G,
      B = B));
  extends PowerGrids.Electrical.BaseComponents.LineConstantImpedanceVI(
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC_a,
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC_b);  
annotation(
    Documentation(info = "<html>
<p>Transmission line with constant series impedance R+jX and constant shunt admittance G+jB. </p>
<p>Implemented as a child class of <a href=\"modelica://PowerGrids.Electrical.BaseComponents.PiNetworkVI\">PiNetworkVI</a>, where Ya=Yb=(G+jB)/2 and k = 1, see the corresponding documentation.</p>
</html>"));
end LineConstantImpedance;
