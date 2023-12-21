within PowerGrids.Electrical.BaseClasses;

partial model OnePortACVI "Base class for naked AC components with one port"
  parameter Types.Voltage UNom(start = 400e3) "Nominal/rated line-to-line voltage, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Types.ApparentPower SNom(start = 100e6) "Nominal/rated apparent power, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Types.Voltage UStart = if computePF then UStartPF else UNom "Start value of phase-to-phase voltage modulus";
  parameter Types.Angle UPhaseStart = if computePF then UPhaseStartPF else 0 "Start value of voltage phase";
  parameter Types.ActivePower PStart = if computePF then PStartPF else SNom "Start value of active power flowing into the port" annotation(
    Dialog(tab = "Initialization", enable = not computePF));
  parameter Types.ReactivePower QStart = if computePF then QStartPF else 0 "Start value of reactive power flowing into the port" annotation(
    Dialog(tab = "Initialization", enable = not computePF));
  parameter Boolean portVariablesPhases = systemPowerGrids.portVariablesPhases "Compute voltage and current phases for monitoring purposes" annotation(
    Evaluate = true, Dialog(tab = "Visualization"));
  constant Boolean generatorConvention = false "Compute currents with generator convention (i > 0 when exiting the device) to model";
  parameter Boolean showDataOnDiagramsPu = systemPowerGrids.showDataOnDiagramsPu "=true, P,Q,V and phase are shown on the diagrams in per-unit (it overrides the SI format)" annotation(Dialog(tab = "Visualization"));
  parameter Boolean showDataOnDiagramsSI = systemPowerGrids.showDataOnDiagramsSI "=true, P,Q,V and phase are shown on the diagrams in kV, MW, Mvar" annotation(Dialog(tab = "Visualization"));
  // parameter Boolean isOnePortAC = false "= true for non-bus OnePortAC models";
  //7parameter Boolean isOnePortACBus = false "= true for OnePortACBus models";

  final parameter Boolean computePF = systemPowerGrids.computePF "= true, computes the start value with the embedded power flow" annotation(
    Evaluate = true);
  final parameter Types.Voltage UStartPF(fixed = false) "Start value of voltage magnitude obtained from bus or from the embedded PF";
  final parameter Types.Angle UPhaseStartPF(fixed = false) "Start value of voltage phase obtained from bus or from the embedded PF";
  final parameter Types.ActivePower PStartPF(fixed = false) "Start value of active power flowing into the port, computed by the embedded PF";
  final parameter Types.ReactivePower QStartPF(fixed = false) "Start value of reactive power flowing into the port, computed by the embedded PF";

  replaceable connector TerminalAC = PowerGrids.Interfaces.TerminalACVI;

  TerminalAC terminalAC(
      v(re(start = port.vStart.re), im(start = port.vStart.im)),
      i(re(start = port.iStart.re), im(start = port.iStart.im))) annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PortAC port(
    final UNom = UNom,
    final SNom = SNom,
    final PStart = PStart,
    final QStart = QStart,
    final UStart = UStart,
    final UPhaseStart = UPhaseStart,
    final portVariablesPhases = portVariablesPhases,
    final generatorConvention = generatorConvention) "AC port of component";

  outer Electrical.System systemPowerGrids "Reference to system object";
  annotation(
    Documentation(info = "<html><head></head><body><p>This is the base class for all the naked components with an AC terminal. It contains a corresponding <code>PortAC</code> component to compute useful quantities for modelling and monitoring purposes. No provision for guess values and embedded power flow, only voltage and currents on the connectors.</p>
</body></html>"));
end OnePortACVI;
