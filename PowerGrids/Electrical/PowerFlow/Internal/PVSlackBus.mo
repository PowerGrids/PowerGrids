within PowerGrids.Electrical.PowerFlow.Internal;

model PVSlackBus
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends BaseClasses.OnePortACPF(final isSlackBus = isRefNodeEPF, final portVariablesPhases = true);

  parameter Boolean isRefNodeEPF = false "=true, if the generator shall become the slack node in the EPF" annotation(Evaluate = true);
  parameter Types.ActivePower P = SNom "Active power entering the bus";
  parameter Types.Voltage U = UNom "Absolute value of phase-to-phase voltage";
  parameter Types.Angle UPhase = 0 "Phase of voltage phasor";

  Types.ActivePower PSlack "slack active power leaving system through bus";
  Types.ReactivePower QSlack "slack reactive power leaving system through bus";

equation
  if isRefNodeEPF then
    port.u = CM.fromPolar(U, UPhase) "Set initial bus voltage, phase-to-phase";
    port.P = PSlack;
    port.Q = QSlack;
  else
    port.P = P;
    port.U = U;
    PSlack = 0;
    QSlack = 0;
  end if;

end PVSlackBus;