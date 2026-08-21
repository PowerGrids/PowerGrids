within PowerGrids.Electrical.Machines.BaseClasses;

partial model MachineBase
  extends Electrical.BaseClasses.OnePortACdqPu(
    generatorConvention = true,
    final localInit = if initOpt == InitializationOption.localSteadyStateFixedPowerFlow then LocalInitializationOption.PV else LocalInitializationOption.none,
    final hasSubPF,
    final isLinear = false,
    PStart = if computePF then PStartPF else -SNom,
    redeclare PowerGrids.Electrical.PowerFlow.Internal.PVSlackBus componentPF(
      isRefNodeEPF = isRefNodeEPF,
      UNom = UNom,
      SNom = SNom,
      UPhase = UPhasePF,
      P = PPF,
      U = UPF));

  import PowerGrids.Types.Choices.InitializationOption;
  import PowerGrids.Types.Choices.LocalInitializationOption;
  parameter Types.ActivePower PNom = SNom "Nominal active (turbine) power";
  parameter Types.Choices.InitializationOption initOpt = systemPowerGrids.initOpt "Initialization option" annotation(
    Dialog(tab = "Initialization"));
  parameter Boolean useExtraInitEquationsPV = true "=true, if additional initial equation to prescribe P and V shall be used" annotation(
    Dialog(tab = "Embedded PF", enable = not isRefNodeEPF),
    choices(checkBox = true));
  parameter Boolean isRefNodeEPF = false "=true, if the generator shall become the slack node in the EPF" annotation(
    Dialog(tab = "Embedded PF", enable = not useExtraInitEquationsPV),
    choices(checkBox = true));
  parameter Types.Angle UPhasePF = 0 "Voltage phase to be used to compute the embedded PF" annotation(
    Dialog(group = "Embedded PF", enable = computePF and isRefNodeEPF));
  parameter Types.Voltage UPF = UNom "Voltage magnitude, phase-to-phase, to be used to compute the embedded PF" annotation(
    Dialog(tab = "Embedded PF", enable = computePF and not isRefNodeEPF));
  parameter Types.ActivePower PPF = -SNom "Active power to be used to compute the embedded PF (positive entering), if the PVBus is used as embedded PF component" annotation(
    Dialog(tab = "Embedded PF", enable = computePF and not isRefNodeEPF));
  parameter Integer priority = integer(100 - 10*log10(PNom)) "Priority level used to select the machine to be used as frrequency reference (0=higher priority)" annotation(
    Evaluate = true);

  Modelica.Blocks.Interfaces.RealOutput omegaPu(final start = 1) "Angular frequency in p.u." annotation(
    Placement(transformation(origin = {106, -20}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {60, -30}, extent = {{-10, -10}, {10, 10}})));

initial equation

  // Equations to calculate the external offset for PmPu and ufPu if the EPF is
  // active and the node is the slack in the EPF
  if computePF and isRefNodeEPF then
    port.u = CM.fromPolar(UStart, UPhaseStart) "Set initial bus voltage, phase-to-phase";
  end if;

  // Equations to calculate the external offset for PmPu and ufPu if the EPF is
  // active and the node is a PVbus
  if computePF and useExtraInitEquationsPV and not isRefNodeEPF then
    port.P = PStart;
    port.VPu = UStart/UNom;
  end if;

equation
  // Overconstrained connector
  if isRefNodeEPF then
    Connections.root(terminalAC.omegaRefPu);
  else
    Connections.potentialRoot(terminalAC.omegaRefPu, integer(priority));
  end if;

  if Connections.isRoot(terminalAC.omegaRefPu) then
    terminalAC.omegaRefPu = omegaPu;
  end if;

end MachineBase;