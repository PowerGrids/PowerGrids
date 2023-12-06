within PowerGrids.Electrical.Buses;

model InfiniteBusVariableVoltage
  extends PowerGrids.Electrical.BaseClasses.OnePortACBus(final hasSubPF, redeclare PowerGrids.Electrical.PowerFlow.InfiniteBusPF componentPF(UNom = UNom, SNom = SNom, URef = UFixed, UPhase = UPhaseFixed, R = R, X = X));
  extends PowerGrids.Electrical.BaseComponents.BusBaseVI(e = CM.fromPolar(UAux/sqrt(3), UPhaseAux), Z = Complex(R, X), redeclare PowerGrids.Interfaces.TerminalACBus terminalAC);
  extends Icons.Bus;
  parameter Boolean useUIn = false "Use external input for source voltage magnitude" annotation(
    Dialog(group = "external inputs"),
    choices(checkBox = true));
  parameter Boolean useUPhaseIn = false "Use external input for source voltage angle" annotation(
    Dialog(group = "external inputs"),
    choices(checkBox = true));
  parameter Types.Resistance R = 0 "Series resistance";
  parameter Types.Reactance X = 0 "Series reactance";
  parameter Types.Voltage UFixed = UNom "Fixed source voltage modulus, phase-to-phase, reference Voltage for the embedded PF" annotation(
    Dialog(group = "Embedded PF", enable = computePF));
  parameter Types.Angle UPhaseFixed = 0 "Fixed angle of source voltage, reference angle for the embedded PF" annotation(
    Dialog(group = "Embedded PF", enable = computePF));
  Modelica.Blocks.Interfaces.RealInput UIn(unit = "V", displayUnit = "kV") if useUIn "Source voltage modulus input, phase-to-phase, V" annotation(
    Placement(visible = true, transformation(origin = {-98, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput UPhaseIn(unit = "rad", displayUnit = "deg") if useUPhaseIn "Source voltage phase angle input, rad" annotation(
    Placement(visible = true, transformation(origin = {-98, -26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
protected
  // Auxiliary hidden connectors to manage the conditional connectors
  Modelica.Blocks.Interfaces.RealInput UAux "Source voltage modulus, phase-to-phase";
  Modelica.Blocks.Interfaces.RealInput UPhaseAux "Source voltage phase angle";
equation
// Conditional connectors
  connect(UIn, UAux);
  if not useUIn then
    UAux = UFixed;
  end if;
  connect(UPhaseIn, UPhaseAux);
  if not useUPhaseIn then
    UPhaseAux = UPhaseFixed;
  end if;
  assert(UAux >= 0, "Magnitude must be positive");
// Overconstrained connector
  Connections.potentialRoot(terminalAC.omegaRefPu);
  if Connections.isRoot(terminalAC.omegaRefPu) then
    terminalAC.omegaRefPu = 1;
  end if;
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}), graphics = {Rectangle(origin = {-79, 0}, extent = {{-1, 60}, {1, -60}}), Text(origin = {84, 32}, extent = {{-20, 28}, {20, -28}}, textString = "", fontName = "Symbol")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html>
<p>Infinite bus model with voltage e. The port voltage is v = e + Zi, where i is the current entering the bus. The default value of the series impedance Z = R + jX is zero.</p>
<p>The magnitude and angle of the voltage e can provided by external input connectors. If useUin = true, the UIn input is used to set the magnitude of voltage e, otherwise the constant value UFixed is used.</p>
<p>Similarly, if useThetaIn = true, the thetaIn input is used to set the phase angle of voltage e, otherwise the constant value thetaFixed is used.</p>
<p>If the embedded PF is active, the UFixed and thetaFixed values are used as reference for the embedded PF computation, so they should be set accordingly to the initial values of UIn and ThetaIn respectively.</p>
</html>"));
end InfiniteBusVariableVoltage;
