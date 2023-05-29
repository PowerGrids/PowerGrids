within PowerGrids.Functions;

function machinePriority
  extends PowerGrids.Functions.Interfaces.machinePriorityInterface;
algorithm
  priority := integer(100 - 10*log10(PNom));
end machinePriority;
