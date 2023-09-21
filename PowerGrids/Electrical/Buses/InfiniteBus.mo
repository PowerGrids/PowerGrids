within PowerGrids.Electrical.Buses;
model InfiniteBus "Infinite bus with internal impedance"
  extends PowerGrids.Electrical.BaseClasses.OnePortACBus(
    redeclare PowerGrids.Electrical.PowerFlow.InfiniteBusPF componentPF);
  extends PowerGrids.Electrical.BaseComponents.InfiniteBusVI(
    redeclare PowerGrids.Interfaces.TerminalAC terminalAC);

equation
  // Overconstrained connector
  Connections.potentialRoot(terminalAC.omegaRefPu);
  if Connections.isRoot(terminalAC.omegaRefPu) then
     terminalAC.omegaRefPu = 1;
  end if;
  
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>Infinite bus model with constant voltage e and internal impedance Z. The port voltage is v = e + Zi, where i is the current entering the bus. The default value of the series impedance Z = R + jX is zero.
</body></html>"));
end InfiniteBus;
