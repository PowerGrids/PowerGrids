within PowerGrids.Electrical.BaseClasses;

model ShuntConductance "Connects the port to ground via a conductor"
  extends OnePortAC;
  input Types.ComplexAdmittance Y "Shunt admittance";
  Types.ComplexVoltage v(re(nominal = port.VNom), im(nominal = port.VNom)) = port.v;
  Types.ComplexCurrent i(re(nominal = port.INom), im(nominal = port.INom)) = port.i;
equation
  i = Y*v;
end ShuntConductance;
