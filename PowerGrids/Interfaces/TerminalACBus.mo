within PowerGrids.Interfaces;

connector TerminalACBus "Terminal for phasor-based buses"
  extends TerminalACBase;
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 1, grid = {2, 2}), graphics = {Rectangle(origin = {92, 3}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-192, 97}, {8, -103}})}),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 1, grid = {2, 2})),
Documentation(info = "<html><head></head><body><p>
The TerminalACBus connector represents a three-phase AC terminal for Buses. Voltages and currents are assumed to be quasi-sinusoidal and are thus represented by \"phasors\". The phasor gives the amplitude and rotation of the three-phase system with respect to a reference rotating frame. </p>
<p>
The information about the rotating frame is carried by the connector by musing the overconstrained semantic. The UStart and UPhaseStart values are also carried out by the connector to the connected components.</p>
</body></html>"));
end TerminalACBus;
