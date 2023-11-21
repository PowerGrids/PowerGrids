within PowerGrids.Examples.Tutorial.HowToBuild.Components;

model SimpleGenerator
  import Modelica.ComplexMath;
  extends PowerGrids.Icons.Machine;  
  extends PowerGrids.Electrical.BaseClasses.OnePortACdqPU(
    redeclare PowerGrids.Electrical.PowerFlow.PVBus componentPF(
      UNom = UNom,
      SNom = SNom,
      P = PPF,
      U = UPF),
    final generatorConvention = true, 
    final hasSubPF);
  
  outer Electrical.System systemPowerGrids "reference to global system setup object";
  parameter Types.Power PNom "Nominal active power";
  parameter Types.Time H "Time constant of generator";
  parameter Types.Voltage UPF = UNom "Voltage magnitude, phase-to-phase, to be used to compute the embedded PF";
  parameter Types.ActivePower PPF = PNom "Active power to be used to compute the embedded PF (positive entering)";
  
  Types.PerUnit omegaPu "Per-unit rotational speed";
  Modelica.Blocks.Interfaces.RealInput Pm "Input mechanical power in W" annotation(
    Placement(transformation(origin = {-68, -54}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-65, -59}, extent = {{-15, -15}, {15, 15}})));
initial equation
  // Steady-state conditions
  der(theta) = 0;
  der(omegaPu) = 0;
  
equation
  // Swing equation
  der(theta) = (omegaPu - 1)*systemPowerGrids.omegaNom;
  2*H*der(omegaPu) = (Pm - port.P)/PNom;

  // Electrical equations
  udPu = 1;
  uqPu = 0;

  // Handling of the embedded power flow
  Connections.potentialRoot(terminalAC.omegaRefPu, 1);
  if Connections.isRoot(terminalAC.omegaRefPu) then
    terminalAC.omegaRefPu = omegaPu;
  end if;
end SimpleGenerator;
