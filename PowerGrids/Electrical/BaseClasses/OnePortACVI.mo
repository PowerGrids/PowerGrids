within PowerGrids.Electrical.BaseClasses;

partial model OnePortACVI "Base class for naked AC components with one port"
  parameter Types.Voltage UNom(start = 400e3) "Nominal/rated line-to-line voltage, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Types.ApparentPower SNom(start = 100e6) "Nominal/rated apparent power, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Boolean portVariablesPhases = systemPowerGrids.portVariablesPhases "Compute voltage and current phases for monitoring purposes" annotation(
    Evaluate = true, Dialog(tab = "Visualization"));
  constant Boolean generatorConvention = false "Add currents with generator convention (i > 0 when exiting the device) to model";

  replaceable connector TerminalAC = PowerGrids.Interfaces.TerminalACVI;

  TerminalAC terminalAC(
      v(re(start = port.vStart.re), im(start = port.vStart.im)),
      i(re(start = port.iStart.re), im(start = port.iStart.im))) annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PortAC port(
    final UNom = UNom,
    final SNom = SNom,
    final portVariablesPhases = portVariablesPhases,
    final generatorConvention = generatorConvention) "AC port of component";

  outer Electrical.System systemPowerGrids "Reference to system object";

  annotation(
    Documentation(info = "<html><head></head><body><p>This is the base class for all the naked components with an AC terminal. It contains a corresponding <code>PortAC</code> component to compute useful quantities for modelling and monitoring purposes. No provision for guess values and embedded power flow, only voltage and currents on the connectors.</p>
</body></html>"));
end OnePortACVI;
