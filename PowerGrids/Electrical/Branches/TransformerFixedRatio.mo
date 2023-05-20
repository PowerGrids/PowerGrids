within PowerGrids.Electrical.Branches;
model TransformerFixedRatio "Transformer with fixed voltage ratio"
  extends BaseClasses.PiNetwork;
  extends Icons.Transformer;

  parameter SI.PerUnit rFixed = 1 "Fixed transformer ratio VB/VA";
  parameter SI.Angle thetaFixed = 0 "Fixed phase lead of VB w.r.t. VA";
  parameter Types.Resistance R = 0 "Series resistance on B side";
  parameter Types.Reactance X = 0 "Series reactance on B side";
  parameter Types.Conductance G = 0 "Shunt conductance on B side";
  parameter Types.Susceptance B = 0 "Shunt susceptance on B side";

   parameter Boolean showPFdata=false "=true, if PowerFlow data are to be shown";

equation
  k = CM.fromPolar(rFixed, thetaFixed);
  Y = Complex(1)/Complex(R, X);
  YA = Complex(0);
  YB = Complex(G, B);
annotation (
    Documentation(info = "<html><head></head><body><p>Transformer with fixed voltage ratio k = rFixed*exp(j*thetaFixed). The series impedance R+jX and shunt admittance G+jB are referred to the high-voltage side B.</p><p>Step-up transformers with fixed voltage ratio can be implemented by only setting <code>rFixed</code> and leaving  <code>thetaFixed</code> to zero default value. Phase shifters can be implemented by only setting  <code>thetaFixed</code> and leaving  <code>rFixed</code> to the default of 1.</p>
<p>Implemented as a child class of <a href=\"modelica://PowerGrids.Electrical.Branches.BaseClasses.PiNetwork\">PiNetwork</a>, where Ya=0, Yb=G+jB and k = rFixed*exp(j*thetaFixed), see the corresponding documentation.</p>
</body></html>"), Icon(graphics={
        Text(
          visible=showPFdata,
          extent={{-162,82},{-52,46}},
          lineColor={238,46,47},
          textString=DynamicSelect("P", String(portA.PPu, significantDigits=3))),
        Text(
          visible=showPFdata,
          extent={{-174,46},{-36,12}},
          lineColor={217,67,180},
          textString=DynamicSelect("Q", String(portA.QPu, significantDigits=3))),
        Text(
          visible=showPFdata,
          extent={{-174,-20},{-36,-54}},
          lineColor={28,108,200},
          textString=DynamicSelect("V", String(portA.VPu, significantDigits=3))),
        Text(
          visible=showPFdata,
          extent={{52,84},{162,48}},
          lineColor={238,46,47},
          textString=DynamicSelect("P", String(portB.PPu, significantDigits=3))),
        Text(
          visible=showPFdata,
          extent={{36,46},{174,12}},
          lineColor={217,67,180},
          textString=DynamicSelect("Q", String(portB.QPu, significantDigits=3))),
        Text(
          visible=showPFdata,
          extent={{38,-18},{174,-52}},
          lineColor={28,108,200},
          textString=DynamicSelect("V", String(portB.VPu, significantDigits=3)))}));
end TransformerFixedRatio;
