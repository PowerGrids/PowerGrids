within PowerGrids.Electrical.Buses;

model Bus "Bus model"
  extends PowerGrids.Electrical.BaseClasses.OnePortACBus(
    final SNom = 1,
    final hasSubPF = false,
    redeclare PowerGrids.Electrical.PowerFlow.BusPF componentPF(UNom = UNom));
  extends Icons.Bus;

equation
  port.i = Complex(0);
  
  annotation(
    Documentation(info = "<html>
Bus model, can be used to connect other components to its port.
</html>"));
end Bus;
