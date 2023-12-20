within PowerGrids.Electrical.BaseClasses;

model TwoPortACPF
  extends TwoPortACVI(
    redeclare replaceable connector TerminalAC_a = PowerGrids.Interfaces.TerminalACPF_a,
    redeclare replaceable connector TerminalAC_b = PowerGrids.Interfaces.TerminalACPF_b,
    portA(
      final UStart = UNomA,
      final UPhaseStart = 0,
      final PStart = 0,
      final QStart = 0) "AC port - terminalAC_a",
    portB(
      final UStart = UNomB,
      final UPhaseStart = 0,
      final PStart = 0,
      final QStart = 0) "AC port - terminalAC_b");
  equation
    portA.v = terminalAC_a.v;
    portB.v = terminalAC_b.v;
    portA.i = terminalAC_a.i;
    portB.i = terminalAC_b.i;
  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the PW components with two AC terminals.</p>
</html>"));
end TwoPortACPF;
