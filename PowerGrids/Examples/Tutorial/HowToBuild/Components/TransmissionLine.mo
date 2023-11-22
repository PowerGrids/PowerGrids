within PowerGrids.Examples.Tutorial.HowToBuild.Components;

model TransmissionLine
  extends PowerGrids.Icons.Line;    
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

  parameter Types.Voltage UNom(start = 400e3) "Nominal/rated voltage";
  parameter Types.Resistance R "Series resistance";
  parameter Types.Reactance X "Series reactance";
  final parameter Types.ComplexImpedance Z = Complex(R,X) "Series impedance";

  Types.ComplexVoltage vA = portA.v;
  Types.ComplexVoltage vB = portB.v;
  Types.ComplexCurrent iA = portA.i;
  Types.ComplexCurrent iB = portB.i;
  Types.ComplexVoltage vz(re(nominal = portB.VNom), im(nominal = portB.VNom));
      
equation
  // Kirchhoff's laws
  iA + iB = Complex(0);
  vz = vA - vB;
  
  // Ohm's law equations
  vz = Z*iA;
end TransmissionLine;
