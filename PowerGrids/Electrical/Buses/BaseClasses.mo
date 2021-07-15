within PowerGrids.Electrical.Buses;

package BaseClasses
  extends Modelica.Icons.BasesPackage;

  model BusBase
    extends PowerGrids.Electrical.BaseClasses.OnePortAC;
    input Types.ComplexVoltage e(re(nominal = port.VBase), im(nominal = port.VBase)) "Voltage of ideal generator, phase-to-ground";
    input Types.ComplexImpedance Z "Internal impedance";
    Types.ComplexVoltage v(re(nominal = port.VBase), im(nominal = port.VBase)) = port.v "Port voltage, phase-to-ground";
    Types.ComplexCurrent i(re(nominal = port.IBase), im(nominal = port.IBase)) = port.i "Port current";
  equation
    v = e + Z*i;
    annotation(
      Icon(coordinateSystem(grid = {0.1, 0.1})),
      Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
      Documentation(info = "<html><head></head><body><p>This is the base class for bus components that can be represented as the series connection of an ideal voltage generator and an internal impedance Z. In general the generator voltage and the internal impedance are time-varying variables.</p>
<p>This model can be specialized to describe an infinite bus with fixed or variable reference voltage.</p>
</body></html>"));
  end BusBase;
end BaseClasses;
