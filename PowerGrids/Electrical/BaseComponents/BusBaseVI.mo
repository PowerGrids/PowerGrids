within PowerGrids.Electrical.BaseComponents;

partial model BusBaseVI
  extends PowerGrids.Electrical.BaseClasses.OnePortACVI(
    isLinear = true);
  input Types.ComplexVoltage e(re(nominal = port.VNom), im(nominal = port.VNom)) "Voltage of ideal generator, phase-to-ground";
  input Types.ComplexImpedance Z "Internal impedance";
  Types.ComplexVoltage v(re(nominal = port.VNom), im(nominal = port.VNom)) = port.v "Port voltage, phase-to-ground";
  Types.ComplexCurrent i(re(nominal = port.INom), im(nominal = port.INom)) = port.i "Port current";
equation
  v = e + Z*i;
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body><p>This is the base class for bus components that can be represented as the series connection of an ideal voltage generator and an internal impedance Z. In general the generator voltage and the internal impedance are time-varying variables.</p>
<p>This model can be specialized to describe an infinite bus with fixed or variable reference voltage.</p>
</body></html>"));
end BusBaseVI;
