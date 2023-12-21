within PowerGrids.Electrical.Buses;
model InfiniteBus "Infinite bus with internal impedance"
  extends PowerGrids.Electrical.BaseComponents.InfiniteBusVI(
    final isOnePortAC = false,
    final isOnePortACBus = true,
    generatorConvention = true,
    redeclare connector TerminalAC = Interfaces.TerminalACBus,
    terminalAC(
      computePF = computePF,
      terminalACPF(v = vPF, i = iPF)),
    generatorConvention = true);
  extends PowerGrids.Electrical.BaseClasses.OnePortACBus(
    generatorConvention = true,
    final hasSubPF,
    final localInit,
    redeclare PowerGrids.Electrical.PowerFlow.InfiniteBusPF componentPF(
      SNom = SNom, 
      UNom = UNom,
      URef = URef,
      UPhase = UPhase,
      R = R,
      X = X));

equation
  // Overconstrained connector
  Connections.potentialRoot(terminalAC.omegaRefPu);
  if Connections.isRoot(terminalAC.omegaRefPu) then
     terminalAC.omegaRefPu = 1;
  end if;
  
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}),
         graphics = {Text(origin = {84, 32}, extent = {{-20, 28}, {20, -28}}, textString = "", fontName = "Symbol")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>Infinite bus model with constant voltage e and internal impedance Z. The port voltage is v = e + Zi, where i is the current entering the bus. The default value of the series impedance Z = R + jX is zero.
</body></html>"));
end InfiniteBus;
