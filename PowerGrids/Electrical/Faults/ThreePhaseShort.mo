within PowerGrids.Electrical.Faults;

model ThreePhaseShort
  extends Icons.Short;
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    redeclare PowerGrids.Electrical.PowerFlow.SlackBus componentPF(
      UNom = UNom,
      SNom = SNom,
      U = 0,
      theta = 0)) annotation(
    Placement(visible = true, transformation(origin = {-54, 48}, extent = {{-100, -100}, {100, 100}}, rotation = 0), iconTransformation(origin = {-3.55271e-15, 4.44089e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  terminalAC.v = Complex(0);  
end ThreePhaseShort;
