within PowerGrids.Electrical.BaseComponents;

partial model ShuntConductanceVI
  extends PowerGrids.Electrical.BaseClasses.OnePortACVI(
    final isLinear = true);
  input Types.ComplexAdmittance Y "Shunt admittance";
  Types.ComplexVoltage v(re(nominal = port.VNom), im(nominal = port.VNom)) = port.v;
  Types.ComplexCurrent i(re(nominal = port.INom), im(nominal = port.INom)) = port.i;
equation
  i = Y*v;
end ShuntConductanceVI;
