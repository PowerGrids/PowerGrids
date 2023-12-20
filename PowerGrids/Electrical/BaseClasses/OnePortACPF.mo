within PowerGrids.Electrical.BaseClasses;

model OnePortACPF
  extends OnePortACVI(
    redeclare replaceable connector TerminalAC = PowerGrids.Interfaces.TerminalACPF,
    port(
      final UStart = UNom,
      final UPhaseStart = 0,
      final PStart = 0,
      final QStart = 0));
  equation
    port.v = terminalAC.v;
    port.i = terminalAC.i;
  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the PF components with an AC terminal.</p>
</html>"));    
end OnePortACPF;
