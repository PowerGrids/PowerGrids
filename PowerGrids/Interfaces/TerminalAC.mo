within PowerGrids.Interfaces;

connector TerminalAC "Terminal for phasor-based AC connections"
  extends TerminalACBase;
  input Types.Voltage UStart "Start value of phase-to-phase voltage";
  input Types.Angle UPhaseStart "Start value of phase-to-phase voltage angle";  
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 1, grid = {2, 2}), graphics = {Rectangle(origin = {92, 3}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-192, 97}, {8, -103}})}),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 1, grid = {2, 2})),
Documentation(info = "<html><head></head><body><p>

The TerminalAC connector represents a three-phase AC terminal for non-Buses components. Voltages and currents are assumed to be quasi-sinusoidal and are thus represented by \"phasors\". The phasor gives the amplitude and rotation of the three-phase system with respect to a reference rotating frame.
</p><p>&nbsp;The information about the rotating frame is carried by the connector by musing the overconstrained semantic. The UStart and UPhaseStart values are received via connector from the connected Bus.
</p>
</body></html>"));
end TerminalAC;
