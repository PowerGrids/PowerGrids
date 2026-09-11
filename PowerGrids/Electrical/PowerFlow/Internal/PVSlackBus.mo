within PowerGrids.Electrical.PowerFlow.Internal;

model PVSlackBus
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends BaseClasses.OnePortACPF(final isSlackBus = isRefNode, final portVariablesPhases = true);

  parameter Boolean isRefNode = false "=true, if the generator shall become the slack node in the EPF" annotation(Evaluate = true);
  parameter Types.ActivePower P = SNom "Active power entering the bus";
  parameter Types.Voltage U = UNom "Absolute value of phase-to-phase voltage";
  parameter Types.Angle UPhase = 0 "Phase of voltage phasor";

  final Types.ActivePower PSlack = port.P if isRefNode "slack active power leaving system through bus";
  final Types.ReactivePower QSlack = port.Q if isRefNode "slack reactive power leaving system through bus";

equation
  if isRefNode then
    port.u = CM.fromPolar(U, UPhase) "Set initial bus voltage, phase-to-phase";
  else
    port.P = P;
    port.U = U;
  end if;

end PVSlackBus;