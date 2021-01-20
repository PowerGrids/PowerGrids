within PowerGrids.Electrical.Machines;

model AsynchronousMachine1stOrderNoSlipStart
  import PowerGrids.Types.Choices.LocalInitializationOption;
  extends Icons.Machine;
  extends BaseClasses.OnePortAC(portVariablesPu = true,
  localInit = LocalInitializationOption.PQ); 
  
  parameter Types.Choices.InitializationOption initOpt = systemPowerGrids.initOpt "Initialization option";
  parameter Types.PerUnit RsPu "Stator resistance in p.u.";
  parameter Types.PerUnit XsPu "Stator reactance  in p.u.";
  parameter Types.PerUnit RrPu "Rotor resistance  in p.u.";
  parameter Types.PerUnit XrPu "Rotor reactance  in p.u.";
  parameter Types.PerUnit XmPu "Magnetization reactance  in p.u.";
  parameter Modelica.SIunits.Time H "Kinetic constant = kinetic energy / rated power";
  final parameter Types.PerUnit CePuStart(fixed=false);
  
  Types.PerUnit omegaRefPu = systemPowerGrids.omegaRef/systemPowerGrids.omegaNom "Reference frequency in p.u.";
  Types.PerUnit omegaPu "Angular frequency in p.u.";
  Types.PerUnit CePu(start=CePuStart) "Electrical torque in p.u. (base SNom/omegaBase)";
  Types.PerUnit CmPu "Mechanical torque in p.u. (base PNom/omegaBase)";
  Types.PerUnit slipPu;
  Types.ComplexPerUnit ZsrPu = Complex(RsPu + RrPu / slipPu, XsPu + XrPu) "Sum of stator and rotor impedance";
  Types.ComplexPerUnit ZmPu  = Complex(0, XmPu) "Magetization impedance";
initial equation
  der(slipPu) = 0;
  CePuStart = (port.UStart/port.UNom)^2*RrPu/slipPu/CM.'abs'(ZsrPu)^2;
  CmPu = CePuStart;
equation
  // Mechanical equations
  der(CmPu) = 0; // Temporary load torque changes disabled
  slipPu = omegaRefPu - omegaPu;
  der(omegaPu) = -1 / (2 * H) * (CmPu - CePu);
  // Equivalent circuit equations
  CePu = port.VPu^2*RrPu/slipPu/CM.'abs'(ZsrPu)^2;
  port.iPu = port.vPu / ZsrPu + port.vPu / ZmPu;
   
end AsynchronousMachine1stOrderNoSlipStart;
