within PowerGrids.Examples.IEEE14bus;

model IEEE14busLoad2Variation "Simulation of a load increase on load 2 at t = 1 s"
  extends IEEE14busStaticNetwork(
    Load2(
      PRef = Load2.PRefConst*(if time < 1 then 1 else 2) "Active power consumption at reference voltage",
      QRef = Load2.QRefConst*(if time < 1 then 1 else 2) "Reactive power consumption at reference voltage"      
    ));
equation

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5}, initialScale = 0.1), graphics = {Text(origin = {-43, -97}, lineColor = {0, 0, 255}, extent = {{-41, 7}, {41, -7}}, textString = "Load2 changed by modifiers")}),
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-6, Interval = 0.04));
end IEEE14busLoad2Variation;
