within PowerGrids.Electrical.Buses;

model InfiniteBus "Infinite bus with prescribed voltage"
  extends Icons.Bus(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase);
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final generatorConvention = true,
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare PowerGrids.Electrical.PowerFlow.InfiniteBusPF componentPF(
      SNom = SNom, UNom = UNom, URef = URef, UPhase = UPhase));
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  parameter Types.Voltage URef = UNom "Phase-to-phase voltage of ideal voltage generator";
  parameter Types.Angle UPhase = 0 "Voltage phase angle of ideal voltage generator";
equation
  port.v = CM.fromPolar(URef/sqrt(3), UPhase);
  // Overconstrained connector: set omegaRefPu if selected as root node
  Connections.potentialRoot(terminalAC.omegaRefPu);
  if Connections.isRoot(terminalAC.omegaRefPu) then
    terminalAC.omegaRefPu = 1;
  end if;
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}), graphics = {Text(origin = {59, 48}, extent = {{-39, 68}, {39, -68}}, textString = "", fontName = "Symbol")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body>Infinite bus model with constant voltage.</body></html>"));
end InfiniteBus;
