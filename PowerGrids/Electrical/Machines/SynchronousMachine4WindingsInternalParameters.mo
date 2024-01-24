within PowerGrids.Electrical.Machines;

model SynchronousMachine4WindingsInternalParameters "Synchronous machine with 4 windings - internal parameters"
  extends BaseClasses.OnePortACdqPU(
    final generatorConvention = true,
    localInit = if initOpt == InitializationOption.localSteadyStateFixedPowerFlow
                then LocalInitializationOption.PV
                else LocalInitializationOption.none);
  extends Icons.Machine;
  import PowerGrids.Types.Choices.InitializationOption;
  import PowerGrids.Types.Choices.LocalInitializationOption;

  parameter Types.ActivePower PNom = SNom "Nominal active (turbine) power";
  parameter Types.PerUnit raPu "Armature resistance in p.u.";
  parameter Types.PerUnit LdPu "Direct axis stator leakage in p.u.";
  parameter Types.PerUnit MdPu "Direct axis mutual inductance in p.u.";
  parameter Types.PerUnit mrcPu "Canay's mutual inductance in p.u.";
  parameter Types.PerUnit LDPu "Direct axis damper leakage in p.u.";
  parameter Types.PerUnit rDPu "Resistance of the direct axis damper in p.u.";
  parameter Types.PerUnit LfPu "Excitation winding leakage in p.u.";
  parameter Types.PerUnit rfPu "Resistance of the excitation windings in p.u.";
  parameter Types.PerUnit LqPu "Quadrature axis stator leakage in p.u.";
  parameter Types.PerUnit MqPu "Quadrature axis mutual inductance in p.u.";
  parameter Types.PerUnit LQ1Pu "Quadrature axis 1st damper leakage in p.u.";
  parameter Types.PerUnit rQ1Pu "Quadrature axis 2nd damper leakage in p.u.";
  parameter Types.PerUnit LQ2Pu "Leakage of quadrature axis 2nd damper in p.u.";
  parameter Types.PerUnit rQ2Pu "Resistance of quadrature axis 2nd damper in p.u.";
  parameter Types.PerUnit DPu = 0 "Damping coefficient of the swing equation in p.u.";
  parameter Modelica.SIunits.Time H "Kinetic constant = kinetic energy / rated power";
  parameter Types.Choices.ExcitationPuType excitationPuType = 
    PowerGrids.Types.Choices.ExcitationPuType.nominalStatorVoltageNoLoad "Choice of excitation base voltage";
  parameter Boolean neglectTransformerTerms = true "Neglect the transformer terms in the Park equations";
  parameter Boolean referenceGenerator = false "True if reference generator in an isolated synchronous system";
  parameter Types.Choices.InitializationOption initOpt = systemPowerGrids.initOpt "Initialization option";
  final parameter SI.AngularVelocity omegaBase = systemPowerGrids.omegaNom "Base angular frequency value";
  final parameter Types.PerUnit kuf(fixed = false) "Scaling factor for excitation p.u. voltage";
  constant Types.PerUnit omegaNomPu = 1 "Nominal frequency in p.u.";

  final parameter Types.PerUnit lambdadPuStart(fixed = false) "Start value of lambdadPu";
  final parameter Types.PerUnit lambdaqPuStart(fixed = false) "Start value of lambdaqPu";
  final parameter Types.PerUnit ufPuStart(fixed = false) "Start value of exciter voltage in p.u. (Kundur base)";
  final parameter Types.PerUnit ufPuInStart(fixed = false) "Start value of input exciter voltage in p.u. (user-selcted base";
  final parameter Types.PerUnit ifPuStart(fixed = false) "Start value of ifPu";
  // Input variables
  Modelica.Blocks.Interfaces.RealInput PmPu(unit = "1") "Input mechanical power in p.u. (base PNom)" annotation(
    Placement(visible = true, transformation(origin = {-106, 46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ufPuIn(unit = "1", start = ufPuInStart) "Input voltage of exciter winding in p.u. (user-selected base voltage)" annotation(
    Placement(visible = true, transformation(origin = {-104, -50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  // Output variables
  Modelica.Blocks.Interfaces.RealOutput omega(unit = "rad/s") "Angular frequency in rad/s for system object" annotation(
    Placement(visible = true, transformation(origin = {106, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {101, 59}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));        
// Other per-unit variables
  Modelica.Blocks.Interfaces.RealOutput omegaPu(start = 1) "Angular frequency in p.u." annotation(
    Placement(visible = true, transformation(origin = {106, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Types.PerUnit iDPu(start = 0) "Current of direct axis damper in p.u";
  Types.PerUnit ifPu(start = ifPuStart) "Current of excitation winding in p.u.";
  Types.PerUnit iQ1Pu(start = 0) "Current of quadrature axis 1st damper in p.u.";
  Types.PerUnit iQ2Pu(start = 0) "Current of quadrature axis 2nd damper in p.u.";
  Types.PerUnit ufPu(start = ufPuStart) "Voltage of exciter winding in p.u. (base voltage as per Kundur)";
  Types.PerUnit lambdadPu(start = lambdadPuStart) "Flux of direct axis in p.u.";
  Types.PerUnit lambdaqPu(start = lambdaqPuStart) "Flux of quadrature axis in p.u.";
  Types.PerUnit lambdaDPu "Flux of direct axis damper in p.u";
  Types.PerUnit lambdafPu "Flux of excitation winding in p.u.";
  Types.PerUnit lambdaQ1Pu "Flux of quadrature axis 1st damper in p.u.";
  Types.PerUnit lambdaQ2Pu "Flux of quadrature axis 1st damper in p.u.";
  Types.PerUnit omegaRefPu = systemPowerGrids.omegaRef/systemPowerGrids.omegaNom "Reference frequency in p.u.";
  Types.PerUnit CmPu(start = -PStart/SNom) "Mechanical torque in p.u. (base PNom/omegaBase)";
  Types.PerUnit CePu(start = -PStart/SNom) "Electrical torque in p.u. (base SNom/omegaBase)";
  Types.PerUnit PePu(start = -PStart/SNom) "Electrical power in p.u. (base SNom)";
  Types.PerUnit PePuPNom = PePu*SNom/PNom "Electrical active power in p.u. (base PNom)";

  // SI-unit variables
  Types.Frequency f = systemPowerGrids.fNom*omegaPu "Frequency of rotation of d-q axes";
  Modelica.Blocks.Interfaces.RealOutput VPu "Port voltage magnitude [pu]" annotation(
    Placement(visible = true, transformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput PPu "Active Power Production [pu base PNom]" annotation(
    Placement(visible = true, transformation(origin = {106, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  // Scaling factor for excitation p.u. voltage
  if excitationPuType == Types.Choices.ExcitationPuType.Kundur then
    kuf = 1 "Choice of per-unit as per Kundur textbook";
  else
    kuf = rfPu / MdPu "Base voltage gives 1 p.u. air-gap stator voltage at no load";
  end if;
  // Equations to compute start values
  // these equations are the same that involve the actual variables in the equation section
  // except that they involve the start values instead, and they do not contain terms which
  // are zero at steady state (e.g., all the damping winding currents)
  // the Modelica tool figures out automatically how to solve them for the unknown parameters
  udPuStart = raPu*idPuStart - omegaNomPu*lambdaqPuStart;
  uqPuStart = raPu*iqPuStart + omegaNomPu*lambdadPuStart;
  lambdadPuStart = (MdPu + LdPu)*idPuStart + MdPu*ifPuStart;
  ufPuStart =  rfPu*ifPuStart;
  ufPuInStart = ufPuStart/kuf;

  // Equations to determine the initial state values
  if initOpt == InitializationOption.noInit then
    // No initial equations
  else
    omegaPu = omegaNomPu;
    der(omegaPu) = 0;
    if not neglectTransformerTerms then
      der(lambdadPu) = 0;
      der(lambdaqPu) = 0;
    end if;
    der(lambdafPu) = 0;
    der(lambdaDPu) = 0;
    der(lambdaQ1Pu) = 0;
    der(lambdaQ2Pu) = 0;
  end if;
equation
  // Flux linkages
  lambdadPu = (MdPu + LdPu) * idPu + MdPu * ifPu + MdPu * iDPu;
  lambdafPu =     MdPu      *idPu + (MdPu + LfPu + mrcPu)*ifPu +    (MdPu + mrcPu)    *iDPu;
  lambdaDPu =     MdPu      *idPu +     (MdPu + mrcPu)   *ifPu + (MdPu + LDPu + mrcPu)*iDPu;
  lambdaqPu = (MqPu + LqPu) *iqPu +         MqPu         *iQ1Pu +        MqPu         *iQ2Pu;
  lambdaQ1Pu =     MqPu     *iqPu +     (MqPu + LQ1Pu )  *iQ1Pu +        MqPu         *iQ2Pu;
  lambdaQ2Pu =     MqPu     *iqPu +         MqPu         *iQ1Pu +    (MqPu + LQ2Pu)   *iQ2Pu;

  // Equivalent circuit equations in Park's coordinates
  if neglectTransformerTerms then
    udPu = raPu * idPu - omegaPu * lambdaqPu;
    uqPu = raPu * iqPu + omegaPu * lambdadPu;
  else
    udPu = raPu * idPu - omegaPu * lambdaqPu + der(lambdadPu) / omegaBase;
    uqPu = raPu * iqPu + omegaPu * lambdadPu + der(lambdaqPu) / omegaBase;
  end if;  
  ufPu =  rfPu *ifPu  + der(lambdafPu)/omegaBase;
  0    =  rDPu *iDPu  + der(lambdaDPu)/omegaBase;
  0    =  rQ1Pu*iQ1Pu + der(lambdaQ1Pu)/omegaBase;
  0    =  rQ2Pu*iQ2Pu + der(lambdaQ2Pu)/omegaBase;

  // Mechanical equations
  der(theta) = (omegaPu - omegaRefPu) * omegaBase;
  2*H*der(omegaPu) = (CmPu*PNom/SNom - CePu) - DPu*(omegaPu - omegaRefPu);
  CePu = lambdaqPu*idPu - lambdadPu*iqPu;
  PePu = CePu*omegaPu;
  PmPu = CmPu*omegaPu;
  omega = omegaPu*omegaBase;

  // Excitation voltage p.u. conversion
  ufPu = ufPuIn * kuf;

  // Output signal equations
  VPu = port.VPu;
  PPu = -port.P/PNom;
annotation(
    Documentation(info = "<html><head></head><body><p>Model of a sychronous machine with four windings. The transformer voltage terms are neglected if <code>neglectTransformerTerms=true</code>. The model parameters refer directly to internal physical parameters such as inductances and resistances.</p>
<p>The model is taken from the theory manual of the Eurostag software. For consistency with the base class <a href=\"modelica://PowerGrids.Electrical.BaseClasses.OnePortACdq\">OnePortACdq</a>, however, the currents ifPu, idPu and iqPu are all assumed to be positive entering, while the Eurostag manual assumes them to be all positive leaving. Therefore, all the current and fluxes have an opposite sign in the Park equations.</p>
<p>This model is in fact equivalent to the model described in Kundur, Power Systems Stability and Control, Chapter 3, except for the current sign conventions, which in that case are assumed to be positive entering for the rotor winding and positive leaving for the direct and quadrature stator axes. The correspondance of the parameter symbols is given in the table, all parameters are in p.u. referred to the machine rated values.</p>
<table>
<tbody><tr><th>PowerGrids</th><th>Kundur</th><th>Meaning</th></tr>
<tr><td>raPu</td><td>Ra</td><td>Armature resistance</td>
</tr><tr><td>rDPu</td><td>R1d</td><td>Resistance of the direct axis damper</td>
</tr><tr><td>rfPu</td><td>Rfd</td><td>Resistance of the excitation windings</td>
</tr><tr><td>rQ1</td><td>R1q</td><td>Resistance of the quadrature axis 1st damper</td></tr><tr><td>rQ2</td><td>R2q</td><td>Resistance of the quadrature axis 2nd damper</td>
</tr><tr><td>MdPu</td><td>Lad</td><td>Direct axis mutual inductance</td>
</tr><tr><td>MqPu</td><td>Laq</td><td>Quadrature axis mutual inductance</td>
</tr><tr><td>LdPu</td><td>Ll</td><td>Direct axis stator leakage</td>
</tr><tr><td>LqPu</td><td>Ll</td><td>Quadrature axis stator leakage</td>
</tr><tr><td>LDPu</td><td>L1d</td><td>Direct axis damper leakage</td>
</tr><tr><td>LQ1Pu</td><td>L1q</td><td>Quadrature axis 1st damper leakage</td>
</tr><tr><td>LQ2Pu</td><td>L2q</td><td>Quadrature axis 2nd damper leakage</td>
</tr><tr><td>LfPu</td><td>Lfd</td><td>Excitation winding leakage</td>
</tr><tr><td>mrcPu</td><td>Lfld-Lad</td><td>Canay's mutual inductance</td>
</tr></tbody></table>
<p>Two different choices of base excitation voltage are available</p>
<ul>
<li><code>Types.ExcitationPuType.nominalStatorVoltageNoLoad</code>: 1 p.u. of excitation voltage gives 1 p.u. of air-gap stator voltage at no-load conditions</li>
<li><code>Types.ExcitationPuType.Kundur</code>: base voltage as in Kundur, Power Systems Stability and Control, Chapter 3. Note that in this case, typical p.u. values are less than 0.001</li>
</ul>
</body></html>"));
end SynchronousMachine4WindingsInternalParameters;
