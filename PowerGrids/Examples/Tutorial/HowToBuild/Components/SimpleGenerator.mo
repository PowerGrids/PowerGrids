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
  parameter Types.PerUnit rPu "Per unit stator resistance";
  parameter Types.Voltage UPF = UNom "Voltage magnitude, phase-to-phase, to be used to compute the embedded PF" annotation(Dialog(tab = "Initialization", enable = computePF));
  parameter Types.ActivePower PPF = -PNom "Active power to be used to compute the embedded PF (positive entering)" annotation(Dialog(tab = "Initialization", enable = computePF));
  constant Types.PerUnit ePu = 1 "Constant induced e.m.f";
  
  Types.PerUnit omegaPu "Per-unit rotational speed";
  Modelica.Blocks.Interfaces.RealInput Pm(unit = "W", displayUnit = "MW") "Input mechanical power in W" annotation(
    Placement(transformation(origin = {-68, -54}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-65, -59}, extent = {{-15, -15}, {15, 15}})));
initial equation
  // Steady-state conditions
  omegaPu = 1;
  der(omegaPu) = 0;
  
equation
  // Swing equation
  der(theta) = (omegaPu - terminalAC.omegaRefPu)*systemPowerGrids.omegaNom;
  2*H*der(omegaPu) = (Pm + port.P)/PNom;

  // Electrical equations in Park's coordinates
  ePu + rPu*idPu = udPu;
        rPu*iqPu = uqPu;

  // Handling of the embedded power flow
  Connections.potentialRoot(terminalAC.omegaRefPu, 1);
  if Connections.isRoot(terminalAC.omegaRefPu) then
    terminalAC.omegaRefPu = omegaPu;
  end if;
end SimpleGenerator;
