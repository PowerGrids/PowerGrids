within PowerGrids.Examples.IEEE14bus;

model ControlledGeneratorIEEE "Model of controlled generator for the IEEE 14-bus benchmark - synchronous machine with proportional regulations"
  extends Icons.Machine;
  outer PowerGrids.Electrical.System systemPowerGrids;
  parameter Boolean showDataOnDiagramsPu = systemPowerGrids.showDataOnDiagramsPu "=true, P,Q,V and phase are shown on the diagrams in per-unit (it overrides the SI format)";
  parameter Boolean showDataOnDiagramsSI = systemPowerGrids.showDataOnDiagramsSI "=true, P,Q,V and phase are shown on the diagrams in multiple of SI (kV, MW, Mvar)";
  parameter Integer dataOnDiagramDigits = systemPowerGrids.dataOnDiagramDigits "number of digits for data on diagrams";
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(portVariablesPhases = true) annotation(
    Placement(transformation(origin = {-26, -10}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  PowerGrids.Interfaces.TerminalAC terminalAC annotation(
    Placement(visible = true, transformation(origin = {-26, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Controls.ExcitationSystems.VRProportional AVR(Ka = 20, VcPuStart = GEN.UStart/GEN.UNom, VrMax = 5, VrMin = -5) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Electrical.Controls.TurbineGovernors.GoverProportional GOV(KGover = 5, PMaxPu = 1, PMinPu = 0, PPuStart = -GEN.PStart/GEN.PNom) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FreeOffset PmRefPu(use_u = true) annotation(
    Placement(visible = true, transformation(origin = {-102, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Controls.FreeOffset VrefPu(use_u = true) annotation(
    Placement(visible = true, transformation(origin = {-100, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPuDef(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-134, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmRefPuDef(y = -GEN.PStart/GEN.PNom) annotation(
    Placement(visible = true, transformation(origin = {-134, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput omega annotation(
    Placement(transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(GEN.terminalAC, terminalAC) annotation(
    Line(points = {{-26, -10}, {-26, -50}}));
  connect(GOV.omegaPu, GEN.omegaPu) annotation(
    Line(points = {{-80, 26}, {-164, 26}, {-164, 64}, {32, 64}, {32, -7}, {-20, -7}}, color = {0, 0, 127}));
  connect(AVR.VcPu, GEN.VPu) annotation(
    Line(points = {{-80, -4}, {-172, -4}, {-172, 72}, {36, 72}, {36, -3}, {-20, -3}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation(
    Line(points = {{-60, -10}, {-50, -10}, {-50, -2}, {-32, -2}}, color = {0, 0, 127}));
  connect(GOV.PMechPu, GEN.PmPu) annotation(
    Line(points = {{-60, 30}, {-40, 30}, {-40, -8}, {-32, -8}}, color = {0, 0, 127}));
  connect(PmRefPu.y, GOV.PmRefPu) annotation(
    Line(points = {{-90, 42}, {-86, 42}, {-86, 34}, {-80, 34}, {-80, 34}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-88, -22}, {-86, -22}, {-86, -16}, {-80, -16}, {-80, -16}}, color = {0, 0, 127}));
  connect(VrefPuDef.y, VrefPu.u) annotation(
    Line(points = {{-122, -22}, {-110, -22}, {-110, -22}, {-110, -22}}, color = {0, 0, 127}));
  connect(GEN.PPu, GOV.PPu) annotation(
    Line(points = {{-20, -5}, {-20, -4.5}, {28, -4.5}, {28, 68}, {-168, 68}, {-168, 12}, {-64, 12}, {-64, 20}}, color = {0, 0, 127}));
  connect(PmRefPuDef.y, PmRefPu.u) annotation(
    Line(points = {{-123, 42}, {-112, 42}}, color = {0, 0, 127}));
  connect(GEN.omega, omega) annotation(
    Line(points = {{-20, -9}, {-8, -9}, {-8, -20}, {10, -20}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), 
      graphics = {
        Text(
        visible = (showDataOnDiagramsPu or showDataOnDiagramsSI), 
        origin = {0, -144}, 
        textColor = {238, 46, 47}, 
        extent = {{-76, 15}, {76, -15}}, 
        textString = DynamicSelect("P", if ((GEN.port.P >= 0) and showDataOnDiagramsPu) then String(GEN.port.PPu, dataOnDiagramDigits, 0, true) 
                                        else if ((GEN.port.P >= 0) and showDataOnDiagramsSI) then String((GEN.port.P/1000000), dataOnDiagramDigits, 0, true) 
                                        else if (GEN.port.P >= 0) then "" 
                                        else if ((GEN.port.P < 0) and showDataOnDiagramsPu) then String(GEN.port.PPu, dataOnDiagramDigits, 0, true) 
                                        else if ((GEN.port.P < 0) and showDataOnDiagramsSI) then String((GEN.port.P/1000000), dataOnDiagramDigits, 0, true) 
                                        else "")), 
        Text(
          visible = (showDataOnDiagramsPu or showDataOnDiagramsSI), 
          origin = {0, -173}, textColor = {217, 67, 180}, 
          extent = {{-76, 15}, {76, -15}}, 
          textString = DynamicSelect("Q", if ((GEN.port.Q >= 0) and showDataOnDiagramsPu) then String(GEN.port.QPu, dataOnDiagramDigits, 0, true) 
                                          else if ((GEN.port.Q >= 0) and showDataOnDiagramsSI) then String((GEN.port.Q/1000000), dataOnDiagramDigits, 0, true) 
                                          else if (GEN.port.Q >= 0) then "" 
                                          else if ((GEN.port.Q < 0) and showDataOnDiagramsPu) then String(GEN.port.QPu, dataOnDiagramDigits, 0, true) 
                                          else if ((GEN.port.Q < 0) and showDataOnDiagramsSI) then String((GEN.port.Q/1000000), dataOnDiagramDigits, 0, true) 
                                          else "")), 
        Rectangle(origin = {0, -50}, extent = {{-48, 48}, {48, -48}}), 
        Rectangle(origin = {0, -50}, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}})}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5})));
end ControlledGeneratorIEEE;
