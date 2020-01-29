within PowerGrids.Controls;

model FreeOffset
  extends Modelica.Blocks.Interfaces.SO;
  import PowerGrids.Types.Choices.InitializationOption;

  parameter Boolean use_u = false "= true if time varying output is required";
  final parameter Boolean fixedOffsetDefault = 
    if systemPowerGrids.initOpt == InitializationOption.globalSteadyStateFixedPowerFlow or
       systemPowerGrids.initOpt == InitializationOption.localSteadyStateFixedPowerFlow
    then false
    else true "Default choice of fixedOffsetDefault from system object";
  parameter Boolean fixedOffset = fixedOffsetDefault "= true if offset is fixed to zero, = false if offset is left free";    
  final parameter Real offset(fixed = false) "Free offset of output y";

  outer PowerGrids.Electrical.System systemPowerGrids "Reference to system object";

  Modelica.Blocks.Interfaces.RealInput u if use_u annotation(
    Placement(visible = true, transformation(origin = {-106, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Modelica.Blocks.Interfaces.RealInput u_internal "Protected connector to be used in equations in place of conditional u";

initial equation
  if fixedOffset then
    offset = 0;
  end if;

equation
  y = u_internal + offset;
  connect(u, u_internal) "Automatically removed if u is disabled";
  if not use_u then
    u_internal = 0 "Provide a default zero value if u is disabled";
  end if;
annotation(
    Documentation(info = "<html>
<p>This block adds an offset to the input <code>u</code>, or to zero if <code>use_u</code> is false.</p>
<p>If <code>fixedOffset = false</code>, then the offset is a free parameter, that needs to be determined by an additional initial equation on the system, otherwise the offset is fixed to zero. This block can be used to adjust the set point of controllers that have additional initial equations to fix their controlled outputs to the start values given by the load flow. The value of the <code>fixedOffset</code> parameter is set by default by the system object, depending on the value of <code>systemPowerGrids.initOpt</code>.</p>
<p>For example, if  <code>systemPowerGrids.initOpt = InitializationOption.localSteadyStateFixedPowerFlow</code> is set, the AVR model adds one extra initial equation to the overall system to prescribe the machine voltage. As a consequence, the initial value of the AVR setpoint signal must be free, so that the Modelica tool can compute it backwards to match the required voltage, if possible, or to set it in order to get a specified oversaturation of the actuator otherwise. This extra degree of freedom is provided by this component.</p>
</html>"),
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {-28, 91}, extent = {{-70, -11}, {120, -89}}, textString = "Free"), Text(origin = {-33, -38}, extent = {{-69, 40}, {131, -38}}, textString = "Offset")}));
end FreeOffset;
