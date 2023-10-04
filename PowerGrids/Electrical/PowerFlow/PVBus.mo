within PowerGrids.Electrical.PowerFlow;

model PVBus "PV bus"
  extends BaseClasses.OnePortACPF(portVariablesPhases = true);
  extends Icons.Machine;
  parameter Types.ActivePower P = SNom "Active power entering the bus";
  parameter Types.Voltage U = UNom "Absolute value of phase-to-phase voltage";
equation
  port.P = P;
  port.U = U;
annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {-88, -71}, extent = {{-16, 17}, {34, -33}}, textString = "PV")}),
    Documentation(info = "<html><head></head><body><p>PVBus: prescribes the line-to-line voltage magnitude <code>U</code> of the bus and the active power <code>P</code> entering the  bus.</p>
</body></html>"));
    
end PVBus;
