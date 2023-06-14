within PowerGrids.Examples.Tutorial.IslandOperation;

model TwoGeneratorsLocalInitialization
  extends PowerGrids.Examples.Tutorial.IslandOperation.TwoGeneratorsOneReferenceGenerator(systemPowerGrids.initOpt = PowerGrids.Types.Choices.InitializationOption.localSteadyStateFixedPowerFlow);
equation

annotation(
    __OpenModelica_commandLineOptions = "--tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv="LOG_INIT_HOMOTOPY"),
  Diagram(coordinateSystem(extent = {{-120, 60}, {140, -40}})),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end TwoGeneratorsLocalInitialization;
