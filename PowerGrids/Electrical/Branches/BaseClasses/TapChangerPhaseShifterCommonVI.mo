within PowerGrids.Electrical.Branches.BaseClasses;
partial model TapChangerPhaseShifterCommonVI "Common base class for tap-changer/phase shifter transformers"
  extends PowerGrids.Electrical.BaseComponents.PiNetworkVI;
  extends Icons.Transformer;

  final constant Real NotUsed = Modelica.Constants.inf "Generic default value for not-used parameters";
  encapsulated type MonitoredQuantitySelection = enumeration(currentMagnitude "phase shifter monitors the port_b current magnitude",
                                                             activePower "phase shifter monitors the port_b active power");

  parameter SI.PerUnit RccPu = 0 "Series resistance on B side in p.u.";
  parameter SI.PerUnit XccPu = 0 "Series reactance on B side in p.u.";
  parameter SI.PerUnit GPu = 0 "Shunt conductance on B side in p.u.";
  parameter SI.PerUnit BPu = 0 "Shunt susceptance on B side in p.u.";

  parameter Types.Impedance ZBaseB "Base impedance at B side";
  parameter Types.Admittance YBaseB "Base impedance at B side";

  final parameter Types.Resistance R = RccPu*ZBaseB "Series resistance on B side";
  final parameter Types.Reactance X = XccPu*ZBaseB "Series reactance on B side";
  final parameter Types.Conductance G = GPu*YBaseB "Shunt conductance on B side";
  final parameter Types.Susceptance B = BPu*YBaseB "Shunt susceptance on B side";

equation
  Y = 1/Complex(R, X);
  YA = Complex(0);
  YB = Complex(G, B);
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>This partial model can be used as base class in order to implement transformers with tap-changer/phase shifter with logic of different types.<div><br></div><div>It extends a Pi Network, adding the common parameters wich define the series impedance and the shunt admittance.</div><div><br></div><div>Moreover, this class contains the definition of the type MonitoredQuantitySelection, used to select the electrical quantity monitored by the phase shifter.</div><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">The available electrical quantities are Current Magnitude and Active Power.</span></div></body></html>"));
end TapChangerPhaseShifterCommonVI;
