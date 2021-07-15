within PowerGrids.Electrical.BaseClasses;

model PortAC "AC port computing auxiliary quantities"
  parameter Types.Power   SNom(start = 100e6) "Nominal or rated power";
  parameter Types.Voltage UNom(start = 400e3) "Nominal or rated phase-to-phase voltage";
  parameter Types.Power   SBase = SNom "Base power";
  parameter Types.Voltage UBase = UNom "Base phase-to-phase voltage";

  parameter Types.Power PStart "Start value of active power flowing into port";
  parameter Types.Power QStart "Start value of reactive power flowing into port";
  parameter Types.Voltage UStart = UNom "Start value of phase-to-phase voltage modulus";
  parameter Types.Angle UPhaseStart = 0 "Start value of voltage phase";
  
  parameter Boolean portVariablesPhases = false "Compute voltage and current phases for monitoring purposes only" annotation(Evaluate = true);
  constant Boolean portVariablesPu = true "Add per-unit variables to model";
  constant Boolean generatorConvention = false "Add currents with generator convention (i > 0 when exiting the device) to model";

  // Computed parameters
  final parameter Types.Voltage VBase = UBase/sqrt(3) "Base phase-to-ground voltage";
  final parameter Types.Current IBase = SBase/(3*VBase) "Base current";
  
  final parameter Types.Voltage VStart = UStart/sqrt(3) "Start value of phase-to ground voltage modulus";
  final parameter Types.Current IStart = sqrt(PStart^2 + QStart^2)/(3*VStart) "Start value of current modulus";

  final parameter Types.ComplexVoltage vStart = CM.fromPolar(UStart/sqrt(3), UPhaseStart)
    "Start value of phase-to-ground voltage phasor";
  final parameter Types.ComplexCurrent iStart = CM.conj(Complex(PStart,QStart)/(Complex(3)*vStart))
    "Start value of current phasor flowing into the port";
  
  connector InputComplexVoltage = input Types.ComplexVoltage "Marks potential input for balancedness check without requiring binding equation";
  connector InputComplexCurrent = input Types.ComplexCurrent "Marks potential input for balancedness check without requiring binding equation";

  InputComplexVoltage v(re(nominal = VBase, start = vStart.re),
                        im(nominal = VBase, start = vStart.im)) "Port voltage (line-to-neutral)";
  InputComplexCurrent i(re(nominal = IBase, start = iStart.re),
                        im(nominal = IBase, start = iStart.im)) "Port current";

  Types.ComplexVoltage u(re(nominal = UBase, start = vStart.re*sqrt(3)),
                         im(nominal = UBase, start = vStart.im*sqrt(3))) = sqrt(3)*v
     "Complex phase-to-phase voltage";
  Types.ComplexPower   S(re(nominal = SBase), im(nominal = SBase)) = 3*v*CM.conj(i)
     "Complex power flowing into the port";
  Types.ActivePower   P(nominal = SBase, start = PStart) = S.re "Active power flowing into the port";
  Types.ReactivePower Q(nominal = SBase, start = QStart) = S.im "Reactive power flowing into the port";
  
  Types.Voltage U(nominal = UBase, start = UStart) = CM.'abs'(u) "Port voltage absolute value (phase-to-phase)";
  Types.Current I(nominal = IBase, start = IStart) = CM.'abs'(i) "Port current (positive entering)";

  Types.PerUnit        PPu(start = PStart/SBase) = if portVariablesPu then S.re/SBase else 0 "Active power flowing into the port in p.u. (base SBase)" annotation(
  HideResult = portVariablesPu);
  Types.PerUnit        QPu(start = QStart/SBase) = if portVariablesPu then S.im/SBase else 0 "Reactive power flowing into the port in p.u. (base SBase)" annotation(
  HideResult = portVariablesPu);
  Types.ComplexPerUnit vPu(re(start = vStart.re/VBase),im(start = vStart.im/VBase)) = if portVariablesPu then u*(1/UBase) else Complex(0) "Complex voltage across the port in p.u. (base VBase)"  annotation(
  HideResult = portVariablesPu);
  SI.PerUnit           VPu(start = VStart/VBase) = if portVariablesPu then U/UBase else 0 "Absolute value of voltage across the port in p.u. (base VBase)" annotation(
  HideResult = portVariablesPu);
  Types.ComplexPerUnit iPu(re(start = iStart.re/IBase), im(start = iStart.im/IBase)) = if portVariablesPu then i*(1/IBase) else Complex(0) "Complex current flowing into the port in p.u. (base IBase)" annotation(
  HideResult = portVariablesPu);
  SI.PerUnit           IPu(start = IStart/IBase) = if portVariablesPu then I/IBase else 0 "Absolute value of complex current flowing into the port in p.u. (base IBase)" annotation(
  HideResult = portVariablesPu);
  
  Types.Angle UPhase(start = UPhaseStart) = if portVariablesPhases then atan2(v.im, v.re) else 0 "Phase of voltage across the port"  annotation(
  HideResult = portVariablesPhases);
  Types.Angle IPhase(start = CM.arg(iStart)) = if portVariablesPhases then atan2(i.im, i.re) else 0 "Phase of current into the port" annotation(
  HideResult = portVariablesPhases);
  
  Types.ComplexCurrent iGen(re(nominal = IBase, start = -iStart.re),
                            im(nominal = IBase, start = -iStart.im)) = -i "Port current, generator convention";
  Types.ActivePower PGen(nominal = SBase, start = -PStart) = -S.re "Active power flowing out of the port";
  Types.ReactivePower QGen(nominal = SBase, start = -QStart) = -S.im "Reactive power flowing out of the port";
  Types.PerUnit PGenPu(start = -PStart/SBase) = -PPu "Active power flowing out of the port in p.u. (base SBase)";
  Types.PerUnit QGenPu(start = -QStart/SBase) = -QPu "Reactive power flowing out of the port in p.u. (base SBase)";
  Types.ComplexPerUnit iGenPu(re(start = -iStart.re/IBase),im(start = -iStart.im/IBase)) = -iPu "Complex current flowing out of the port in p.u. (base IBase)";
  SI.PerUnit IGenPu(start = IStart/IBase) = if portVariablesPu and generatorConvention then I/IBase else 0 "Absolute value of current flowing out of the port in p.u. (base IBase)" annotation(
  HideResult = portVariablesPu and generatorConvention);
  annotation(
    Documentation(info = "<html>
<p>This model computes quantities associated to an AC port that can be useful or relevant for modelling and monitoring purposes, such as the complex power flow, the absolute value of the phase-to-phase voltage, the angle of the current, or various per-unit quantities. The phase-to-ground voltage and line current phasors must be assigned as inputs.</p>

<p>Per-unit quantities, angles and quantities using the generator convention are defined if the corresponding parameters <code>portVariablesPu</code>, <code>portVariablesAngles</code>, and <code>generatorConvention</code> are set to true, respectively.</p>
</html>"),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}})}));
end PortAC;
