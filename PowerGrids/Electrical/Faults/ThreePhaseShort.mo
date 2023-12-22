within PowerGrids.Electrical.Faults;

model ThreePhaseShort
  extends Icons.Short;
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare PowerGrids.Electrical.PowerFlow.SlackBus componentPF(
      UNom = UNom,
      SNom = SNom,
      U = 0,
      UPhase = 0));
equation
  terminalAC.v = Complex(0);  
end ThreePhaseShort;
