within PowerGrids.Examples.IEEE14bus;
model ControlledGeneratorIEEE "Model of controlled generator for the IEEE 14-bus benchmark - synchronous machine with proportional regulations"
  extends Icons.Machine;
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(portVariablesPhases = true)  annotation(
    Placement(visible = true, transformation(origin = {-26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Interfaces.TerminalAC terminal annotation(
    Placement(visible = true, transformation(origin = {-26, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Controls.ExcitationSystems.VRProportional AVR(Ka = 20, VcPuStart = GEN.UStart / GEN.UNom, VrMax = 5, VrMin = -5)  annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Controls.TurbineGovernors.GoverProportional GOV(KGover = 5, PMaxPu = 1, PMinPu = 0, PPuStart = -GEN.PStart / GEN.PNom)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FreeOffset PmRefPu(use_u = true)  annotation(
    Placement(visible = true, transformation(origin = {-102, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Controls.FreeOffset VrefPu(use_u = true)  annotation(
    Placement(visible = true, transformation(origin = {-100, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPuDef(y = 1)  annotation(
    Placement(visible = true, transformation(origin = {-134, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmRefPuDef(y = -GEN.PStart / GEN.PNom) annotation(
    Placement(visible = true, transformation(origin = {-134, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput omega annotation(
    Placement(visible = true, transformation(origin = {10, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(GEN.terminal, terminal) annotation(
    Line(points = {{-26, 0}, {-26, -50}}));
  connect(GOV.omegaPu, GEN.omegaPu) annotation(
    Line(points = {{-80, 26}, {-164, 26}, {-164, 64}, {32, 64}, {32, 2}, {-16, 2}}, color = {0, 0, 127}));
  connect(AVR.VcPu, GEN.VPu) annotation(
    Line(points = {{-80, -4}, {-172, -4}, {-172, 70}, {40, 70}, {40, -6}, {-16, -6}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation(
    Line(points = {{-60, -10}, {-50, -10}, {-50, -4}, {-36, -4}, {-36, -4}}, color = {0, 0, 127}));
  connect(GOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{-60, 30}, {-50, 30}, {-50, 4}, {-36, 4}, {-36, 4}}, color = {0, 0, 127}));
  connect(PmRefPu.y, GOV.PmRefPu) annotation(
    Line(points = {{-90, 42}, {-86, 42}, {-86, 34}, {-80, 34}, {-80, 34}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-88, -22}, {-86, -22}, {-86, -16}, {-80, -16}, {-80, -16}}, color = {0, 0, 127}));
  connect(VrefPuDef.y, VrefPu.u) annotation(
    Line(points = {{-122, -22}, {-110, -22}, {-110, -22}, {-110, -22}}, color = {0, 0, 127}));
  connect(GEN.PPu, GOV.PPu) annotation(
    Line(points = {{-16, -2}, {36, -2}, {36, 68}, {-168, 68}, {-168, 12}, {-64, 12}, {-64, 20}}, color = {0, 0, 127}));
  connect(PmRefPuDef.y, PmRefPu.u) annotation(
    Line(points = {{-123, 42}, {-112, 42}}, color = {0, 0, 127}));
  connect(GEN.omega, omega) annotation(
    Line(points = {{-16, 6}, {-8, 6}, {-8, 16}, {10, 16}, {10, 16}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {12, -74}, extent = {{-58, 10}, {34, -4}}, textString = "CONTROL"), Rectangle(origin = {0, -70}, extent = {{-50, 10}, {50, -10}})}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5})));
end ControlledGeneratorIEEE;
