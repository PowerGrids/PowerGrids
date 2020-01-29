within PowerGrids;

package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

   annotation(
    preferredView = "info",
    Documentation(info = "<html><head></head><body><p>
The PowerGrid library is a Modelica library for the modelling of AC power generation and transmission grids, possibly including DC links.
</p>
<p>
Three-phase AC voltage and current systems are balanced and represented by complex phasors. Quasi-static relationships between currents and voltages are assumed, described by complex equations involving the phasors. Dynamic phenomena are confined to the inertia of rotating machinery and to controllers.</p>
<p>Phasors represent the rotation of the corresponding three-phase system with respect to a rotating reference frame. The models of electrically interconnected AC systems are valid as long as the reference frame is the same for all of them.</p>
<p>The library will eventually allow to model the splitting and merging of synchronous islands in grid models, triggered by the opening and closing of circuit breakers. Since the topology of connected islands is not static but can change during the simulation, the reference frame information cannot be carried by variables on overconstrained connectors, as in other Modelica libraries such as <a href=\"modelica://Modelica.Electrical.MultiPhase\">Modelica.Electrical.MultiPhase</a> or <a href=\"modelica://PowerSystems\">PowerSystems</a>; it is instead managed by a System object.</p>
<p>Physical quantities in SI units are used on the connectors and, where appropriate, in the physical equations of the component models. The nominal attribute of Real variables is used in order to guarantee the proper scaling of the problem for the numerical solvers.</p>
</body></html>"));
end UsersGuide;
