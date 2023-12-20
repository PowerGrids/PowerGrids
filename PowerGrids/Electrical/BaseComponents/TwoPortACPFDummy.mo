within PowerGrids.Electrical.BaseComponents;

model TwoPortACPFDummy "Dummy power flow component to be used as default for embedded power flow to avoid instantiating partial classes"
  extends Electrical.BaseClasses.TwoPortACPF;
equation
  portA.i = Complex(0);
  portB.i = Complex(0);
  assert(false, "Not meant to be used in simulation");
end TwoPortACPFDummy;
