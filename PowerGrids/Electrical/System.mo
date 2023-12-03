within PowerGrids.Electrical;
model System "System object"
  import PowerGrids.Types.Choices.InitializationOption;
  parameter SI.Frequency fNom = 50 "Nominal system frequency";
  parameter Boolean computePF = true "= true, computes the start value with the embedded power flow" annotation(Dialog(group = "Initialization"));
  parameter InitializationOption initOpt = InitializationOption.globalSteadyStateFixedSetPoints "Initialization type option"  annotation(Dialog(group = "Initialization"));
  parameter Boolean showDataOnDiagramsPu = true "=true, P,Q,V and phase are shown on the diagrams in per-unit (overrides the SI format)"  annotation(Dialog(group = "Visualization"));
  parameter Boolean showDataOnDiagramsSI = false "=true, P,Q,V and phase are shown on the diagrams in kV, MW, Mvar" annotation(Dialog(group = "Visualization"));
  parameter Boolean loadLowVoltageAsImpedance = false "= true, all loads shall work as a fixed-impedances at low-voltage conditions" annotation(Evaluate = true);
  parameter Boolean portVariablesPhases = true "Compute voltage and current phases for monitoring purposes" annotation(Evaluate = true, Dialog(group = "Visualization"));
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
  Documentation(info = "<html><head></head><body><p>The system object contains system-wide default choices such as the nominal frequency, initialization options, and visualization options.</p>
</body></html>"));
end System;
