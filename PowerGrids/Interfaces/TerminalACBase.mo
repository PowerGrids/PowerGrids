within PowerGrids.Interfaces;

connector TerminalACBase
  Types.ComplexVoltage v "Phase-to-ground voltage phasor";
  flow Types.ComplexCurrent i "Line current phasor";
  Types.ReferenceAngularVelocityPu omegaRefPu "Reference angular speed in PerUnit";
end TerminalACBase;
