within PowerGrids;

package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

   annotation(
    preferredView = "info",
    Documentation(info = "<html><head></head><body>
<p>The PowerGrid library is a Modelica library designed for the modelling of AC power generation and transmission grids, possibly including DC links. It can also be used for the modelling of AC power distribution systems.</p>
<p>Three-phase AC voltage and current systems are assumed to be balanced and represented by complex phasors. Quasi-static relationships between currents and voltages are assumed, described by complex equations involving the phasors. Dynamic phenomena are confined to the inertia of rotating machinery and to controllers.</p>
<p>Physical quantities in SI units are used on the connectors and, where appropriate, in the physical equations of the component models. Proper scaling of the problem for numerical solvers is achieved by using the nominal attribute of SI variables in the model.</p>
<p>PowerGrids components feature optional embedded models for the computation of the initial power flow problem, which is automatically formulated and solved at initialization. Hence, there is no need of a separate software to solve the initial power flow problem. However, it is also possible to disable the embedded power flow and use the results of an external power flow solver for initialization.</p>
</body></html>"));
end UsersGuide;
