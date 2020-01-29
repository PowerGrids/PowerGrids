within PowerGrids.Electrical.Machines;

model SynchronousMachine4Windings "Synchronous machine with four windings - external parameters"
  // General-purpose start values are provided, to avoid division by zero errors.
  // These values don't need to be modified for specific machine instancces
  extends SynchronousMachine4WindingsInternalParameters(
    final LdPu(fixed = false, min = 1e-3, start = 0.1),
    final MdPu(fixed = false, min = 1e-3, start = 1),
    final rfPu(fixed = false, min = 1e-5, start = 0.001),
    final rDPu(fixed = false, min = 1e-4, start = 0.01),
    final LfPu(fixed = false, min = 1e-3, start = 0.1),
    final LDPu(fixed = false, min = 1e-3, start = 0.2),
    final mrcPu(fixed = false),
    final LqPu(fixed = false,  min = 1e-3, start = 0.1),
    final MqPu(fixed = false,  min = 1e-3, start = 1),
    final rQ1Pu(fixed = false, min = 1e-5, start = 0.01),
    final rQ2Pu(fixed = false, min = 1e-5, start = 0.001),
    final LQ1Pu(fixed = false, min = 1e-3, start = 0.5),
    final LQ2Pu(fixed = false, min = 1e-3, start = 0.1),
    final thetaStart = 
      UPhaseStart + 
      atan2(xqPu*IStartPu*cosPhiStart - raPu*IStartPu*sinPhiStart, 
            VStartPu + raPu*IStartPu*cosPhiStart + xqPu*IStartPu*sinPhiStart));
  // External parameters
  parameter Types.PerUnit xlPu "Stator leakage in p.u.";
  parameter Types.PerUnit xdPu "Direct axis reactance in p.u.";
  parameter Types.PerUnit xpdPu "Direct axis transient reactance in p.u.";
  parameter Types.PerUnit xppdPu "Direct axis sub-transient reactance p.u.";
  parameter Types.Time Tpd0 "Direct axis, open circuit transient time constant";
  parameter Types.Time Tppd0 "Direct axis, open circuit sub-transient time constant";
  parameter Types.PerUnit xqPu "Quadrature axis reactance in p.u.";
  parameter Types.PerUnit xpqPu "Quadrature axis transient reactance in p.u.";
  parameter Types.PerUnit xppqPu "Quadrature axis sub-transient reactance in p.u.";
  parameter Types.Time Tpq0 "Open circuit quadrature axis transient time constant";
  parameter Types.Time Tppq0 "Open circuit quadrature axis sub-transient time constant";
  parameter Types.Choices.TimeConstantsApproximation timeConstApprox =
    PowerGrids.Types.Choices.TimeConstantsApproximation.classicalDefinition
    "Approximation of time constants for internal parameter computation";

  // Auxiliary parameters, direct and quadrature axis
  // Start values are good enough to achieve convergence for all realistic
  // values of the constants
  final parameter Types.PerUnit T1dPu(fixed = false, min = 0, start = 1000);
  final parameter Types.PerUnit T2dPu(fixed = false, min = 0, start = 100);
  final parameter Types.PerUnit T3dPu(fixed = false, min = 0, start = 10);
  final parameter Types.PerUnit T4dPu(fixed = false, min = 0, start = 1000);
  final parameter Types.PerUnit T5dPu(fixed = false, min = 0, start = 100);
  final parameter Types.PerUnit T6dPu(fixed = false, min = 0, start = 10);

  final parameter Types.PerUnit T1qPu(fixed = false, min = 0, start = 1000);
  final parameter Types.PerUnit T2qPu(fixed = false, min = 0, start = 100);
  final parameter Types.PerUnit T3qPu(fixed = false, min = 0, start = 10);
  final parameter Types.PerUnit T4qPu(fixed = false, min = 0, start = 100);
  final parameter Types.PerUnit T5qPu(fixed = false, min = 0, start = 100);
  final parameter Types.PerUnit T6qPu(fixed = false, min = 0, start = 10);

  final parameter Types.Time Tpd(fixed = false, min = 0, start = 10);
  final parameter Types.Time Tppd(fixed = false, min = 0,start = 0.1);
  final parameter Types.Time Tpq(fixed = false, min = 0, start = 1);
  final parameter Types.Time Tppq(fixed = false, min = 0, start = 0.1);
  
  // Start values
  final parameter Types.PerUnit cosPhiStart = abs(PStart)/sqrt(PStart^2+QStart^2+1e-9*SNom)
    "Start value of power factor cos(phi)";
  final parameter Types.PerUnit sinPhiStart = sqrt(1 - cosPhiStart^2)
    "Start value of sin(phi)";
  final parameter Types.PerUnit VStartPu = port.VStart/port.VBase "Start value of voltage modulus in p.u.";
  final parameter Types.PerUnit IStartPu = port.IStart/port.IBase "Start value of current modulus in p.u.";
