within PowerGrids.Examples.Tutorial.GridOperation.Controlled;
model ControlledGridWithControlledGen "System under automatic control with high-level controlled generator component"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow)  annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV(UNom = 21000)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, X = 16e-2 * 419 ^ 2 / 500, rFixed = 419 / 21)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1 / 10, SNom = 5e+08, SSC = (2.5e+09)/1.1, UNom = 380000, URef = 1.05 * 380e3)  annotation(
    Placement(visible = true, transformation(origin = {56, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3)  annotation(
    Placement(visible = true, transformation(origin = {56, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Examples.Tutorial.GridOperation.Controlled.ControlledGenerator ctrlGEN(UNom = 21000, SNom = 5e+08, AVR(Ka = 150)) annotation(
    Placement(transformation(origin = {-64, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Electrical.Faults.ThreePhaseFault FAULT(R = 0.05,SNom = 5e+08, UNom = 380000, startTime = 2, stopTime = 2.1) annotation(
    Placement(visible = true, transformation(origin = {74, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(NTLV.terminalAC, TGEN.terminalAC_a) annotation(
    Line(points = {{-30, 0}, {-10, 0}}));
  connect(ctrlGEN.terminalAC, NTLV.terminalAC) annotation(
    Line(points = {{-64, 0}, {-30, 0}}));
  connect(TGEN.terminalAC_b, GRID.terminalAC) annotation(
    Line(points = {{10, 0}, {56, 0}, {56, 10}}));
  connect(GRIDL.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{56, -12}, {56, 10}}));
  connect(FAULT.terminalAC, GRID.terminalAC) annotation(
    Line(points = {{74, -12}, {74, 0}, {56, 0}, {56, 10}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {140, 100}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(lv="LOG_INIT_HOMOTOPY"));

end ControlledGridWithControlledGen;
