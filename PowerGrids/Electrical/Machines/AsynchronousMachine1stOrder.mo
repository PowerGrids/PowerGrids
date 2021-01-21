within PowerGrids.Electrical.Machines;

model AsynchronousMachine1stOrder
  import PowerGrids.Types.Choices.LocalInitializationOption;
  import PowerGrids.Types.Choices.InitializationOption;
  extends Icons.Machine;
  extends BaseClasses.OnePortACdqPU(portVariablesPhases=true,
  localInit = if initOpt == InitializationOption.localSteadyStateFixedPowerFlow
                then LocalInitializationOption.PQ
                else LocalInitializationOption.none);

  parameter Types.PerUnit RsPu "Stator resistance in p.u.";
  parameter Types.PerUnit XsPu "Stator reactance  in p.u.";
  parameter Types.PerUnit RrPu "Rotor resistance  in p.u.";
  parameter Types.PerUnit XrPu "Rotor reactance  in p.u.";
  parameter Types.PerUnit XmPu "Magnetization reactance  in p.u.";
  parameter Modelica.SIunits.Time H "Kinetic constant = kinetic energy / rated power";
  parameter Real ExpCm "Exponent of the torque-speed dependance - omegaPu^ExpCm";
  parameter Types.Choices.InitializationOption initOpt = systemPowerGrids.initOpt "Initialization option";
  
  parameter Types.ComplexPerUnit ZmPu  = Complex(0, XmPu) "Magetization impedance";
  final parameter Types.PerUnit slipPuStart(fixed = false) "Start value of phase-to-phase voltage phasor, phase angle";
  final parameter Types.PerUnit CmPuScaled(fixed = false) "The value of the mechanical torque when omegaPu = 0"; 
  final parameter SI.AngularVelocity omegaBase = systemPowerGrids.omegaNom "Base angular frequency value";
  constant Types.PerUnit omegaNomPu = 1 "Nominal frequency in p.u.";

  Types.PerUnit omegaRefPu = systemPowerGrids.omegaRef/systemPowerGrids.omegaNom "Reference frequency in p.u.";
  Types.PerUnit omegaPu "Angular frequency in p.u.";
  Types.PerUnit omegaSynchPu(start=1) "Electrical frequency at the machine port";

  Types.PerUnit CePu "Electrical torque in p.u. (base SNom/omegaBase)";
  Types.PerUnit CmPu "Mechanical torque in p.u. (base PNom/omegaBase)";
  Types.PerUnit slipPu(start = slipPuStart) "Machine slip";
  Types.ComplexPerUnit ZsrPu "Sum of stator and rotor impedance";
initial equation
  // Equations to compute start values
  port.QStart/port.SNom = (port.UStart/port.UNom)^2*(1 / XmPu + (XsPu + XrPu) // Q of equivalent circuit
                          / CM.'abs'(Complex(RsPu + RrPu / slipPuStart, XsPu + XrPu))^2); 
  
  // Equations to determine the initial state values
  if initOpt == InitializationOption.noInit then
    // No initial equations
  else
    der(omegaPu) = 0;
    CmPuScaled = CmPu/(omegaPu^ExpCm);
  end if;
equation
  // The equations will be written in the stator-aligned synchronous rotating frame
  if systemPowerGrids.referenceFrequency == PowerGrids.Types.Choices.ReferenceFrequency.nominalFrequency then
    omegaSynchPu*omegaBase = der(port.UPhase);
    der(theta) = (omegaSynchPu-omegaRefPu)*omegaBase;
  else
    theta = port.UPhase;
    omegaSynchPu = omegaRefPu;
  end if;
  // Mechanical equations
  CmPu = CmPuScaled*omegaPu^ExpCm;
  slipPu = omegaSynchPu - omegaPu;
  der(omegaPu) = -1 / (2 * H) * (CmPu - CePu);
  
  // Equivalent circuit equations
  ZsrPu = Complex(RsPu + RrPu / slipPu, XsPu + XrPu);
  CePu = port.VPu^2*RrPu/slipPu/CM.'abs'(ZsrPu)^2;
  port.iPu = port.vPu / ZsrPu + port.vPu / ZmPu;
end AsynchronousMachine1stOrder;
