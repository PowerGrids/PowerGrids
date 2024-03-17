within PowerGrids.Electrical.BaseClasses;

partial model OnePortACPF
  extends OnePortACVI(
    redeclare replaceable connector TerminalAC = PowerGrids.Interfaces.TerminalACPF);
  Boolean isSlackBus = false "=true, if the componentsPF is a slack bus";
  final Modelica.Blocks.Interfaces.BooleanOutput isSlackBusOut = isSlackBus "output connector to propagate the value of the flag isSlackBus";

protected
  // The following parameter and variables are used as workaround to force the computation of
  // the Embedded Power Flow before to start the initialization, in order to proper compute the start
  // values of the initialization itself.
  // This workaround in necessary because some Modelica compilers does not correctly implement the dependency
  // introduced by the start attributes (see Modelica Specificatoin - section 8.6).
  parameter Real zero = 0 annotation(Evaluate=false, HideResult=true);
  final Real Pepf = PStart;
  final Real Qepf = QStart;
  final Real Uepf = UStart;
  final Real UPhepf = UPhaseStart;

initial equation
  UStartPF = UNom;
  UPhaseStartPF = 0;
  PStartPF = 0;
  QStartPF = 0;

equation
  port.v = terminalAC.v + zero*Complex(Pepf+Qepf+Uepf+UPhepf) "the part multiplied by zero is to force the EPF computation before to start the initialization";
  port.i = terminalAC.i + zero*Complex(Pepf+Qepf+Uepf+UPhepf) "the part multiplied by zero is to force the EPF computation before to start the initialization";
annotation(
    Documentation(info = "<html>
<p>This is the base class for all the PF components with an AC terminal.</p>
</html>"));    
end OnePortACPF;
