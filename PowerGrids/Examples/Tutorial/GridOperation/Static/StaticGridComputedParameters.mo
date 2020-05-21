within PowerGrids.Examples.Tutorial.GridOperation.Static;
model StaticGridComputedParameters "System operating in steady-state with computed inputs"
  extends StaticGrid(
    PmPu(y = -GEN.PStart / GEN.SNom),
    ufPuIn(y = GEN.ufPuInStart));
  annotation (
    Diagram(coordinateSystem(extent={{-80,-40},{80,40}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"));
end StaticGridComputedParameters;
