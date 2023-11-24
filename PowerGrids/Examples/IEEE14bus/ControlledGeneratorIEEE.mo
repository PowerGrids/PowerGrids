within PowerGrids.Examples.IEEE14bus;

model ControlledGeneratorIEEE "Model of controlled generator for the IEEE 14-bus benchmark - synchronous machine with proportional regulations"
  extends Icons.Machine;
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(final hasSubPF = true);
  parameter Boolean showDataOnDiagramsPu = systemPowerGrids.showDataOnDiagramsPu "=true, P,Q,V and phase are shown on the diagrams in per-unit (it overrides the SI format)";
  parameter Boolean showDataOnDiagramsSI = systemPowerGrids.showDataOnDiagramsSI "=true, P,Q,V and phase are shown on the diagrams in multiple of SI (kV, MW, Mvar)";
  parameter Integer dataOnDiagramDigits = systemPowerGrids.dataOnDiagramDigits "number of digits for data on diagrams";
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(SNom = SNom, UNom = UNom, portVariablesPhases = true) annotation(
    Placement(transformation(origin = {34, 32}, extent = {{-10, 10}, {10, -10}})));
  Electrical.Controls.ExcitationSystems.VRProportional AVR(Ka = 20, VcPuStart = GEN.UStart/GEN.UNom, VrMax = 5, VrMin = -5) annotation(
    Placement(transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}})));
  Electrical.Controls.TurbineGovernors.GoverProportional GOV(KGover = 5, PMaxPu = 1, PMinPu = 0) annotation(
    Placement(transformation(origin = {-10, -10}, extent = {{-10, -10}, {10, 10}})));
  Controls.FreeOffset VrefPu(use_u = true) annotation(
    Placement(transformation(origin = {-40, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression VrefPuDef(y = 1) annotation(
    Placement(transformation(origin = {-74, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression PmRefPuDef(y = -GEN.PStart/GEN.PNom) annotation(
    Placement(transformation(origin = {-74, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput omega annotation(
    Placement(transformation(origin = {58, 20}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(GOV.omegaPu, GEN.omegaPu) annotation(
    Line(points = {{-20, -14}, {-90, -14}, {-90, 64}, {52, 64}, {52, 35}, {40, 35}}, color = {0, 0, 127}));
  connect(AVR.VcPu, GEN.VPu) annotation(
    Line(points = {{-19.8, 36}, {-27.8, 36}, {-27.8, 56}, {48.2, 56}, {48.2, 39}, {40, 39}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation(
    Line(points = {{0.2, 30}, {10.2, 30}, {10.2, 40}, {28, 40}}, color = {0, 0, 127}));
  connect(GOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{0, -10}, {14, -10}, {14, 34}, {28, 34}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-29, 24}, {-21, 24}}, color = {0, 0, 127}));
  connect(VrefPuDef.y, VrefPu.u) annotation(
    Line(points = {{-63, 24}, {-51, 24}, {-51, 24}, {-51, 24}}, color = {0, 0, 127}));
  connect(PmRefPuDef.y, GOV.PmRefPu) annotation(
    Line(points = {{-63, -6}, {-20, -6}}, color = {0, 0, 127}));
  connect(GEN.terminalAC, terminalAC) annotation(
    Line(points = {{34, 32}, {34, 10}, {70, 10}, {70, 84}, {0, 84}, {0, 100}}));
  connect(GEN.omega, omega) annotation(
    Line(points = {{40, 33}, {44, 33}, {44, 20}, {56, 20}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1, extent = {{-100, -100}, {100, 100}}),
     graphics = {
       Text(visible = (showDataOnDiagramsPu or showDataOnDiagramsSI),
            origin = {0, -144}, textColor = {238, 46, 47},
            extent = {{-76, 15}, {76, -15}},
            textString = DynamicSelect("P",
              if ((GEN.port.P >= 0) and showDataOnDiagramsPu) then String(GEN.port.PPu, format = "6.3f")
              else if ((GEN.port.P >= 0) and showDataOnDiagramsSI) then String((GEN.port.P/1e+06), format = "6.3f")
              else if (GEN.port.P >= 0) then ""
              else if ((GEN.port.P < 0) and showDataOnDiagramsPu) then String(GEN.port.PPu, format = "6.3f")
              else if ((GEN.port.P < 0) and showDataOnDiagramsSI) then String((GEN.port.P/1e+06), format = "6.3f")
              else "")),
       Text(visible = (showDataOnDiagramsPu or showDataOnDiagramsSI),
            origin = {0, -173}, textColor = {217, 67, 180},
            extent = {{-76, 15}, {76, -15}},
            textString = DynamicSelect("Q",
              if ((GEN.port.Q >= 0) and showDataOnDiagramsPu) then String(GEN.port.QPu, format = "6.3f")
              else if ((GEN.port.Q >= 0) and showDataOnDiagramsSI) then String((GEN.port.Q/1e+06), format = "6.3f")
              else if (GEN.port.Q >= 0) then ""
              else if ((GEN.port.Q < 0) and showDataOnDiagramsPu) then String(GEN.port.QPu, format = "6.3f")
              else if ((GEN.port.Q < 0) and showDataOnDiagramsSI) then String((GEN.port.Q/1e+06), format = "6.3f")
              else "")),
          Rectangle(origin = {0, -50}, extent = {{-48, 48}, {48, -48}}),
          Rectangle(origin = {0, -50}, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}})}),
    Diagram(coordinateSystem(extent = {{-100, 120}, {80, -20}}, grid = {0.5, 0.5})));
end ControlledGeneratorIEEE;
