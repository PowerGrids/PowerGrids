within PowerGrids.Examples.Tutorial.HowToBuild.Components;

model TransmissionLine
  extends PowerGrids.Electrical.BaseClasses.TwoPortAC(
    final UNomA = UNom,
    final UNomB = UNom,
    SNom = UNom^2/CM.abs(Complex(R,X)),
    final hasSubPF,
    redeclare PowerGrids.Electrical.PowerFlow.LineConstantImpedancePF componentPF(
      UNom = UNom,
      SNom = SNom,
      R = R,
      X = X,
      G = 0,
      B = 0));
      
  extends PowerGrids.Icons.Line;    

  parameter Types.Voltage UNom(start = 400e3) "Nominal/rated voltage";
  parameter Types.Resistance R "Series resistance";
  parameter Types.Reactance X "Series reactance";
  final parameter Types.ComplexImpedance Z = Complex(R,X) "Series impedance";

  Types.ComplexVoltage vA(re(nominal = portA.VNom), im(nominal = portA.VNom)) = portA.v;
  Types.ComplexVoltage vB(re(nominal = portB.VNom), im(nominal = portB.VNom)) = portB.v;
  Types.ComplexCurrent iA(re(nominal = portA.INom), im(nominal = portA.INom)) = portA.i;
  Types.ComplexCurrent iB(re(nominal = portB.INom), im(nominal = portB.INom)) = portB.i;
  Types.ComplexVoltage vz(re(nominal = portB.VNom), im(nominal = portB.VNom));
  Types.ComplexCurrent iz(re(nominal = portB.INom), im(nominal = portB.INom));
      
equation
  // aliases
  iz = iA;

  // Kirchhoff's laws
  iA + iB = Complex(0);
  vz = vA - vB;
  
  // Constitutive equations
  vz = Z*iz;

end TransmissionLine;
