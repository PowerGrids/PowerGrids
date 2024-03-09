within PowerGrids.Electrical.Buses;

model EquivalentGrid "Equivalent grid model characterized by short circuit capacity"
  import Modelica.ComplexMath;
  extends Icons.Grid(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase, PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu, isSlackBus=isSlackBusPF);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends PowerGrids.Electrical.BaseComponents.BusBaseVI(
    final isOnePortAC = true,
    redeclare connector TerminalAC = Interfaces.TerminalAC,
    terminalAC(
      final computePF = computePF,
      terminalACPF(final v = vPF, final i = iPF)),
    e = eSource,
    Z = ZGrid);
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare ComponentPF componentPF);

  replaceable model ComponentPF = PowerGrids.Electrical.PowerFlow.SlackBus(
    SNom = SNom,
    UNom = UNom,
    U = URef,
    UPhase = UPhaseRef)
  constrainedby PowerGrids.Electrical.BaseClasses.OnePortACPF
  annotation(choices(choice(redeclare replaceable model ComponentPF = PowerGrids.Electrical.PowerFlow.BusPF
                              "to be used if the slack bus is embedded in another component")));

  parameter Types.Voltage URef = UNom "Reference phase-to-phase voltage at connection terminal";
  parameter Types.Angle UPhaseRef = 0 "Voltage phase angle at connection terminal";
  parameter Types.ApparentPower SSC "Short-circuit apparent power";
  parameter Types.PerUnit R_X = 1/10 "Ratio of resistance to reactance of the grid";
  final parameter Types.ComplexPower Ssc = ComplexMath.fromPolar(SSC, atan(1/R_X)) "Short circuit active power";
  final parameter Types.ComplexImpedance ZGrid = 1/ComplexMath.conj(Ssc/UNom^2) "Grid impedance";
  final parameter Types.ComplexVoltage eStart = ComplexMath.fromPolar(URef, UPhaseStart) "Tentative value of voltage source";
  final parameter Types.ComplexVoltage eSource(
    re(fixed = false, start = eStart.re),
    im(fixed = false, start = eStart.im)) "Constant value of voltage source";

protected
  Modelica.Blocks.Interfaces.BooleanInput isSlackBusPF "input to get the value of the isSlackBus flag from the PF component";

initial equation
  // Initial voltage at port fixed at reference values
  port.u = ComplexMath.fromPolar(URef, UPhaseRef);

equation
  connect(isSlackBusPF, componentPF.isSlackBusOut);
  if not computePF then
    isSlackBusPF = false;
  end if;

  // Overconstrained connector
  Connections.potentialRoot(terminalAC.omegaRefPu);
  if Connections.isRoot(terminalAC.omegaRefPu) then
     terminalAC.omegaRefPu = 1;
  end if;

annotation(
    Documentation(info = "<html><head></head><body><p>This model describes an equivalent grid with an internal impedance driven by a constant voltage source.</p>
<p>The impedance is computed to provide an apparent power flow <code>SSC&nbsp;</code>out of the voltage source, assuming the voltage is set to the nominal value <code>UNom</code> and that the grid terminal is shorted to ground.</p>
<p>The actual modulus and phase of the voltage source are computed to give the required voltage modulus and phase <code>URef, UPhaseRef</code> during initialization.</p>
<p><b>Embedded Power Flow (EPF)</b>
<p>If the EPF is activated the equivalent grid uses the <a href=\"modelica://PowerGrids.Electrical.PowerFlow.SlackBus\">SlackBus</a> as default EPF component in order to fix both the voltage and the voltage phase at its node. The EPF component can be redeclared, the most common use of this feature is to move the slack node to another place, for example to the node of a strong generator, in this case the equivalent grid normally works as generic bus for the EPF calculaton (proposed choice).</p>
<p>If the EPF component is redeclared then the user shall provide all the necessary parameters either by using the GUI or in textual form.</p>
</body></html>"));
end EquivalentGrid;
