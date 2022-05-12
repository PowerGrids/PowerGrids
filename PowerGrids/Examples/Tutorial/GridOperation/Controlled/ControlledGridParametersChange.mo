within PowerGrids.Examples.Tutorial.GridOperation.Controlled;
model ControlledGridParametersChange "Variant of ControlledGridWithPSS"
  extends Modelica.Icons.Example;
  extends Examples.Tutorial.GridOperation.Controlled.ControlledGridWithPSS(
    TGOV(T1 = 0.4 "Governor new time constant"),
    AVR(Ka = 210 "Overall new equivalent gain"));
annotation (
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-140, 60}, {80, -60}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"));
end ControlledGridParametersChange;
