within PowerGrids.Electrical.Loads;

model LoadImpedancePQInputs "Load model with impedance specified by PRefIn and QRefIn inputs"
  extends LoadImpedancePQ(
    final PRef = PRefIn, 
    final QRef = QRefIn,
    final PRefConst = 0,
    final QRefConst = 0);
  Modelica.Blocks.Interfaces.RealInput PRefIn(unit="W", displayUnit="MW") "Active reference power at VPu = 1, W" annotation(
    Placement(visible = true, transformation(origin = {-100, 36}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput QRefIn(unit="var", displayUnit = "MVA") "Reactive reference power at VPu = 1, var" annotation(
    Placement(visible = true, transformation(origin = {-100, -44}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>
<p>Model of a variable impedance load, whose value is specified by the reference values <code>PRefin</code> and <code>QRefIn</code> inputs and by the <code>URef</code> parameter.</p>
</body></html>"));
end LoadImpedancePQInputs;
