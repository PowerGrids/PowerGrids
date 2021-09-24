within PowerGrids.Examples.Tutorial.GridOperation.Controlled;
model ControlledGridWithReferenceCalculationSat "System under automatic control with automatic computation of set point offsets - saturation case"
  extends ControlledGridWithReferenceCalculation(AVR.VrMax = 0.5);
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}}, grid = {0.5, 0.5})),
  experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY"));
end ControlledGridWithReferenceCalculationSat;
