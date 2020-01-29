within PowerGrids.Examples.Tutorial.GridOperation.Static;
model StaticGridComputedParameters "System operating in steady-state with computed inputs"
  extends StaticGrid(
    PmPu(y = -GEN.PStart / GEN.SNom),
    ufPuIn(y = GEN.ufPuInStart)
  );
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {180, 100}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"));  
end StaticGridComputedParameters;
