within PowerGrids.Electrical.Branches.BaseClasses;
partial model TapChangerPhaseShifterCommon "Common base class for tap-changer/phase shifter transformers"
  extends BaseClasses.PiNetwork;
  extends Icons.Transformer;

  final constant Real NotUsed = Modelica.Constants.inf "Generic default value for not-used parameters";
  encapsulated type MonitoredQuantitySelection = enumeration(currentMagnitude "phase shifter monitors the port_b current magnitude",
                                                             activePower "phase shifter monitors the port_b active power");

  parameter Types.Resistance R = 0 "Series resistance";
  parameter Types.Reactance X = 0 "Series reactance";
  parameter Types.Conductance G = 0 "Shunt conductance";
  parameter Types.Susceptance B = 0 "Shunt susceptance";

equation
  Y = 1/Complex(R, X);
  YA = Complex(0);
  YB = Complex(G, B);
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>This partial model can be used as base class in order to implement transformers with tap-changer/phase shifter with logic of different types.<div><br></div><div>It extends a Pi Network, adding the common parameters wich define the series impedance and the shunt admittance.</div><div><br></div><div>Moreover, this class contains the definition of the type MonitoredQuantitySelection, used to select the electrical quantity monitored by the phase shifter.</div><div><span style=\"font-size: 12px;\"><br></span></div><div><span style=\"font-size: 12px;\">The available electrical quantities are Current Magnitude and Active Power.</span></div></body></html>"));
end TapChangerPhaseShifterCommon;
