within PowerGrids.Electrical.PowerFlow;

model InfiniteBusPF
  extends PowerGrids.Electrical.BaseComponents.InfiniteBusVI(
    redeclare connector TerminalAC = Interfaces.TerminalACPF);
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF(final isLinear = true);

  parameter Types.Voltage URef = UNom "Phase-to-phase voltage of ideal voltage generator";
  parameter Types.Angle UPhase = 0 "Voltage phase angle of ideal voltage generator";
equation
  v = CM.fromPolar(URef/sqrt(3), UPhase);
annotation(
    Icon(graphics = {Text(origin = {84, 32}, extent = {{-20, 28}, {20, -28}}, textString = "", fontName = "Symbol")}));
end InfiniteBusPF;
