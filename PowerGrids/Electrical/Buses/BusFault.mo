within PowerGrids.Electrical.Buses;
model BusFault
  extends Icons.Bus;
  extends Electrical.BaseClasses.OnePortAC;
  parameter Types.Resistance R = 0 "Series resistance to ground during fault" annotation(Dialog(group="Fault data"));
  parameter Types.Reactance X = 0 "Series reactance to ground during fault" annotation(Dialog(group="Fault data"));
  parameter SI.Time startTime "Start time of the fault" annotation(Dialog(group="Fault data"));
  parameter SI.Time stopTime "End time of the fault" annotation(Dialog(group="Fault data"));

  Types.ComplexVoltage v(re(nominal = port.VBase), im(nominal = port.VBase)) = port.v "Port voltage, phase-to-ground";
  Types.ComplexCurrent i(re(nominal = port.IBase), im(nominal = port.IBase)) = port.i "Port current";

  discrete Types.ComplexAdmittance Y(re(start = 0, fixed = true), im(start = 0, fixed = true)) "Shunt admittance";
  Boolean fault(start = false, fixed = true) "The fault is active";

// State machine to compute the fault variable
algorithm
   when time >= startTime then
     fault := true;
   end when;

   when time >= stopTime then
     fault := false;
   end when;

// State machine to compute the shunt admittance
algorithm
   when pre(fault) then
     Y := 1/Complex(R, X);
   end when;

   when not pre(fault) then
     Y := Complex(0);
   end when;
equation
   i = Y*v;
annotation (
    Icon(coordinateSystem(grid = {0.1, 0.1}), graphics={  Line(origin = {-64.98, -38}, points = {{-3.01972, 29.9973}, {18.9803, 9.99729}, {-19.0197, -12.0027}, {2.98028, -30.0027}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6)}));
end BusFault;
