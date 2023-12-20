within PowerGrids.Interfaces;

partial connector TerminalACBase "Base class for connectors of components including optional embedded power flow"
  extends TerminalACVI;
  Types.ReferenceAngularVelocityPu omegaRefPu "Reference angular speed in PerUnit";
  // Default set to true to allow checking the conditional sub-connector
  parameter Boolean computePF(start = true) "= true activates the sub-connector for embedded power flow computation";
  TerminalACPF terminalACPF if computePF "Connector for embedded power flow";
end TerminalACBase;
