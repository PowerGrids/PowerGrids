within PowerGrids.Electrical.Branches;
model LineConstantImpedanceFault "Transmission line with constant impedance and fault in intermediate position"
  extends Electrical.BaseClasses.TwoPortAC(
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/X,
    final hasSubPF = true);
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

  PowerGrids.Electrical.Branches.LineConstantImpedance lineA(
    B = faultLocationPu * B, 
    G = faultLocationPu * G, 
    PStartA = PStartA, 
    PStartB = if computePF then lineA.PStartBPF else (1 - faultLocationPu) * PStartA + faultLocationPu * PStartB, 
    QStartA = QStartA, 
    QStartB = if computePF then lineA.QStartBPF else (1 - faultLocationPu) * QStartA + faultLocationPu * QStartB, 
    R = faultLocationPu*R,
    SNom = SNom, 
    UNom = UNom, 
    X = faultLocationPu * X)  annotation(
    Placement(visible = true, transformation(origin = {-40, 2.44249e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  PowerGrids.Electrical.Branches.LineConstantImpedance lineB(
    B = (1 - faultLocationPu) * B, 
    G = (1 - faultLocationPu) * G, 
    PStartA = if computePF then lineB.PStartAPF else (1 - faultLocationPu) * PStartA + faultLocationPu * PStartB, 
    PStartB = PStartB,
    QStartA = if computePF then lineB.QStartAPF else (1 - faultLocationPu) * QStartA + faultLocationPu * QStartB, 
    QStartB = QStartB, 
    R = (1 - faultLocationPu) * R,
    SNom = SNom, 
    UNom = UNom, 
    X = (1 - faultLocationPu) * X) annotation(
    Placement(visible = true, transformation(origin = {40, 1.77636e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  PowerGrids.Electrical.Faults.ThreePhaseFault threePhaseFault(
    R = RFault, 
    SNom = SNom, 
    UNom = UNom, 
    X = XFault, 
    startTime = startTime, 
    stopTime = stopTime) annotation(
    Placement(visible = true, transformation(origin = {0, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Buses.Bus busFault(
    UNom=UNom, 
    UStart = if computePF then busFault.UStartPF else (1 - faultLocationPu) * UStartA + faultLocationPu * UStartB, 
    UPhaseStart = if computePF then busFault.UPhaseStartPF else (1 - faultLocationPu) * UPhaseStartA + faultLocationPu * UPhaseStartB) annotation(
    Placement(visible = true, transformation(origin = {0, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(lineB.terminalAC_b, terminalAC_b) annotation(
    Line(points = {{60, 0}, {96, 0}, {96, 0}, {100, 0}}));
  connect(lineA.terminalAC_b, lineB.terminalAC_a) annotation(
    Line(points = {{-20, 0}, {20, 0}, {20, -2}, {20, -2}, {20, 0}}));
  connect(lineA.terminalAC_a, terminalAC_a) annotation(
    Line(points={{-60,0},{-94,0},{-94,0},{-100,0}}));
  connect(lineA.terminalAC_b, busFault.terminalAC) annotation(
    Line(points = {{-20, 0}, {0, 0}, {0, -12}}));
  connect(busFault.terminalAC, threePhaseFault.terminalAC) annotation(
    Line(points = {{0, -12}, {0, -26}}));
  annotation(
    Documentation(info = "<html><head></head><body><p>Transmission line with constant series impedance R+jX and constant shunt admittance G+jB plus an intermediate three-phase fault with constant shunt impedance RFault+jXFault.&nbsp;</p><p>The fault position along the line can be set by means of the&nbsp;<span style=\"font-family: 'Cascadia Code'; font-size: 10pt;\">faultLocationPu</span>&nbsp;parameter, that can assume a value in the range 0-1 were 0 means fault at port A, 1 means fault at port B and each intermediate value means fault in the corrispondent intermediate positio (e.g. 0.5 means fault in the middle).</p><p>Fault start time and duration (i.e. stop time - start time) can be set by means of the parameters&nbsp;<span style=\"font-family: 'Cascadia Code'; font-size: 13.333333015441895px;\">startTime&nbsp;</span>and <span style=\"font-family: 'Cascadia Code'; font-size: 13.333333015441895px;\">stopTime.</span></p>

<p>Implemented as two&nbsp;<span style=\"font-family: 'Cascadia Code'; font-size: 10pt;\"><a href=\"modelica://PowerGrids.Electrical.Branches.LineConstantImpedance\">LineConstantImpedance</a>&nbsp;</span>series-connected plus a&nbsp;<span style=\"font-family: 'Cascadia Code'; font-size: 10pt;\"><a href=\"modelica://PowerGrids.Electrical.Faults.ThreePhaseFault\">TrheePhaseFault</a></span>&nbsp;connected between the two lines.</p>


</body></html>"));
end LineConstantImpedanceFault;
