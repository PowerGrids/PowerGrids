within PowerGrids.Interfaces;

connector TerminalACBase "Base class for connectors of components including optional embedded power flow"
  extends TerminalACVI;
  Types.ReferenceAngularVelocityPu omegaRefPu "Reference angular speed in PerUnit";
  TerminalACPF terminalACPF "Connector for embedded power flow";
end TerminalACBase;
