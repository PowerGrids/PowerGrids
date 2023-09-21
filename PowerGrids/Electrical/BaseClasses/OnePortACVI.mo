within PowerGrids.Electrical.BaseClasses;

partial model OnePortACVI "Base class for AC components with one port"
  parameter Types.Voltage UNom(start = 400e3) "Nominal/rated line-to-line voltage, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Types.ApparentPower SNom(start = 100e6) "Nominal/rated apparent power, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Boolean portVariablesPhases = systemPowerGrids.portVariablesPhases "Compute voltage and current phases for monitoring purposes only" annotation(
    Evaluate = true);
  parameter Boolean computePF = systemPowerGrids.computePF "= true, computes the start value with the embedded power flow" annotation(
    Evaluate = true);  
  constant Boolean generatorConvention = false "Add currents with generator convention (i > 0 when exiting the device) to model";

  replaceable PowerGrids.Interfaces.TerminalACVI terminalAC annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PortAC port "AC port of node";

  outer Electrical.System systemPowerGrids "Reference to system object";

  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the components with an AC terminal. It contains a corresponding <code>PortAC</code> component to compute useful quantities for modelling and monitoring purposes.</p>
</html>"));
end OnePortACVI;
