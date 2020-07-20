within PowerGrids.Electrical.Buses;
model InfiniteBusVariableVoltage
  extends BaseClasses.BusBase(
    e = CM.fromPolar(UAux/sqrt(3), thetaAux),
    Z = Complex(R, X));
  extends Icons.Bus;
  parameter Types.Voltage UFixed = UNom "Fixed source voltage modulus, phase-to-phase" annotation(Dialog(enable = not useThetaIn));
  parameter Types.Angle thetaFixed = 0 "Fixed angle of source voltage" annotation(Dialog(enable = not useThetaIn));
  parameter Boolean useUIn = false "Use external input for source voltage magnitude" annotation(
   Dialog(group = "external inputs"), choices(checkBox = true));
  parameter Boolean useThetaIn = false "Use external input for source voltage angle" annotation(
   Dialog(group = "external inputs"), choices(checkBox = true));
  parameter Types.Resistance R = 0 "Series resistance";
  parameter Types.Reactance X = 0 "Series reactance";

  Modelica.Blocks.Interfaces.RealInput UIn(unit = "V", displayUnit = "kV") if useUIn "Source voltage modulus input, phase-to-phase, V" annotation(
    Placement(visible = true, transformation(origin = {-98, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput thetaIn(unit = "rad", displayUnit = "deg") if useThetaIn "Source voltage phase angle input, rad" annotation(
    Placement(visible = true, transformation(origin = {-98, -26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

protected
  // Auxiliary hidden connectors to manage the conditional connectors
  Modelica.Blocks.Interfaces.RealInput UAux "Source voltage modulus, phase-to-phase";
  Modelica.Blocks.Interfaces.RealInput thetaAux "Source voltage phase angle";

equation
// Conditional connectors
   connect(UIn, UAux);
   if not useUIn then
     UAux = UFixed;
   end if;

   connect(thetaIn, thetaAux);
   if not useThetaIn then
     thetaAux = thetaFixed;
   end if;

   assert(UAux >= 0, "Magnitude must be positive");

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html>
<p>Infinite bus model with voltage e. The port voltage is v = e + Zi, where i is the current entering the bus. The default value of the series impedance Z = R + jX is zero.</p>
<p>The magnitude and angle of the voltage e can provided by external input connectors. If useUin = true, the UIn input is used to set the magnitude of voltage e, otherwise the constant value UFixed is used.</p>
<p>Similarly, if useThetaIn = true, the thetaIn input is used to set the phase angle of voltage e, otherwise the constant value thetaFixed is used.</p>
</html>"));
end InfiniteBusVariableVoltage;
