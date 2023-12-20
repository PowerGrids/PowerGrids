within PowerGrids.Electrical.BaseComponents;

model OnePortACPFDummy "Dummy power flow component to be used as default for embedded power flow to avoid instantiating partial classes"
  extends Electrical.BaseClasses.OnePortACPF;
equation
  port.i = Complex(0);
  assert(false, "Not meant to be used in simulation");
end OnePortACPFDummy;
