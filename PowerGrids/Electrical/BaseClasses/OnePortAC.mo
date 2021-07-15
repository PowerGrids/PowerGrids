within PowerGrids.Electrical.BaseClasses;

partial model OnePortAC "Base class for AC components with one port"
  import PowerGrids.Types.Choices.LocalInitializationOption;
  parameter Types.Voltage UNom(start = 400e3) "Nominal/rated line-to-line voltage" annotation(Evaluate = true);
  parameter Types.ApparentPower SNom(start = 100e6) "Nominal/rated apparent power" annotation(Evaluate = true);
  parameter Boolean portVariablesPhases = false "Compute voltage and current phases for monitoring purposes only" annotation(Evaluate = true);
  constant Boolean portVariablesPu = true "Add per-unit variables to model";
  constant Boolean generatorConvention = false "Add currents with generator convention (i > 0 when exiting the device) to model";
  parameter LocalInitializationOption localInit = LocalInitializationOption.none
    "Initialize the component locally in steady state from port start values"
    annotation(Evaluate = true);
  parameter Types.Voltage UStart = UNom "Start value of phase-to-phase voltage phasor, absolute value"
    annotation(Dialog(tab = "Initialization"));
  parameter Types.Angle UPhaseStart = 0 "Start value of phase-to-phase voltage phasor, phase angle"
    annotation(Dialog(tab = "Initialization"));
  parameter Types.ActivePower PStart = SNom "Start value of active power flowing into the port"
    annotation(Dialog(tab = "Initialization"));
  parameter Types.ReactivePower QStart = 0 "Start value of reactive power flowing into the port"
    annotation(Dialog(tab = "Initialization"));

  PowerGrids.Interfaces.TerminalAC terminal
    (v(re(start = port.vStart.re), im(start = port.vStart.im)),
     i(re(start = port.iStart.re), im(start = port.iStart.im))) annotation(
    Placement(visible = true, transformation(origin = {-1.42109e-14, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-1.42109e-14, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PortAC port(final UNom = UNom, final SNom = SNom,
              final portVariablesPu = portVariablesPu,
              final portVariablesPhases = portVariablesPhases,
              final generatorConvention = generatorConvention,
              final UStart = UStart,
              final UPhaseStart = UPhaseStart,
              final PStart = PStart,
              final QStart = QStart)
              "AC port of node";
  outer Electrical.System systemPowerGrids "Reference to system object";
equation
  if initial() and localInit == LocalInitializationOption.PV then
    // During local initialization, P,V is enforced at the connector towards
    // the grid, while Q,phase(V) is enforced at the port towards the component
    // Further two initial equations will be needed (e.g. in the controller)
    // to enforce P,V at the port or achieve actuator saturation if that is not possible
    CM.real(terminal.v*CM.conj(terminal.i)) = port.PStart;
    CM.'abs'(terminal.v) = port.VStart;
    port.Q = port.QStart;
    port.v.re*port.vStart.im = port.v.im*port.vStart.re;
  elseif initial() and localInit == LocalInitializationOption.PQ then
    // During local initialization, P,Q is enforced at the connector towards
    // the grid, while phase(V), phase(I) is enforced at the port towards the component
    // Further two initial equations will be needed (e.g. in the controller)
    // to enforce P,Q at the port or achieve actuator saturation if that is not possible
    terminal.v*CM.conj(terminal.i) = Complex(port.PStart, port.QStart);
    port.v.re*port.vStart.im = port.v.im*port.vStart.re;
    port.i.re*port.iStart.im = port.i.im*port.iStart.re;
  else
    // In all other cases, the port voltage and current are equal to
    // the connector voltage and current
    port.v = terminal.v;
    port.i = terminal.i;
  end if;
  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the components with an AC terminal. It contains a corresponding <code>PortAC</code> component to compute useful quantities for modelling and monitoring purposes.</p>
</html>"));
end OnePortAC;
