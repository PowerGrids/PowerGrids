within PowerGrids.Electrical.Machines;

model AsynchronousMachineBase
  import PowerGrids.Types.Choices.LocalInitializationOption;
  import PowerGrids.Types.Choices.InitializationOption;
  extends Icons.Machine;
  extends BaseClasses.OnePortACdqPU(portVariablesPhases=true,
  localInit = if initOpt == InitializationOption.localSteadyStateFixedPowerFlow
                then LocalInitializationOption.PQ
                else LocalInitializationOption.none,
            final thetaStart = Modelica.Constants.pi/2);
  parameter Types.Choices.InitializationOption initOpt = systemPowerGrids.initOpt "Initialization option";

  parameter Types.PerUnit RsPu "Stator resistance in p.u.";
  parameter Types.PerUnit LsPu "Stator reactance in p.u.";
  parameter Types.PerUnit RrPu "Rotor resistance in p.u.";
  parameter Types.PerUnit LrPu "Rotor reactance in p.u.";
  parameter Types.PerUnit LmPu "Magnetization reactance in p.u.";
  parameter Modelica.SIunits.Time H "Kinetic constant = kinetic energy / rated power";

  parameter Types.PerUnit LssPu = LsPu + LmPu;
  parameter Types.PerUnit LrrPu = LrPu + LmPu;  
  
  final parameter Types.PerUnit udpPuStart(fixed = false) "Starting internal d-axis voltage";
  final parameter Types.PerUnit uqpPuStart(fixed = false) "Starting internal q-axis voltage";
  final parameter Types.PerUnit slipPuStart(fixed = false) "Starting slip";
  final parameter Types.PerUnit CePuStart(fixed=false);

  Types.PerUnit udpPu(start = udpPuStart) "Internal d-axis voltage in p.u.";
  Types.PerUnit uqpPu(start = uqpPuStart) "Internal q-axis voltage in p.u.";
  Types.PerUnit CePu(start=CePuStart) "Electrical torque";
  Types.PerUnit CmPu(start=CePuStart) "Mechanical torque";
  Types.PerUnit slip(start=slipPuStart, min = 0) "Machine slip in p.u.";
  Types.PerUnit omegaPu(start=1-slipPuStart) "Mechanical machine speed in p.u.";
  Types.PerUnit omegaRefPu = systemPowerGrids.omegaRef/systemPowerGrids.omegaNom "Reference frequency in p.u.";

initial equation
  // Keep the power constant
  port.PStart/port.SNom = udPuStart*idPuStart + uqPuStart*iqPuStart;
  
  // Start equations
  //0 = -RrPu / LrrPu * (udpPuStart + 1 *(LmPu^2/LrrPu)*iqPuStart) + slipPuStart * uqpPuStart;
  0 = -RrPu / LrrPu * (uqpPuStart - omegaRefPu *(LmPu^2/LrrPu)*idPuStart) - slipPuStart * udpPuStart;  
  udPuStart - udpPuStart = RsPu * idPuStart - omegaRefPu * (LssPu - LmPu^2 / LrrPu) * iqPuStart;
  uqPuStart - uqpPuStart = RsPu * iqPuStart + omegaRefPu * (LssPu - LmPu^2 / LrrPu) * idPuStart;
  CePuStart = udpPuStart * idPuStart + uqpPuStart * iqPuStart;

  der(omegaPu) = 0; 
  CmPu = CePuStart;
equation
  // Synchronous rotating frame
  theta = Modelica.Constants.pi/2;
  
  // Mechanical equations
  der(CmPu) = 0;
  der(omegaPu) = 1/2/H*(CePu - CmPu);
  slip = 1-omegaPu;
  
  // Electrical equations
  CePu = udpPu * idPu + uqpPu * iqPu;
  udPu - udpPu = RsPu * idPu - omegaRefPu * (LssPu - LmPu^2 / LrrPu) * iqPu;
  uqPu - uqpPu = RsPu * iqPu + omegaRefPu * (LssPu - LmPu^2 / LrrPu) * idPu;

end AsynchronousMachineBase;
