within PowerGrids.Electrical.PowerFlow;

model AMBus
  extends BaseClasses.OnePortAC(portVariablesPu = true);
  extends Icons.Machine;

  parameter Types.ActivePower P = SNom "Active power entering the bus";
  parameter Types.PerUnit Rs "Stator resistance";
  parameter Types.PerUnit Xs "Stator reactance";
  parameter Types.PerUnit Rr "Rotor resistance";
  parameter Types.PerUnit Xr "Rotor reactance";
  parameter Types.PerUnit Xm "Magnetization reactance";
  Types.PerUnit slip "Machine slip in p.u.";

equation
// Active Power is considered to be independent of voltage variations
// and thus kept constant during power flow iterations
  port.P = P;
// A steady state circuit of the asynchronous machine
  port.iPu = port.vPu / Complex(Rs + Rr / slip, Xs + Xr) + port.vPu / Complex(0, Xm);
  annotation(
    Icon(graphics = {Text(origin = {84, 10}, extent = {{-20, 20}, {40, -40}}, textString = "AM")}));
end AMBus;
