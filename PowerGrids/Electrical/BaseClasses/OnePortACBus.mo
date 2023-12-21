within PowerGrids.Electrical.BaseClasses;

partial model OnePortACBus
  extends OnePortAC;
  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the components with an AC terminal. It contains a corresponding <code>PortAC</code> component to compute useful quantities for modelling and monitoring purposes.</p>
</html>"),
     Icon(graphics={  
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-174, 17},
        extent={{-76,15},{76,-15}},
        textColor = {28,108,200},
        textString = DynamicSelect("V",
          if showDataOnDiagramsPu then String(port.VPu, format = "6.3f")
          elseif showDataOnDiagramsSI then String(port.U/1e3, format = "9.3f")
          else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-156, -17},
        extent={{-76,15},{76,-15}},
        textColor = {0,0,255},
        textString = DynamicSelect("Uph",
          if showDataOnDiagramsPu or showDataOnDiagramsSI
          then String(port.UPhase*180/3.14159265359, format = "4.1f")+"°"
          else ""))}));
end OnePortACBus;
