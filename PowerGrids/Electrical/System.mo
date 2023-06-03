within PowerGrids.Electrical;
model System "System object"
  import PowerGrids.Types.Choices.InitializationOption;
  parameter SI.Frequency fNom = 50 "Nominal system frequency";
  parameter InitializationOption initOpt = 
    InitializationOption.globalSteadyStateFixedSetPoints "Initialization option";
  parameter Boolean loadLowVoltageAsImpedance = false "= true, all loads shall work as a fixed-impedances at low-voltage conditions" annotation(Evaluate = true);
  parameter Boolean portVariablesPhases = false "Compute voltage and current phases for monitoring purposes only, it can be locally overridden" annotation(Evaluate = true);
  final parameter SI.AngularVelocity omegaNom = fNom*2*Modelica.Constants.pi "Nominal system angular frequency";

annotation (
    defaultComponentName="systemPowerGrids",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
Your model is using an outer \"systemPowerGrids\" component but
an inner \"systemPowerGrids\" component is not defined.
For simulation drag PowerGrids.Electrical.System into your model
to specify system-wide settings.",
  Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-21, 41}, extent = {{-47, 21}, {83, -93}}, textString = "S")}),
  Documentation(info = "<html><head></head><body><p>The system object contains system-wide default choices for frequency management and initialization scheme.</p>
</body></html>"));
end System;
