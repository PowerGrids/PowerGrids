within PowerGrids.Examples.Tutorial.GridOperation.Controlled;
model ControlledGenerator "Model of a synchronous generator with governor, AVR, and PSS"
  extends Icons.Machine;
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(PMechPuStart = -GEN.PStart / GEN.SNom,R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1)  annotation(
    Placement(visible = true, transformation(origin = {4, 28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VcPuStart = GEN.UStart / GEN.UNom, VrMax = 4)  annotation(
    Placement(visible = true, transformation(origin = {4, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation(
    Placement(visible = true, transformation(origin = {-36, -52}, extent = {{-12, -10}, {12, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.PowerSystemStabilizers.IEEE_PSS2A PSS(Ks1 = 10, Ks2 = 0.1564, M = 0, N = 0, T1 = 0.25, T2 = 0.03, T3 = 0.15, T4 = 0.015, T7 = 2, T8 = 0.5, T9 = 0.1, Tw1 = 2, Tw2 = 2, Tw3 = 2, Tw4 = 0, VstMax = 0.1, VstMin = -0.1)  annotation(
    Placement(visible = true, transformation(origin = {-32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Interfaces.TerminalAC terminal annotation(
    Placement(visible = true, transformation(origin = {40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FreeOffset RefLPu annotation(
    Placement(visible = true, transformation(origin = {-32, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FreeOffset VrefPu annotation(
    Placement(visible = true, transformation(origin = {-34, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput omega "Angular frequency / (rad/s)" annotation(
    Placement(visible = true, transformation(origin = {64, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin = {70, 1.77636e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(GEN.ufPuIn, AVR.efdPu) annotation(
    Line(points = {{30, -4}, {22, -4}, {22, -16}, {15, -16}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{14, 28}, {22, 28}, {22, 4}, {30, 4}}, color = {0, 0, 127}));
  connect(GEN.VPu, AVR.VcPu) annotation(
    Line(points = {{50, -6}, {94, -6}, {94, 54}, {-64, 54}, {-64, -14}, {-6, -14}}, color = {0, 0, 127}));
  connect(PSS.VstPu, AVR.VsPu) annotation(
    Line(points = {{-21, 0}, {-14, 0}, {-14, -10}, {-6, -10}}, color = {0, 0, 127}));
  connect(PSS.Vsi2Pu, GEN.PPu) annotation(
    Line(points = {{-42, -6}, {-58, -6}, {-58, 48}, {90, 48}, {90, -2}, {50, -2}}, color = {0, 0, 127}));
  connect(GEN.terminal, terminal) annotation(
    Line(points = {{40, 0}, {40, -50}}));
  connect(RefLPu.y, TGOV.RefLPu) annotation(
    Line(points = {{-21, 24}, {-6, 24}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-23, -30}, {-18, -30}, {-18, -18}, {-6, -18}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation(
    Line(points = {{50, 2}, {86, 2}, {86, 44}, {-14, 44}, {-14, 32}, {-6, 32}}, color = {0, 0, 127}));
  connect(AVR.VuelPu, zero.y) annotation(
    Line(points = {{-6, -22}, {-12, -22}, {-12, -52}, {-22, -52}, {-22, -52}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, PSS.Vsi1Pu) annotation(
    Line(points = {{50, 2}, {86, 2}, {86, 44}, {-52, 44}, {-52, 6}, {-42, 6}, {-42, 6}}, color = {0, 0, 127}));
  connect(GEN.omega, omega) annotation(
    Line(points = {{50, 6}, {54, 6}, {54, 12}, {64, 12}, {64, 12}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {12, -74}, extent = {{-58, 10}, {34, -4}}, textString = "CONTROL"), Rectangle(origin = {0, -70}, extent = {{-50, 10}, {50, -10}})}),
    Diagram(coordinateSystem(grid = {0.5, 0.5}, extent = {{-120, -100}, {120, 100}})));
end ControlledGenerator;
