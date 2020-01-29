within PowerGrids;

package Interfaces "Interfaces package"
  extends Modelica.Icons.InterfacesPackage;

  connector TerminalAC "Terminal for phasor-based AC connections"
    Types.ComplexVoltage v "Phase-to-ground voltage phasor";
    flow Types.ComplexCurrent i "Line current phasor";
    annotation(
      Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 1, grid = {2, 2}), graphics = {Rectangle(origin = {92, 3}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid, extent = {{-192, 97}, {8, -103}})}),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 1, grid = {2, 2})),
  Documentation(info = "<html><head></head><body><p>
The TerminalAC connector represents a three-phase AC terminal. Voltages and currents are assumed to be quasi-sinusoidal and are thus represented by \"phasors\". The phasor gives the amplitude and rotation of the three-phase system with respect to a reference rotating frame. </p>
<p>
The information about the rotating frame cannot be carried by the connector because, with the Modelica 3.x semantics of overconstraind connectors, it won't be possible to dynamically split and merge synchronous island by opening and closing breakers during the simulation. As this feature is essential for the modelling of power transmission systems at the national or continental scale, the reference frame information is instead managed by the system object. For the correctness of models, all the components which are effectively interconnected (i.e., not through an open circuit breaker) must refer to the same reference frequency.
</p>
</body></html>"));
  end TerminalAC;



end Interfaces;
