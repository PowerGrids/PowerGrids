within PowerGrids.Electrical.BaseClasses;

partial model TwoPortACPF
  extends TwoPortACVI(
    redeclare replaceable connector TerminalAC_a = PowerGrids.Interfaces.TerminalACPF_a,
    redeclare replaceable connector TerminalAC_b = PowerGrids.Interfaces.TerminalACPF_b);

protected
  // The following parameter and variables are used as workaround to force the computation of
  // the Embedded Power Flow before to start the initialization, in order to proper compute the start
  // values of the initialization itself.
  // This workaround in necessary because some Modelica compilers does not implement the dependency
  // introduced by the start attributes (see Modelica Specificatoin - section 8.6).
  parameter Real zero = 0 annotation(Evaluate=false, HideResult=true);
  final Real PepfA = PStartA;
  final Real QepfA = QStartA;
  final Real UepfA = UStartA;
  final Real UPhepfA = UPhaseStartA;
  final Real PepfB = PStartB;
  final Real QepfB = QStartB;
  final Real UepfB = UStartB;
  final Real UPhepfB = UPhaseStartB;

initial equation
  UStartAPF = UNomA;
  UPhaseStartAPF = 0;
  PStartAPF = 0;
  QStartAPF = 0;
  UStartBPF = UNomB;
  UPhaseStartBPF = 0;
  PStartBPF = 0;
  QStartBPF = 0;
  equation
    portA.v = terminalAC_a.v + zero*Complex(PepfA+QepfA+UepfA+UPhepfA) "the part multiplied by zero is to force the EPF computation before to start the initialization";
    portB.v = terminalAC_b.v + zero*Complex(PepfB+QepfB+UepfB+UPhepfB) "the part multiplied by zero is to force the EPF computation before to start the initialization";
    portA.i = terminalAC_a.i + zero*Complex(PepfA+QepfA+UepfA+UPhepfA) "the part multiplied by zero is to force the EPF computation before to start the initialization";
    portB.i = terminalAC_b.i + zero*Complex(PepfB+QepfB+UepfB+UPhepfB) "the part multiplied by zero is to force the EPF computation before to start the initialization";
  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the PW components with two AC terminals.</p>
</html>"));
end TwoPortACPF;
