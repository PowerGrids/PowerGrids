within PowerGrids.Examples.IEEE14bus;

model SynchronousCondenser "Model of a synchronous condenser for the IEEE-14 bus system"
  extends Icons.Machine;
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final hasSubPF = true);
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(
    SNom = SNom, UNom = UNom,
    final PPF = 0,
    final PStart = 0) annotation(
    Placement(transformation(origin = {-26, -18}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  Electrical.Controls.ExcitationSystems.VRProportional AVR(Ka = 20, VcPuStart = GEN.UStart/GEN.UNom, VrMax = 5, VrMin = -5) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Controls.FreeOffset VrefPu(use_u = true) annotation(
    Placement(visible = true, transformation(origin = {-100, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPuDef(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-134, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu(y = 0) annotation(
    Placement(transformation(origin = {-70, -32}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput omega annotation(
    Placement(transformation(origin = {10, -26}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(AVR.VcPu, GEN.VPu) annotation(
    Line(points = {{-80, -4}, {-172, -4}, {-172, 70}, {40, 70}, {40, -11}, {-20, -11}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation(
    Line(points = {{-60, -10}, {-32, -10}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation(
    Line(points = {{-88, -22}, {-86, -22}, {-86, -16}, {-80, -16}, {-80, -16}}, color = {0, 0, 127}));
  connect(VrefPuDef.y, VrefPu.u) annotation(
    Line(points = {{-122, -22}, {-110, -22}, {-110, -22}, {-110, -22}}, color = {0, 0, 127}));
  connect(GEN.omega, omega) annotation(
    Line(points = {{-20, -17}, {-8, -17}, {-8, -26}, {10, -26}}, color = {0, 0, 127}));
  connect(PmPu.y, GEN.PmPu) annotation(
    Line(points = {{-59, -32}, {-50, -32}, {-50, -16}, {-32, -16}}, color = {0, 0, 127}));
  connect(GEN.terminalAC, terminalAC) annotation (
    Line(points = {{-26, -8}, {-26, -36}, {47, -36}, {47, 80.5}, {-0.5, 80.5}, {-0.5, 100}, {0, 100}}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), 
      graphics = {
        Text(
          visible = (showDataOnDiagramsPu or showDataOnDiagramsSI),
          origin = {0, -145}, textColor = {238, 46, 47}, extent = {{-76, 15}, {76, -15}},
          textString = DynamicSelect("P", if ((GEN.port.P >= 0) and showDataOnDiagramsPu) then String(GEN.port.PPu, format = "6.3f")
                                          else if ((GEN.port.P >= 0) and showDataOnDiagramsSI) then String((GEN.port.P/1000000), format = "6.3f")
                                          else if (GEN.port.P >= 0) then ""
                                          else if ((GEN.port.P < 0) and showDataOnDiagramsPu) then String(GEN.port.PPu, format = "6.3f")
                                          else if ((GEN.port.P < 0) and showDataOnDiagramsSI) then String((GEN.port.P/1000000), format = "6.3f")
                                          else "")),
        Text(
          visible = (showDataOnDiagramsPu or showDataOnDiagramsSI), 
          origin = {0, -173}, textColor = {217, 67, 180}, extent = {{-76, 15}, {76, -15}}, 
          textString = DynamicSelect("Q", if ((GEN.port.Q >= 0) and showDataOnDiagramsPu) then String(GEN.port.QPu, format = "6.3f")
                                          else if ((GEN.port.Q >= 0) and showDataOnDiagramsSI) then String((GEN.port.Q/1000000), format = "6.3f")
                                          else if (GEN.port.Q >= 0) then ""
                                          else if ((GEN.port.Q < 0) and showDataOnDiagramsPu) then String(GEN.port.QPu, format = "6.3f")
                                          else if ((GEN.port.Q < 0) and showDataOnDiagramsSI) then String((GEN.port.Q/1000000), format = "6.3f")
                                          else "")),
         Rectangle(origin = {0, -50}, lineColor = {0, 85, 255}, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}),
         Rectangle(origin = {0, -50}, lineColor = {0, 85, 255}, extent = {{-48, 48}, {48, -48}})}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5})));
end SynchronousCondenser;
