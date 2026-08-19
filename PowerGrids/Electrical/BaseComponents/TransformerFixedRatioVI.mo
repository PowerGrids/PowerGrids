within PowerGrids.Electrical.BaseComponents;

partial model TransformerFixedRatioVI
  extends Icons.Transformer;
  extends PowerGrids.Electrical.BaseComponents.PiNetworkVI;

  parameter SI.PerUnit rFixed "Fixed transformer ratio VB/VA";
  parameter SI.Angle thetaFixed = 0 "Fixed phase lead of VB w.r.t. VA";

  parameter SI.PerUnit RccPu = 0 "Series resistance on B side in p.u.";
  parameter SI.PerUnit XccPu = 0 "Series reactance on B side in p.u.";
  parameter SI.PerUnit GPu = 0 "Shunt conductance on B side in p.u.";
  parameter SI.PerUnit BPu = 0 "Shunt susceptance on B side in p.u.";

  parameter Types.Impedance ZBaseB "Base impedance at B side";
  parameter Types.Admittance YBaseB "Base impedance at B side";

  final parameter Types.Resistance R = RccPu*ZBaseB "Series resistance on B side";
  final parameter Types.Reactance X = XccPu*ZBaseB "Series reactance on B side";
  final parameter Types.Conductance G = GPu*YBaseB "Shunt conductance on B side";
  final parameter Types.Susceptance B = BPu*YBaseB "Shunt susceptance on B side";

equation
  k = CM.fromPolar(rFixed, thetaFixed);
  Y = Complex(1)/Complex(R, X);
  YA = Complex(0);
  YB = Complex(G, B);

annotation(
    Documentation(info = "<html><head></head><body><p>Transformer with fixed voltage ratio k = rFixed*exp(j*thetaFixed). The series impedance R+jX and shunt admittance G+jB are referred to the high-voltage side B.</p><p>Step-up transformers with fixed voltage ratio can be implemented by only setting <code>rFixed</code> and leaving  <code>thetaFixed</code> to zero default value. Phase shifters can be implemented by only setting  <code>thetaFixed</code> and leaving  <code>rFixed</code> to the default of 1.</p>
<p>Implemented as a child class of <a href=\"modelica://PowerGrids.Electrical.BaseComponents.PiNetworkVI\">PiNetworkVI</a>, where Ya=0, Yb=G+jB and k = rFixed*exp(j*thetaFixed), see the corresponding documentation.</p>
</body></html>"));
end TransformerFixedRatioVI;
