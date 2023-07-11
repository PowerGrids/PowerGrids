within PowerGrids.Electrical.Faults;

model ThreePhaseFault
  extends Icons.Fault;
  extends Electrical.BaseClasses.OnePortAC;
  parameter Types.Resistance R = 0 "Series resistance to ground during fault" annotation(Dialog(group="Fault data"));
  parameter Types.Reactance X = 0 "Series reactance to ground during fault" annotation(Dialog(group="Fault data"));
  parameter SI.Time startTime "Start time of the fault" annotation(Dialog(group="Fault data"));
  parameter SI.Time stopTime "End time of the fault" annotation(Dialog(group="Fault data"));

  Types.ComplexVoltage v(re(nominal = port.VNom), im(nominal = port.VNom)) = port.v "Port voltage, phase-to-ground";
  Types.ComplexCurrent i(re(nominal = port.INom), im(nominal = port.INom)) = port.i "Port current";

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

annotation(
    Icon(graphics = {Text(origin = {0, -24}, extent = {{-20, 20}, {20, -20}}, textString = "Z"), Text(origin = {0, -121}, textColor = {0, 0, 255}, extent = {{-100, 13}, {100, -13}}, textString = "%name")}));
end ThreePhaseFault;
