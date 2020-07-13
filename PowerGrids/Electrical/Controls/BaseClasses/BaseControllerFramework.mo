within PowerGrids.Electrical.Controls.BaseClasses;

block BaseControllerFramework "Base framework for all controllers such as AVR, PSS, etc."
  final parameter Boolean fixInitialControlledVariableDefault = 
    if (systemPowerGrids.initOpt == Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow or
        systemPowerGrids.initOpt == Types.Choices.InitializationOption.localSteadyStateFixedPowerFlow)
    then true else false
    "= true adds extra initial equation to fix controlled variable" annotation(
    Dialog(tab = "Initialization"));
  parameter Boolean fixInitialControlledVariable = fixInitialControlledVariableDefault
    "= true adds extra initial equation to fix controlled variable" annotation(
    Dialog(tab = "Initialization"));

  outer System systemPowerGrids "Reference to system object for system-level defaults";
  annotation(
    Documentation(info = "<html>
Provides the base framework for all controllers (e.g. governors, AVRs) where one could want to fix the initial value of the controlled output based on the power flow start values.
</html>"));
end BaseControllerFramework;
