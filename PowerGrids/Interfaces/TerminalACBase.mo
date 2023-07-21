within PowerGrids.Interfaces;
connector TerminalACBase
  Types.ComplexVoltage v "Phase-to-ground voltage phasor";
  flow Types.ComplexCurrent i "Line current phasor";
  parameter Boolean computeEPF "=true, includes embedded power flow sub-connetor";
  TerminalACBase terminalEPF(final computeEPF = false);
  Types.ReferenceAngularVelocityPu omegaRefPu "Reference angular speed in PerUnit";
end TerminalACBase;
