within PowerGrids.Electrical.PowerFlow;

model AMBus
  extends BaseClasses.OnePortAC(portVariablesPu = true);
  extends Icons.Machine;

  parameter Types.ActivePower P = SNom "Active power entering the bus";
  parameter Types.PerUnit RsPu "Stator resistance in p.u.";
  parameter Types.PerUnit XsPu "Stator reactance in p.u.";
  parameter Types.PerUnit RrPu "Rotor resistance in p.u.";
  parameter Types.PerUnit XrPu "Rotor reactance in p.u.";
  parameter Types.PerUnit XmPu "Magnetization reactance in p.u.";
  Types.PerUnit slip(start=0.001) "Machine slip in p.u.";
  parameter Types.ComplexPerUnit ZsPu = Complex(RsPu, XsPu) "Stator impedance";
  parameter Types.ComplexPerUnit ZmPu = Complex(0, XmPu) "Magnetizing impedance";
  Types.ComplexPerUnit ZrPu = Complex(RrPu/slip, XrPu) "Rotor impedance";
equation
  // Active Power is considered to be independent of voltage variations
  // and thus kept constant during power flow iterations
  port.P = P;
  // A steady state circuit of the asynchronous machine
  port.vPu = port.iPu * ( ZsPu + ( ZmPu * ZrPu ) / ( ZmPu + ZrPu ) );
  annotation(
    Icon(graphics = {Text(origin = {84, 10}, extent = {{-20, 20}, {40, -40}}, textString = "AM")}));
end AMBus;
