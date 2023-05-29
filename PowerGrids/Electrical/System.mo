within PowerGrids.Electrical;
model System "System object"
  replaceable function machinePriority = PowerGrids.Functions.machinePriority
    constrainedby PowerGrids.Functions.Interfaces.machinePriorityInterface
    annotation(choicesAllMatching = true);

  import PowerGrids.Types.Choices.ReferenceFrequency;
  import PowerGrids.Types.Choices.InitializationOption;
  parameter SI.Frequency fNom = 50 "Nominal system frequency";
  parameter ReferenceFrequency referenceFrequency = 
    ReferenceFrequency.nominalFrequency "Choice of reference frequency for generators";
  parameter InitializationOption initOpt = 
    InitializationOption.globalSteadyStateFixedSetPoints "Initialization option";
  parameter Boolean loadLowVoltageAsImpedance = false "= true, all loads shall work as a fixed-impedances at low-voltage conditions" annotation(Evaluate = true);
  parameter Boolean portVariablesPhases = false "Compute voltage and current phases for monitoring purposes only, it can be locally overridden" annotation(Evaluate = true);
  final parameter SI.AngularVelocity omegaNom = fNom*2*Modelica.Constants.pi "Nominal system angular frequency";

initial equation
  assert(not referenceFrequency == ReferenceFrequency.adaptiveReferenceGenerators,
   "Adaptive reference generators option not yet implemented");

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
<p>If <code>referenceFrequency == ReferenceFrequency.nominalFrequency</code> (default option), the frequency for all phasor frames is fixed to the nominal frequency of the system. This option is recommended for synchronous systems that are connected to an infinite bus, because the frequency of all their ports cannot deviate from the nominal one for a sustained amount of time, if the system does not lose synchronism. In case of isolated systems with droop control, the frequency can stray away from the nominal value for long time intervals, which will cause all phasors to rotate all the time also when the system gets close to steady-state conditions. If a variable step-size solver is used, this will unnecessarily slow down the simulation. In this case, the next option is recommended.</p>
<p>If <code>referenceFrequency == ReferenceFrequency.fixedReferenceGenerator</code>, the <code>omegaRefIn</code> input should be connected to the frequency output of the reference synchronous generator. The system object then makes this frequency available to all other components via the inner/outer construct. This option guarantees that the phasors will be constant when the system reaches a steady state, even if the frequency is different from the nominal value.</p>
<p>The <code>referenceFrequency == ReferenceFrequency.adaptiveReferenceGenerators</code> option will be implemented in the future, allowing to dynamically track the  islanding and reconnection of synchronous sub-systems in the model, providing the corresponding reference frequency signals to each sub-system.</p>
</body></html>"));
end System;
