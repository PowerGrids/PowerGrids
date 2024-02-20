within PowerGrids.Electrical.Buses;

model Bus "Bus model"
  extends Icons.Bus(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final SNom = 1,
    final PStart = 0,
    final QStart = 0,
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare PowerGrids.Electrical.PowerFlow.BusPF componentPF(
      UNom = UNom));

equation
  port.i = Complex(0);
  
  annotation(
    Documentation(info = "<html>
Bus model, can be used to connect other components to its port.
</html>"));
end Bus;
