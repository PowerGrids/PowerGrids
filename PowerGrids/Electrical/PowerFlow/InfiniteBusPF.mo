within PowerGrids.Electrical.PowerFlow;

model InfiniteBusPF
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF;
  extends PowerGrids.Electrical.BaseComponents.InfiniteBusVI(
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC);annotation(
    Icon(graphics = {Text(origin = {84, 32}, extent = {{-20, 28}, {20, -28}}, textString = "", fontName = "Symbol")}));

end InfiniteBusPF;
