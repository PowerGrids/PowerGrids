within PowerGrids.Electrical.BaseClasses;

partial model TwoPortACPF
  extends TwoPortACVI(
    redeclare replaceable connector TerminalAC_a = PowerGrids.Interfaces.TerminalACPF_a,
    redeclare replaceable connector TerminalAC_b = PowerGrids.Interfaces.TerminalACPF_b);
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
