within PowerGrids.Electrical;
model System "System object"
  import PowerGrids.Types.Choices.InitializationOption;
  parameter SI.Frequency fNom = 50 "Nominal system frequency";
  parameter Boolean enableAssertions = true "=true, enables asserts in order to check the validity of the numerical solution" annotation(Evaluate = true, Dialog(group="Solution checking"));
  parameter SI.PerUnit VPuMin = 0.7 "min value of voltage in p.u at buses and sinchronous generators nodes" annotation(Dialog(group="Solution checking"));
  parameter SI.PerUnit VPuMax = 1.3 "max value of voltage in p.u at buses and sinchronous generators nodes" annotation(Dialog(group="Solution checking"));
  parameter SI.PerUnit IPuMax = 1.5 "max value of current in p.u that flows through the loads" annotation(Dialog(group="Solution checking"));
  parameter SI.PerUnit omegaPuMin = 0.9 "min value of frequency in p.u at generators nodes" annotation(Dialog(group="Solution checking"));
  parameter SI.PerUnit omegaPuMax = 1.1 "max value of frequency in p.u at generators nodes" annotation(Dialog(group="Solution checking"));
  parameter Boolean computePF = true "= true, computes the start value with the embedded power flow" annotation(Dialog(group = "Initialization"));
  parameter InitializationOption initOpt = InitializationOption.globalSteadyStateFixedSetPoints "Initialization type option"  annotation(Dialog(group = "Initialization"));
  parameter Boolean showDataOnDiagramsPu = true "=true, P,Q,V and phase are shown on the diagrams in per-unit (overrides the SI format)"  annotation(Dialog(group = "Visualization"));
  parameter Boolean showDataOnDiagramsSI = false "=true, P,Q,V and phase are shown on the diagrams in kV, MW, Mvar" annotation(Dialog(group = "Visualization"));
  parameter Boolean loadLowVoltageAsImpedance = false "= true, all loads work as fixed impedances below their VPuThr voltage threshold" annotation(Evaluate = true);
  parameter Boolean portVariablesPhases = true "Compute voltage and current phases for monitoring purposes" annotation(Evaluate = true, Dialog(group = "Visualization"));
  parameter Boolean computePowerBalance = true "Compute net balance of complex power entering two-port components" annotation(Dialog(group = "Visualization"));

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
