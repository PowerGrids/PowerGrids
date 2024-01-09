within PowerGrids.Electrical.Branches;
model TransformerWithTapChangerInterval
  extends BaseClasses.TapChangerPhaseShifterCommonVI(
    final isTwoPortAC = true,
    redeclare connector TerminalAC_a = Interfaces.TerminalAC_a,
    redeclare connector TerminalAC_b = Interfaces.TerminalAC_b,
    terminalAC_a(
      final computePF = computePF,
      terminalACPF(final v = vPF_a, final i = iPF_a)),
    terminalAC_b(
      final computePF = computePF,
      terminalACPF(final v = vPF_b, final i = iPF_b)));
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    final isLinear = true,
    final hasSubPF,
    SNom = UNomB^2/CM.abs(Complex(R,X)),
    redeclare PowerGrids.Electrical.PowerFlow.TransformerFixedRatioPF componentPF(
      UNomA = UNomA,
      UNomB = UNomB,
      SNom = SNom,
      rFixed = K[tapStart],
      thetaFixed = 0,      
      R = R,
      X = X,
      G = G,
      B = B));  
  extends BaseClasses.TapChangerPhaseShifterLogicInterval;

  parameter Types.PerUnit K[Ntap] "Array of transformer ratios for each tap";
  parameter Types.Voltage UMax "Maximum phase-to-phase voltage threshold for tap changer logic";
  parameter Types.Voltage UMin "Minimum phase-to-phase voltage threshold for tap changer logic";

initial equation
  assert(UMax > UMin, "Wrong phase-to-phase voltage interval");
  assert(UMax >= 0, "Maximum phase-to-phase voltage threshold must be positive");
  assert(UMin >= 0, "Minimum phase-to-phase voltage threshold must be positive");

equation
  // Tap changer applied on output phase-to-phase voltage module
  locked = false;
  running = true;
  valueUnderMin = portB.U < UMin;
  valueAboveMax = portB.U > UMax;
  k = Complex(K[pre(tap)])
    "pre() is required because k influences the triggering conditions
     of the state machine so it should be computed before the event takes place";
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>This model implements a transformer with a tap changer which takes a phase-to-phase voltage magnitude range, and tries to maintain the magnitude of phase-to-phase voltage at portB within that range.<div><br></div><div>It extends two classes:</div><div><ul><li><a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterCommon\">TapChangerPhaseShifterCommon</a>, which implements the model of the transformer,</li></ul><ul><li><a href=\"Modelica:///PowerGrids.Electrical.Branches.BaseClasses.TapChangerPhaseShifterLogicInterval\">TapChangerPhaseShifterLogicInterval</a>, which implements the logic that updates the position of the tap changer.</li></ul><div><br></div></div><div><br></div></body></html>"));

end TransformerWithTapChangerInterval;
