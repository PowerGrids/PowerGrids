within PowerGrids.Electrical.BaseComponents;

partial model InfiniteBusVI
  extends Icons.Bus(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase);
  extends BusBaseVI(
      e = CM.fromPolar(ERef, UPhase),
      Z = Complex(R, X));
  parameter Types.Resistance R = 0 "Series resistance";
  parameter Types.Reactance X = 0 "Series reactance";
  parameter Types.Voltage URef = UNom "Phase-to-phase voltage of ideal voltage generator";
  parameter Types.Angle UPhase = 0 "Voltage phase angle of ideal voltage generator";
  final parameter Types.Voltage ERef = URef/sqrt(3) "Phase-to-ground voltage of ideal voltage generator";
 
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>Infinite bus model with constant voltage e and internal impedance Z. The port voltage is v = e + Zi, where i is the current entering the bus. The default value of the series impedance Z = R + jX is zero.
</body></html>"));
end InfiniteBusVI;
