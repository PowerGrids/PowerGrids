within PowerGrids.Electrical.PowerFlow;

model InfiniteBusPF
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF;
  extends PowerGrids.Electrical.BaseComponents.InfiniteBusVI(
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC);

end InfiniteBusPF;
