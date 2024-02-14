within PowerGrids.Electrical.Test;

model TestEquivalentGrid "Test case EquivalentGrid model"
  extends Modelica.Icons.Example;
  import Modelica.ComplexMath;
  inner PowerGrids.Electrical.System systemPowerGrids annotation(
    Placement(visible = true, transformation(origin = {34, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.InfiniteBus voltageSource( SNom = 5e+08, UNom = 380000, URef = 380000) annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.LineConstantImpedance equivalentLine(R = 6.32207, SNom = 5e+08, UNom = 380000, X = 63.2207)  annotation(
    Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid equivalentGrid(R_X = 1 / 10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.050 * 380e3)  annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Loads.LoadPQVoltageDependence load(PRefConst = 1e+07, QRefConst = 2e+07, SNom = 5e+08, URef = 380000)  annotation(
    Placement(visible = true, transformation(origin = {-20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus busLine(UNom = 380000)  annotation(
    Placement(visible = true, transformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Faults.ThreePhaseFault short(fault(start=true), Y(re(start = 1e6), im(start = 0)),UNom= 3.8e5, SNom = 5e8, R = 1e-6, startTime = -1, stopTime=1e10)  annotation(
    Placement(visible = true, transformation(origin = {-40, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(load.terminalAC, equivalentGrid.terminalAC) annotation(
    Line(points = {{-20, 0}, {40, 0}}));
  connect(equivalentLine.terminalAC_b, voltageSource.terminalAC) annotation(
    Line(points = {{20, -40}, {42, -40}, {42, -40}, {40, -40}, {40, -40}}));
  connect(busLine.terminalAC, equivalentLine.terminalAC_a) annotation(
    Line(points = {{-20, -40}, {0, -40}}));
  connect(busLine.terminalAC, short.terminalAC) annotation(
    Line(points = {{-20, -40}, {-40, -40}, {-40, -48}}));
  annotation(
    Diagram,
    Icon,
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
  Documentation(info = "<html><head></head><body><p>This model tests the&nbsp;<a href=\"modelica://PowerGrids.Electrical.Buses.EquivalentGrid\">Electrical.Buses.EquivalentGrid</a>&nbsp;model. The internal voltage source is initialized to provide the required initial modulus and phase of the port voltage.</p><p>The equivalent grid model computes an internal impedance of 6.323+j*63.23 Ohm, corresponding to a short circuit power SSC of 2272 MVA, which gives the rated 2500 MVA.</p><p>This verification is carried out by the equivalent circuit in the lower part of the diagram.</p></body></html>"));
end TestEquivalentGrid;
