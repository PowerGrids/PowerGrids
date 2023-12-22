within PowerGrids.Electrical.PowerFlow;

model InfiniteBusPF
  extends PowerGrids.Electrical.BaseComponents.InfiniteBusVI(
    redeclare connector TerminalAC = Interfaces.TerminalACPF);
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF(
    final isLinear = true);
annotation(
    Icon(graphics = {Text(origin = {84, 32}, extent = {{-20, 28}, {20, -28}}, textString = "", fontName = "Symbol")}));
end InfiniteBusPF;
