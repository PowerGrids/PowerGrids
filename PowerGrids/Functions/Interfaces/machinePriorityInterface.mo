within PowerGrids.Functions.Interfaces;

function machinePriorityInterface
  extends Modelica.Icons.Function;
  input Types.ActivePower PNom "machine nominal active power";
  output Integer priority "machine priority for omegaRefPu (0=maxpriority)";
end machinePriorityInterface;
