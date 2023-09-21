within PowerGrids.Electrical.BaseClasses;

partial model TwoPortAC "Base class for two-port AC components"
  parameter Boolean showDataOnDiagramsPu = systemPowerGrids.showDataOnDiagramsPu "=true, P,Q,V and phase are shown on the diagrams in per-unit (it overrides the SI format";
  parameter Boolean showDataOnDiagramsSI = systemPowerGrids.showDataOnDiagramsSI "=true, P,Q,V and phase are shown on the diagrams in kV, MW, Mvar";
  parameter Integer dataOnDiagramDigits = systemPowerGrids.dataOnDiagramDigits "number of digits for data on diagrams";
  parameter Boolean portVariablesPhases = systemPowerGrids.portVariablesPhases "Compute voltage and current phases for monitoring purposes only" annotation(Evaluate = true);
  parameter Boolean computePowerBalance = true "Compute net balance of complex power entering the component";
  final parameter Types.Voltage UStartA(fixed = false) "Start value of phase-to-phase voltage phasor at port A, absolute value" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.Angle UPhaseStartA(fixed = false) "Start value of phase-to-phase voltage phasor at port A, phase angle" annotation(
    Dialog(tab = "Initialization"));
  parameter Types.ActivePower PStartA = SNom "Start value of active power flowing into port A" annotation(
    Dialog(tab = "Initialization"));
  parameter Types.ReactivePower QStartA = 0 "Start value of reactive power flowing into port A" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.Voltage UStartB(fixed = false) "Start value of phase-to-phase voltage phasor at port B, absolute value" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.Angle UPhaseStartB(fixed = false) "Start value of phase-to-phase voltage phasor at port B, phase angle" annotation(
    Dialog(tab = "Initialization"));
  parameter Types.ActivePower PStartB = -SNom "Start value of active power flowing into port B" annotation(
    Dialog(tab = "Initialization"));
  parameter Types.ReactivePower QStartB = 0 "Start value of reactive power flowing into port B" annotation(
    Dialog(tab = "Initialization"));

  extends TwoPortACVI(
    redeclare PowerGrids.Interfaces.TerminalAC_a terminalAC_a(
      v(re(start = portA.vStart.re), im(start = portA.vStart.im)),
      i(re(start = portA.iStart.re), im(start = portA.iStart.im))),
    redeclare PowerGrids.Interfaces.TerminalAC_b terminalAC_b(
      v(re(start = portB.vStart.re), im(start = portB.vStart.im)),
      i(re(start = portB.iStart.re), im(start = portB.iStart.im))),
    portA(final v = terminalAC_a.v, final i = terminalAC_a.i,
          final UNom = UNomA, final SNom = SNom,
          final portVariablesPhases = portVariablesPhases,
          final generatorConvention = false,
          final UStart = UStartA,
          final UPhaseStart = UPhaseStartA,
          final PStart = PStartA,
          final QStart = QStartA),
    portB(final v = terminalAC_b.v, final i = terminalAC_b.i,
          final UNom = UNomB, final SNom = SNom,
          final portVariablesPhases = portVariablesPhases,
          final generatorConvention = false,
          final UStart = UStartB,
          final UPhaseStart = UPhaseStartB,
          final PStart = PStartB,
          final QStart = QStartB));

  Types.ComplexPower Sbal = portA.S + portB.S if computePowerBalance "Complex power balance";
  outer Electrical.System systemPowerGrids "Reference to system object";

initial equation
  UStartA = terminalAC_a.UStart;
  UPhaseStartA = terminalAC_a.UPhaseStart;
  UStartB = terminalAC_b.UStart;
  UPhaseStartB = terminalAC_b.UPhaseStart;

equation
  // Overconstrained connectors
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
