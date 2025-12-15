within PowerGrids.Electrical.PowerFlow;

model InfiniteBusPF "Infinite bus with prescribed voltage"
  extends Icons.Bus(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase);
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF(final isLinear = true);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  parameter Types.Voltage URef = UNom "Phase-to-phase voltage of ideal voltage generator";
  parameter Types.Angle UPhase = 0 "Voltage phase angle of ideal voltage generator";
equation
  port.v = CM.fromPolar(URef/sqrt(3), UPhase);
annotation(
    Icon(graphics = {Text(origin = {84, 32}, extent = {{-20, 28}, {20, -28}}, textString = "", fontName = "Symbol")}));
end InfiniteBusPF;
