within PowerGrids.Electrical.BaseClasses;

partial model TwoPortACVI "Base class for two-port AC components"
  parameter Types.Voltage UNomA(start = 400e3) "Nominal/rated voltage, port A, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Types.Voltage UNomB = UNomA "Nominal/rated voltage, port B, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Types.Power SNom(start = 100e6) "Nominal/rated power, also used as p.u. base" annotation(
    Evaluate = true);
  parameter Boolean portVariablesPhases = systemPowerGrids.portVariablesPhases "Compute voltage and current phases for monitoring purposes" annotation(
    Evaluate = true, Dialog(tab = "Visualization"));
  parameter Boolean computePowerBalance = systemPowerGrids.computePowerBalance "Compute net balance of complex power entering the component" annotation(Dialog(tab = "Visualization"));

  replaceable PowerGrids.Interfaces.TerminalACVI terminalAC_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable PowerGrids.Interfaces.TerminalACVI terminalAC_b annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PortAC portA "AC port - terminalAC_a";
  PortAC portB "AC port - terminalAC_b";

  Types.ComplexPower Sbal = portA.S + portB.S if computePowerBalance "Complex power balance";

  outer Electrical.System systemPowerGrids "Reference to system object";
  annotation(
    Documentation(info = "<html><head></head><body><p>This is the base class for all the components with two AC terminals. It contains two corresponding <code>PortAC</code> components to compute useful quantities for modelling and monitoring purposes.</p>
    </body></html>"));
end TwoPortACVI;
