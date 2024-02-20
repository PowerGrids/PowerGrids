within PowerGrids.Electrical.Buses;

model EquivalentGrid "Equivalent grid model characterized by short circuit capacity"
  import Modelica.ComplexMath;
  extends Icons.Grid(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase, PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
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
    redeclare PowerGrids.Electrical.PowerFlow.SlackBus componentPF(
      SNom = SNom, 
      UNom = UNom,
      U = URef,
      UPhase = UPhaseRef));
  
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

initial equation
  // Initial voltage at port fixed at reference values
  port.u = ComplexMath.fromPolar(URef, UPhaseRef);

equation
  // Overconstrained connector
  Connections.potentialRoot(terminalAC.omegaRefPu);
  if Connections.isRoot(terminalAC.omegaRefPu) then
     terminalAC.omegaRefPu = 1;
  end if;

annotation(
    Documentation(info = "<html><head></head><body><p>This model describes an equivalent grid with an internal impedance driven by a constant voltage source.</p>
<p>The impedance is computed to provide an apparent power flow <code>SSC&nbsp;</code>out of the voltage source, assuming the voltage is set to the nominal value <code>UNom</code> and that the grid terminal is shorted to ground.</p>
<p>The actual modulus and phase of the voltage source are computed to give the required voltage modulus and phase <code>URef, UPhaseRef</code> during initialization.</p>
</body></html>"));
end EquivalentGrid;
