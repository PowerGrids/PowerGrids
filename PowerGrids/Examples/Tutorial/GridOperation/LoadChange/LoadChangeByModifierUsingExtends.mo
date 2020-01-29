within PowerGrids.Examples.Tutorial.GridOperation.LoadChange;
model LoadChangeByModifierUsingExtends "Load step response specified by modifiers by inheritance from the static system"
  extends Examples.Tutorial.GridOperation.Static.StaticGridComputedParameters(
    GRIDL(
      PRef = GRIDL.PRefConst*(if time < 2 then 1 else 1.05) "Active power consumption at reference voltage",
      QRef = GRIDL.QRefConst*(if time < 2 then 1 else 1.04) "Reactive power consumption at reference voltage"
    )
  );  
annotation(
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.008),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"),  Diagram(coordinateSystem(extent = {{-100, -100}, {180, 100}}, grid = {0.5, 0.5}), graphics = {Text(origin = {106, -48}, extent = {{-46, 8}, {54, -12}}, textString = "Load change is made in text view")}));
end LoadChangeByModifierUsingExtends;
