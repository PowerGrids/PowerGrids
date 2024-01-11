within PowerGrids.Electrical.Buses;

model Bus "Bus model"
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final SNom = 1,
    final PStart = 0,
    final QStart = 0,
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare PowerGrids.Electrical.PowerFlow.BusPF componentPF(
      UNom = UNom));
  extends Icons.Bus(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase);

equation
  port.i = Complex(0);
  
  annotation(
    Documentation(info = "<html>
Bus model, can be used to connect other components to its port.
</html>"));
end Bus;
