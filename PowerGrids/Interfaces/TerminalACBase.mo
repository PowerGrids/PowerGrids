within PowerGrids.Interfaces;

partial connector TerminalACBase "Base class for connectors of components including optional embedded power flow"
  extends TerminalACVI;
  Types.ReferenceAngularVelocityPu omegaRefPu "Reference angular speed in PerUnit";
  parameter Boolean computePF = false "= true activates the sub-connector for embedded power flow computation";
  TerminalACPF terminalACPF if computePF "Connector for embedded power flow";
end TerminalACBase;
