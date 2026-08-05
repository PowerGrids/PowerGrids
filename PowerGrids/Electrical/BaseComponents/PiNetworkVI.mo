within PowerGrids.Electrical.BaseComponents;

partial model PiNetworkVI "Generic Pi-Network base VI model"
  // Nominal parameters
  parameter Types.Voltage VNomA "Nominal phase-to-ground voltage - port A";
  parameter Types.Current INomA "Nominal current - port A";
  parameter Types.Voltage VNomB "Nominal phase-to-ground voltage - port B";
  parameter Types.Current INomB "Nominal current - port B";

  // Network phisical characteristics
  Types.ComplexAdmittance Y "Series admittance";
  Types.ComplexAdmittance YA "Shunt admittance at port a";
  Types.ComplexAdmittance YB "Shunt admittance at port b";
  Types.ComplexPerUnit k "Complex ratio of ideal transformer at port A (vB/vA)";

  // Electrical Interface to be connected via bindings in one children component
  Types.ComplexVoltage vA(re(nominal = VNomA), im(nominal = VNomA));
  Types.ComplexVoltage vB(re(nominal = VNomB), im(nominal = VNomB));
  Types.ComplexCurrent iA(re(nominal = INomA), im(nominal = INomA));
  Types.ComplexCurrent iB(re(nominal = INomB), im(nominal = INomB));

  // See diagram in the documentation layer for the variable definitions
  Types.ComplexVoltage vAt(re(nominal = VNomB), im(nominal = VNomB));
  Types.ComplexVoltage vz(re(nominal = VNomB), im(nominal = VNomB));
  Types.ComplexCurrent iAt(re(nominal = INomB), im(nominal = INomB));
  Types.ComplexCurrent iAs(re(nominal = INomB), im(nominal = INomB));
  Types.ComplexCurrent iBs(re(nominal = INomB), im(nominal = INomB));
  Types.ComplexCurrent iz(re(nominal = INomB), im(nominal = INomB));


equation
  // Kirchhoff's laws
  iAt = iz + iAs;
  iBs = iz + iB;
  vAt = vz + vB;

  // Constitutive equations
  vAt = k * vA;
  iA = CM.conj(k) * iAt;
  iAs = YA * vAt;
  iBs = YB * vB;
  iz = Y * vz;

  annotation(
    Documentation(info = "<html>
<p>This is the base class for branch components that can be represented as Pi-network with an ideal transformer with complex ratio at port_a. A diagram of the model is shown in the figure.</p>
<figure>
 <img src=\"modelica://PowerGrids/Resources/Images/Branches/PiNetwork.png\">
</figure>
<p>In general the impedances and transformer complex ratio are time-varying variables.&nbsp;</p><p>The model can be specialized to describe a transmission line with fixed or variable impedances, a transmission line with embedded circuit breakers, transformers with fixed or variable transformer ratio, transformers with tap changer/phase shifter, etc. It can also be specialized both for power flow models and for dynamic simulation models, see Section 5.6 of the <a href=\"modelica://PowerGrids.UsersGuide.Tutorial.LibraryArchitecture\">Library Architecture Tutorial</a> for more information.</p>
</html>"));
end PiNetworkVI;
