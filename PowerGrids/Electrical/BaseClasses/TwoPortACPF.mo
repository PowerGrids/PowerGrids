within PowerGrids.Electrical.BaseClasses;

model TwoPortACPF
  extends TwoPortACVI(
    redeclare PowerGrids.Interfaces.TerminalACPF_a terminalAC_a(
      v(re(start = portA.vStart.re), im(start = portA.vStart.im)),
      i(re(start = portA.iStart.re), im(start = portA.iStart.im))),
    redeclare PowerGrids.Interfaces.TerminalACPF_b terminalAC_b(
      v(re(start = portB.vStart.re), im(start = portB.vStart.im)),
      i(re(start = portB.iStart.re), im(start = portB.iStart.im))),
    portA(final v = terminalAC_a.v, final i = terminalAC_a.i,
          final UNom = UNomA, final SNom = SNom,
          final portVariablesPhases = portVariablesPhases,
          final generatorConvention = false,
          final UStart = UNomA,
          final UPhaseStart = 0,
          final PStart = 0,
          final QStart = 0) "AC port - terminalAC_a",
    portB(final v = terminalAC_b.v, final i = terminalAC_b.i,
          final UNom = UNomB, final SNom = SNom,
          final portVariablesPhases = portVariablesPhases,
          final generatorConvention = false,
          final UStart = UNomB,
          final UPhaseStart = 0,
          final PStart = 0,
          final QStart = 0) "AC port - terminalAC_b");
  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the PW components with two AC terminals.</p>
</html>"));
end TwoPortACPF;
