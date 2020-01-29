within PowerGrids.Electrical.Buses;

model Bus "Bus model"
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final PStart = 0,
    final QStart = 0);
  extends Icons.Bus;

equation
  port.i = Complex(0);
  
  annotation(
    Documentation(info = "<html>
Bus model, can be used to connect other components to its port.
</html>"));
end Bus;
