within PowerGrids.Electrical.Loads;

model LoadImpedancePQ "Load model with impedance specified by PRef and QRef"
  extends PowerGrids.Electrical.Buses.BaseClasses.BusBase(
    e = Complex(0),
    Z = 1/ComplexMath.conj(Complex(PRef,QRef)/URef^2),
    PStart = PRefConst,
    QStart = QRefConst);
  extends Icons.Load;
  import Modelica.ComplexMath;
  parameter Types.ActivePower PRefConst = 0 "Active power consumption at reference voltage";
  parameter Types.ReactivePower QRefConst = 0 "Reactive power consumption at reference voltage";
  parameter Types.Voltage URef = UNom "Reference value of phase-to-phase voltage";
  Types.ActivePower PRef(nominal = SNom) = PRefConst "Active power consumption at reference voltage, the default binding can be changed when instantiating";
  Types.ActivePower QRef(nominal = SNom) = QRefConst "Reactive power consumption at reference voltage, the default binding can be changed when instantiating";

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body>
<p>Model of a fixed impedance load, whose value is specified by the reference values <code>PRef</code>, <code>QRef</code>, and <code>URef</code>.</p>
</body></html>"));
end LoadImpedancePQ;
