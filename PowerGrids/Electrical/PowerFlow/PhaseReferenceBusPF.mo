within PowerGrids.Electrical.PowerFlow;

model PhaseReferenceBusPF
  extends Icons.BusPQ(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase, PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends BaseClasses.OnePortACPF(final isSlackBus = false);
  parameter Types.Voltage U = UNom "Voltage magnitude, phase-to-phase";
  parameter Types.Angle UPhase = 0 "Phase of voltage phasor";
  parameter Boolean setPhaseOnly = false "= true, if only the initial phase has to be set";
  final parameter Types.ComplexPerUnit nStart = CM.fromPolar(1, UPhase) "Unit phasor with angle UPhaseStart";

equation
  // NOTE: this component MUST be used togheter with a slack bus in which the flag
  // setPhase is set to false, so that this component provides the two equations to set
  // the reference phase to the network instead of the slack bus.
  // For this reason this component cannot be balanced, it has two more equations than variables.

  if not setPhaseOnly then
    port.u = CM.fromPolar(U, UPhase) "Set initial bus voltage, phase-to-phase";
  else
    port.u.re*nStart.im = port.u.im*nStart.re "port.u has the same phase as nStart";
  end if;

  port.i = Complex(0);

annotation(
    Icon(graphics = {Text(origin = {60, 42}, extent = {{-40, 20}, {40, -40}}, horizontalAlignment = TextAlignment.Right, textString = "R")}));
end PhaseReferenceBusPF;