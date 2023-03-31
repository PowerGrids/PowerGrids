within PowerGrids.Examples.Tutorial.IslandOperation;

model TwoGeneratorsFixedFrequencyReference
  extends TwoGeneratorsOneReferenceGenerator(systemPowerGrids.referenceFrequency = PowerGrids.Types.Choices.ReferenceFrequency.nominalFrequency);
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY"));
end TwoGeneratorsFixedFrequencyReference;
