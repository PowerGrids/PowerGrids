within PowerGrids.Electrical.BaseClasses;

partial model TwoPortAC "Base class for two-port AC components with synchronous connection"
  extends TwoPortACBase;
equation
  // Propagation of the reference frame
  terminalAC_a.omegaRefPu = terminalAC_b.omegaRefPu;
  Connections.branch(terminalAC_a.omegaRefPu, terminalAC_b.omegaRefPu);

  annotation (
    Documentation(info = "<html><head></head><body><p>This is the base class for all the components with two AC terminals. It contains two corresponding <code>PortAC</code> components to compute useful quantities for modelling and monitoring purposes.</p>
    </body></html>"),
     Icon(graphics={  
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-100,-30},
        extent={{-76,15},{76,-15}},
        textColor = {238,46,47},
        textString = DynamicSelect("P", if (portA.P>=0) and showDataOnDiagramsPu then String(portA.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.P>=0) and showDataOnDiagramsSI then String(portA.P/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.P>=0) then ""
                                        elseif (portA.P<0) and showDataOnDiagramsPu then String(portA.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.P<0) and showDataOnDiagramsSI then String(portA.P/1e6, significantDigits=dataOnDiagramDigits)
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={-100,-58},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if (portA.Q>=0) and showDataOnDiagramsPu then String(portA.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.Q>=0) and showDataOnDiagramsSI then String(portA.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.Q>=0) then ""
                                        elseif (portA.Q<0) and showDataOnDiagramsPu then String(portA.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portA.Q<0) and showDataOnDiagramsSI then String(portA.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={100,-30},
        extent={{-76,15},{76,-15}},
        textColor = {238,46,47},
        textString = DynamicSelect("P", if (portB.P>=0) and showDataOnDiagramsPu then String(portB.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.P>=0) and showDataOnDiagramsSI then String(portB.P/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.P>=0) then ""
                                        elseif (portB.P<0) and showDataOnDiagramsPu then String(portB.PPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.P<0) and showDataOnDiagramsSI then String(portB.P/1e6, significantDigits=dataOnDiagramDigits)
                                        else "")),
       Text(
        visible=showDataOnDiagramsPu or showDataOnDiagramsSI,
        origin={100,-58},
        extent={{-76,15},{76,-15}},
        textColor={217,67,180},
        textString = DynamicSelect("Q", if (portB.Q>=0) and showDataOnDiagramsPu then String(portB.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.Q>=0) and showDataOnDiagramsSI then String(portB.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.Q>=0) then ""
                                        elseif (portB.Q<0) and showDataOnDiagramsPu then String(portB.QPu, significantDigits=dataOnDiagramDigits)
                                        elseif (portB.Q<0) and showDataOnDiagramsSI then String(portB.Q/1e6, significantDigits=dataOnDiagramDigits)
                                        else ""))}));
end TwoPortAC;
