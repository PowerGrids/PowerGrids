within PowerGrids.Electrical.Branches;
model LineConstantImpedanceFault "Transmission line with constant impedance and fault in intermediate position"
  extends Electrical.BaseClasses.TwoPortAC(
    UNomA = UNom,
    UNomB = UNomA);
  extends Icons.Line;

  parameter Types.Voltage UNom(start = 400e3) "Nominal/rated voltage";
  parameter Types.Resistance R "Series resistance";
  parameter Types.Reactance X "Series reactance";
  parameter Types.Conductance G = 0  "Shunt conductance";
  parameter Types.Susceptance B = 0 "Shunt susceptance";
  parameter SI.PerUnit faultLocationPu "Location of the fault (0: port A, 1: port B)" annotation(Dialog(group="Fault data"));
  parameter SI.Time startTime "Start time of the fault" annotation(Dialog(group="Fault data"));
  parameter SI.Time stopTime "End time of the fault" annotation(Dialog(group="Fault data"));
  parameter Types.Resistance RFault "Fault resistance" annotation(Dialog(group="Fault data"));
  parameter Types.Reactance XFault "Fault reactance" annotation(Dialog(group="Fault data"));
  PowerGrids.Electrical.Branches.LineConstantImpedance lineA(B = faultLocationPu * B, G = faultLocationPu * G, PStartA = PStartA, PStartB = (1 - faultLocationPu) * PStartA + faultLocationPu * PStartB, QStartA = QStartA, QStartB = (1 - faultLocationPu) * QStartA + faultLocationPu * QStartB, R = faultLocationPu,SNom = SNom, UNom = UNom, UPhaseStartA = UPhaseStartA, UPhaseStartB = (1 - faultLocationPu) * UPhaseStartA + faultLocationPu * UPhaseStartB, UStartA = UStartA, UStartB = (1 - faultLocationPu) * UStartA + faultLocationPu * UStartB, X = faultLocationPu * X)  annotation(
    Placement(visible = true, transformation(origin = {-40, 2.44249e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PowerGrids.Electrical.Branches.LineConstantImpedance lineB(B = (1 - faultLocationPu) * B, G = (1 - faultLocationPu) * G, PStartA = (1 - faultLocationPu) * PStartA + faultLocationPu * PStartB, PStartB = PStartB, QStartA = (1 - faultLocationPu) * QStartA + faultLocationPu * QStartB, QStartB = QStartA, R = (1 - faultLocationPu) * R,SNom = SNom, UNom = UNom, UPhaseStartA = UPhaseStartA, UPhaseStartB = UPhaseStartB, UStartA = UStartA, UStartB = UStartB, X = (1 - faultLocationPu) * X, portVariablesPu = false) annotation(
    Placement(visible = true, transformation(origin = {40, 1.77636e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PowerGrids.Electrical.Buses.BusFault busFault(R = RFault, SNom = SNom, UNom = UNom, X = XFault, portVariablesPu = false, startTime = startTime, stopTime = stopTime)  annotation(
    Placement(visible = true, transformation(origin = {-2, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(busFault.terminal, lineA.terminalB) annotation(
    Line(points = {{-2, -40}, {-2, -40}, {-2, 0}, {-20, 0}, {-20, 0}}));
  connect(lineB.terminalB, terminalB) annotation(
    Line(points = {{60, 0}, {96, 0}, {96, 0}, {100, 0}}));
  connect(lineA.terminalB, lineB.terminalA) annotation(
    Line(points = {{-20, 0}, {20, 0}, {20, -2}, {20, -2}, {20, 0}}));
  connect(lineA.terminalA, terminalA) annotation(
    Line(points={{-60,0},{-94,0},{-94,0},{-100,0}}));
  annotation(
    Documentation(info = "<html>
<p>Transmission line with constant series impedance R+jX and constant shunt admittance G+jB. </p>
<p>Implemented as a child class of <a href=\"modelica://PowerGrids.Electrical.Branches.BaseClasses.PiNetwork\">PiNetwork</a>, where Ya=Yb=(G+jB)/2 and k = 1, see the corresponding documentation.</p>
</html>"));
end LineConstantImpedanceFault;
