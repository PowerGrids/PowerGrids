within PowerGrids.Interfaces;

connector TerminalACVI "Basic electrical interface for AC terminals"
  Types.ComplexVoltage v "Phase-to-ground voltage phasor";
  flow Types.ComplexCurrent i "Line current phasor";
end TerminalACVI;
