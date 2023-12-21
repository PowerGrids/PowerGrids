within PowerGrids.Electrical.BaseClasses;

partial model OnePortAC "Base class for non-bus AC components with one port"
  extends OnePortACBase(
    final isOnePortAC = true,
    final isOnePortACBus = false,
    redeclare connector TerminalAC = Interfaces.TerminalAC);

initial equation
  // Get start values for voltage from the connected buses via input variables on terminalAC
  UStartPF = terminalAC.UStart;
  UPhaseStartPF = terminalAC.UPhaseStart;

  annotation (
    Documentation(info = "<html>
<p>This is the base class for all the components with an AC terminal. It contains a corresponding <code>PortAC</code> component to compute useful quantities for modelling and monitoring purposes.</p>
</html>"), 
     Icon(graphics={  
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={0,-145},
        extent={{-76,15},{76,-15}},
        textColor = {238,46,47},
        textString = DynamicSelect("P", if showDataOnDiagramsPu then String(port.PPu, format = "6.3f")
                                        elseif showDataOnDiagramsSI then String(port.P/1e6, format = "9.3f")
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={0,-179},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if showDataOnDiagramsPu then String(port.QPu, format = "6.3f")
                                        elseif showDataOnDiagramsSI then String(port.Q/1e6, format = "9.3f")
                                        else ""))}));
end OnePortAC;
