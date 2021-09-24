within PowerGrids.Examples.Tutorial.IslandOperation;

model TwoGeneratorsLocalInitialization
  extends PowerGrids.Examples.Tutorial.IslandOperation.TwoGeneratorsOneReferenceGenerator(systemPowerGrids.initOpt = PowerGrids.Types.Choices.InitializationOption.localSteadyStateFixedPowerFlow);
equation

annotation(
    __OpenModelica_commandLineOptions = "--tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY"));
end TwoGeneratorsLocalInitialization;
