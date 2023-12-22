within PowerGrids.Electrical.BaseClasses;

partial model TwoPortACVI "Base class for naked two-port AC components"
  parameter Types.Voltage UNomA(start = 400e3) "Nominal/rated voltage, port A, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Types.Voltage UNomB = UNomA "Nominal/rated voltage, port B, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Types.Power SNom(start = 100e6) "Nominal/rated power, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Boolean isTwoPortAC = false "= true for dynamic models extending TwoPortAC";
  parameter Boolean linearModel = false "= true if the model is linear, no need of start values";
  parameter Types.Voltage UStartA = if computePF then UStartAPF else UNomA "Start value of phase-to-phase voltage phasor at port A, absolute value" annotation(
    Dialog(tab = "Initialization", enable = isTwoPortAC and not computePF and not linearModel));
  parameter Types.Angle UPhaseStartA = if computePF then UPhaseStartAPF else 0 "Start value of phase-to-phase voltage phasor at port A, phase angle" annotation(
    Dialog(tab = "Initialization", enable = isTwoPortAC and not computePF and not linearModel));
  parameter Types.Voltage UStartB = if computePF then UStartBPF else UNomB "Start value of phase-to-phase voltage phasor at port A, absolute value" annotation(
    Dialog(tab = "Initialization", enable = isTwoPortAC and not computePF and not linearModel));
  parameter Types.Angle UPhaseStartB = if computePF then UPhaseStartBPF else 0 "Start value of phase-to-phase voltage phasor at port A, phase angle" annotation(
    Dialog(tab = "Initialization", enable = isTwoPortAC and not computePF and not linearModel));
  parameter Types.ActivePower PStartA = if computePF then PStartAPF else SNom "Start value of active power flowing into port A" annotation(
    Dialog(tab = "Initialization", enable = isTwoPortAC and not computePF and not linearModel));
  parameter Types.ReactivePower QStartA = if computePF then QStartAPF else 0 "Start value of reactive power flowing into port A" annotation(
    Dialog(tab = "Initialization", enable = isTwoPortAC and not computePF and not linearModel));
  parameter Types.ActivePower PStartB = if computePF then PStartBPF else -SNom "Start value of active power flowing into port B" annotation(
    Dialog(tab = "Initialization", enable = isTwoPortAC and not computePF and not linearModel));
  parameter Types.ReactivePower QStartB = if computePF then QStartBPF else 0 "Start value of reactive power flowing into port B" annotation(
    Dialog(tab = "Initialization", enable = isTwoPortAC and not computePF and not linearModel));
  parameter Boolean showDataOnDiagramsPu = systemPowerGrids.showDataOnDiagramsPu "=true, P,Q,V and phase are shown on the diagrams in per-unit (it overrides the SI format" annotation(Dialog(tab = "Visualization"));
  parameter Boolean showDataOnDiagramsSI = systemPowerGrids.showDataOnDiagramsSI "=true, P,Q,V and phase are shown on the diagrams in kV, MW, Mvar" annotation(Dialog(tab = "Visualization"));
  final parameter Boolean computePF = systemPowerGrids.computePF "= true, computes the start value with the embedded power flow" annotation(
    Evaluate = true);
  parameter Boolean portVariablesPhases = systemPowerGrids.portVariablesPhases "Compute voltage and current phases for monitoring purposes" annotation(
    Evaluate = true, Dialog(tab = "Visualization"));
  parameter Boolean computePowerBalance = systemPowerGrids.computePowerBalance "Compute net balance of complex power entering the component" annotation(Dialog(tab = "Visualization"));

  final parameter Types.Voltage UStartAPF(fixed = false) "Start value of voltage magnitude at port A computed by the embedded PF";
  final parameter Types.Angle UPhaseStartAPF(fixed = false) "Start value of voltage phase at port A computed by the embedded PF";
  final parameter Types.Voltage UStartBPF(fixed = false) "Start value of voltage magnitude at port B computed by the embedded PF";
  final parameter Types.Angle UPhaseStartBPF(fixed = false) "Start value of voltage phase at port B computed by the embedded PF";
  final parameter Types.ActivePower PStartAPF(fixed = false) "Start value of active power flowing into the portA, computed by the embedded PF";
  final parameter Types.ReactivePower QStartAPF(fixed = false) "Start value of reactive power flowing into the portA, computed by the embedded PF";
  final parameter Types.ActivePower PStartBPF(fixed = false) "Start value of active power flowing into the portB, computed by the embedded PF";
  final parameter Types.ReactivePower QStartBPF(fixed = false) "Start value of reactive power flowing into the portB, computed by the embedded PF";

  replaceable connector TerminalAC_a = PowerGrids.Interfaces.TerminalACVI;
  replaceable connector TerminalAC_b = PowerGrids.Interfaces.TerminalACVI;

  TerminalAC_a terminalAC_a(
      v(re(start = portA.vStart.re), im(start = portA.vStart.im)),
      i(re(start = portA.iStart.re), im(start = portA.iStart.im))) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TerminalAC_b terminalAC_b(
      v(re(start = portB.vStart.re), im(start = portB.vStart.im)),
      i(re(start = portB.iStart.re), im(start = portB.iStart.im))) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PortAC portA(
    final UNom = UNomA,
    final SNom = SNom,
    final UStart = UStartA,
    final UPhaseStart = UPhaseStartA,
    final PStart = PStartA,
    final QStart = QStartA,
    final portVariablesPhases = portVariablesPhases) "AC port - terminalAC_a";
  PortAC portB(
    final UNom = UNomB,
    final SNom = SNom,
    final UStart = UStartB,
    final UPhaseStart = UPhaseStartB,
    final PStart = PStartB,
    final QStart = QStartB,
    final portVariablesPhases = portVariablesPhases) "AC port - terminalAC_b";

  Types.ComplexPower Sbal = portA.S + portB.S if computePowerBalance "Complex power balance";

  outer Electrical.System systemPowerGrids "Reference to system object";
  annotation(
    Documentation(info = "<html><head></head><body><p>This is the base class for all the components with two AC terminals. It contains two corresponding <code>PortAC</code> components to compute useful quantities for modelling and monitoring purposes.&nbsp;<span style=\"font-family: 'MS Shell Dlg 2'; font-size: 12px;\">No provision for guess values and embedded power flow, only voltage and currents on the connectors.</span></p>
    </body></html>"));
end TwoPortACVI;