initial equation
  // Initial equations to determine the internal parameters as a function
  // of the external ones
  //
  // These equations, found in the Kundur textbook, would allow to compute the external parameters
  // explicitly, given the internal parameters. The Modelica tool figures out automatically
  // how to solve them backwards, using symbolic and numerical techniques


  // Modelling assumption taken by Kundur
  LqPu = xlPu;
  LdPu = xlPu; 

  // Direct axis
  MdPu + LdPu = xdPu;
  T1dPu = (MdPu + LfPu)/rfPu;
  T2dPu = (MdPu + LDPu)/rDPu;
  T3dPu = (LDPu + MdPu * LfPu / (MdPu + LfPu)) / rDPu;
  T4dPu = (LfPu + MdPu * LdPu / (MdPu + LdPu)) / rfPu;
  T5dPu = (LDPu + MdPu * LdPu / (MdPu + LdPu)) / rDPu;
  T6dPu = (LDPu + MdPu * LdPu * LfPu / (MdPu * LdPu + MdPu * LfPu + LdPu * LfPu)) / rDPu;

  // For the accurate and exact case, the equations are first solved by the Modelica tool
  // using the approximate values, which are given by the second argument of the
  // homotopy() operator. Then, the solution to the accurate or exact equations is
  // computed by a continuation method, whereby the approximated expression is smoothly
  // transformed into the actual one
  if timeConstApprox == Types.Choices.TimeConstantsApproximation.classicalDefinition then
    Tpd0  * omegaBase = T1dPu;
    Tppd0 * omegaBase = T3dPu;
    Tpd   * omegaBase = T4dPu;
    Tppd  * omegaBase = T6dPu;
  elseif timeConstApprox == Types.Choices.TimeConstantsApproximation.accurateEstimation then
    Tpd0  * omegaBase = homotopy(T1dPu + T2dPu,               T1dPu);
    Tppd0 * omegaBase = homotopy(T1dPu*T3dPu/(T1dPu + T2dPu), T3dPu);
    Tpd   * omegaBase = homotopy(T4dPu + T5dPu,               T4dPu);
    Tppd  * omegaBase = homotopy(T4dPu*T6dPu/(T4dPu + T5dPu), T6dPu);
  else
    Tpd0  * omegaBase = homotopy( Functions.largerTimeConstant(T1dPu + T2dPu, T1dPu*T3dPu), T1dPu);
    Tppd0 * omegaBase = homotopy(Functions.smallerTimeConstant(T1dPu + T2dPu, T1dPu*T3dPu), T3dPu);
    Tpd   * omegaBase = homotopy( Functions.largerTimeConstant(T4dPu + T5dPu, T4dPu*T6dPu), T4dPu);
    Tppd  * omegaBase = homotopy(Functions.smallerTimeConstant(T4dPu + T5dPu, T4dPu*T6dPu), T6dPu);
  end if;
  xpdPu   = xdPu *Tpd /Tpd0;
  xppdPu  = xpdPu*Tppd/Tppd0;

  // Quadrature axis
  MqPu + LqPu = xqPu;
  T1qPu = (MqPu + LQ1Pu)/rQ1Pu;
  T2qPu = (MqPu + LQ2Pu)/rQ2Pu;
  T3qPu = (LQ2Pu + MqPu * LQ1Pu / (MqPu + LQ1Pu))/ rQ2Pu;
  T4qPu = (LQ1Pu + MqPu * LqPu  / (MqPu + LqPu)) / rQ1Pu;
  T5qPu = (LQ2Pu + MqPu * LqPu  / (MqPu + LqPu)) / rQ2Pu;
  T6qPu = (LQ2Pu + MqPu * LqPu * LQ1Pu / (MqPu * LqPu + MqPu * LQ1Pu + LqPu * LQ1Pu)) / rQ2Pu;
  if timeConstApprox == Types.Choices.TimeConstantsApproximation.classicalDefinition then
    Tpq0 *omegaBase = T1qPu;
    Tpq  *omegaBase = T4qPu;
    Tppq0*omegaBase = T3qPu;
    Tppq *omegaBase = T6qPu;
  elseif timeConstApprox == Types.Choices.TimeConstantsApproximation.accurateEstimation then
    Tpq0  * omegaBase = homotopy(T1qPu + T2qPu,               T1qPu);
    Tppq0 * omegaBase = homotopy(T1qPu*T3qPu/(T1qPu + T2qPu), T3qPu);
    Tpq   * omegaBase = homotopy(T4qPu + T5qPu,               T4qPu);
    Tppq  * omegaBase = homotopy(T4qPu*T6qPu/(T4qPu + T5qPu), T6qPu);
  else
    Tpq0  * omegaBase = homotopy( Functions.largerTimeConstant(T1qPu + T2qPu, T1qPu*T3qPu), T1qPu);
    Tppq0 * omegaBase = homotopy(Functions.smallerTimeConstant(T1qPu + T2qPu, T1qPu*T3qPu), T3qPu);
    Tpq   * omegaBase = homotopy( Functions.largerTimeConstant(T4qPu + T5qPu, T4qPu*T6qPu), T4qPu);
    Tppq  * omegaBase = homotopy(Functions.smallerTimeConstant(T4qPu + T5qPu, T4qPu*T6qPu), T6qPu);
  end if;
  xpqPu   = xqPu *Tpq /Tpq0;
  xppqPu  = xpqPu*Tppq/Tppq0;
  
  mrcPu = 0;
  annotation(
    Documentation(info = "<html><head></head><body><p>Same as <a href=\"modelica://PowerGrids.Electrical.Machines.SynchronousMachine4WindingsInternalParameters\">SynchronousMachine4WindingsInternalParameters</a>, but using external parameters such as transient and sub-transient time constants.</p>
<p>The parameter transformation is carried out according to the relationships described by P. Kundur, Power System Stability and Control, chapter 4.</p> 
<p>Currently, only the case with zero Canay's coupling inductance is handled</p>

</body></html>"));
end SynchronousMachine4Windings;
