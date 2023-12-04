within PowerGrids.Examples.Tutorial.IslandOperation;

model TwoGeneratorsLocalInitialization
  extends TwoGenerators(systemPowerGrids.initOpt = PowerGrids.Types.Choices.InitializationOption.localSteadyStateFixedPowerFlow);

annotation(
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-6, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv="LOG_INIT_HOMOTOPY"),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})));end TwoGeneratorsLocalInitialization;
