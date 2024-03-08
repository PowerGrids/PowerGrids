within PowerGrids.Electrical.BaseClasses;

partial model OnePortACPF
  extends OnePortACVI(
    redeclare replaceable connector TerminalAC = PowerGrids.Interfaces.TerminalACPF);
  constant Boolean isSlackBus = false "=true, if the componentsPF is a slack bus";
initial equation
  UStartPF = UNom;
  UPhaseStartPF = 0;
  PStartPF = 0;
  QStartPF = 0;

equation
  port.v = terminalAC.v;
  port.i = terminalAC.i;
annotation(
    Documentation(info = "<html>
<p>This is the base class for all the PF components with an AC terminal.</p>
</html>"));    
end OnePortACPF;
