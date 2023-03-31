within PowerGrids.Examples.Tutorial.GridOperation.LoadChange;
model LoadChangeByModifierUsingExtends "Load step response specified by modifiers by inheritance from the static system"
  extends Examples.Tutorial.GridOperation.Static.StaticGridComputedParameters(
    GRIDL(
      PRef = GRIDL.PRefConst*(if time < 2 then 1 else 1.05) "Active power consumption at reference voltage",
      QRef = GRIDL.QRefConst*(if time < 2 then 1 else 1.04) "Reactive power consumption at reference voltage"));
annotation (
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.008),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY"),
    Diagram(coordinateSystem(extent={{-80,-60},
            {80,40}}), graphics={                                                               Text(origin={
              -10.2,-46},                                                                                                 extent={{
              -59.8,8},{70.2,-12}},
          textString="To see load change in OpenModelica look at text view",
          lineColor={0,0,0})}));
end LoadChangeByModifierUsingExtends;
