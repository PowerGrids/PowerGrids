within PowerGrids.Interfaces;

connector TerminalACPF "Connector to be used for embedded power flow computation"
  extends TerminalACVI;
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}));
end TerminalACPF;
