within PowerGrids.Electrical.Faults;

model ThreePhaseFault
  extends Icons.Fault(PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.OnePortAC(
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare PowerGrids.Electrical.PowerFlow.BusPF componentPF(
      UNom = UNom));
  parameter Types.Resistance R = 0 "Series resistance to ground during fault" annotation(Dialog(group="Fault data"));
  parameter Types.Reactance X = 0 "Series reactance to ground during fault" annotation(Dialog(group="Fault data"));
  parameter SI.Time startTime "Start time of the fault" annotation(Dialog(group="Fault data"));
  parameter SI.Time stopTime "End time of the fault" annotation(Dialog(group="Fault data"));

  Types.ComplexVoltage v(re(nominal = port.VNom), im(nominal = port.VNom)) = port.v "Port voltage, phase-to-ground";
  Types.ComplexCurrent i(re(nominal = port.INom), im(nominal = port.INom)) = port.i "Port current";

  discrete Types.ComplexAdmittance Y(re(start = 0, fixed = true), im(start = 0, fixed = true)) "Shunt admittance";
  Boolean fault(start = false, fixed = true) "The fault is active";

algorithm
   when time >= startTime then
     fault := true;
   end when;

   when time >= stopTime then
     fault := false;
   end when;
// State machine to compute the shunt admittance
// State machine to compute the fault variable
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
    Icon(graphics = {Text(origin = {0, -24}, extent = {{-20, 20}, {20, -20}}, textString = "Z")}),
  Documentation(info = "<html><head></head><body><!--StartFragment--><p style=\"font-family: 'MS Shell Dlg 2'; font-size: 12px;\">Three-phase fault with constant shunt impedance R+jX.&nbsp;</p><p style=\"font-family: 'MS Shell Dlg 2'; font-size: 12px;\">Fault start time and duration (i.e. stop time - start time) can be set by means of the parameters&nbsp;<span style=\"font-family: 'Cascadia Code'; font-size: 13.333333015441895px;\">startTime&nbsp;</span>and&nbsp;<span style=\"font-family: 'Cascadia Code'; font-size: 13.333333015441895px;\">stopTime.</span></p><!--EndFragment--></body></html>"));
end ThreePhaseFault;
