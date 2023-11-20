within PowerGrids.Examples.Tutorial.HowToBuild.Components;

model SimpleGenerator
  extends PowerGrids.Electrical.BaseClasses.OnePortACdqPU(
    final generatorConvention = true, 
    final hasSubPF,
    redeclare PowerGrids.Electrical.PowerFlow.PVBus componentPF(
      UNom = UNom,
      SNom = SNom,
      P = PPF,
      U = UPF));
  extends PowerGrids.Icons.Machine;  
  import Modelica.ComplexMath;
  
  parameter Types.Voltage UPF = UNom "Voltage magnitude, phase-to-phase, to be used to compute the embedded PF";
  parameter Types.ActivePower PPF = 0 "Active power to be used to compute the embedded PF (positive entering)";  equation
// Overconstrained connector
  Connections.potentialRoot(terminalAC.omegaRefPu, 1);
  if Connections.isRoot(terminalAC.omegaRefPu) then
    terminalAC.omegaRefPu = 1;
  end if;
  annotation(
    Documentation);end SimpleGenerator;
