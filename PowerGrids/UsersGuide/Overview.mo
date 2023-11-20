within PowerGrids.UsersGuide;

package Overview
  extends Modelica.Icons.Information;
   annotation(
    preferredView = "info",
    Documentation(info = "<html><head></head><body><p>
The PowerGrid library is a Modelica library designed for the modelling of AC power generation and transmission grids, possibly including DC links. It can also be used for the modelling of AC power distribution systems, as long as balanced three-phase operation can be assumed.</p>
<p>
The library is meant to be used to model small-scale systems, e.g. for teaching, as well as medium- and large-scale systems. Small system models can be built and managed with the graphical user interface of Modelica tools, while larger models can be built automatically in textual form by suitable scripts, starting from information contained in, e.g., CIM files.
</p>
<p>
The library has been specifically designed to exploit advanced features of Modelica, while at the same time keeping a low entry barrier for power engineers who want to develop their own models. The design principles and rationale of the library are discussed in the <a href=\"modelica://PowerGrids.UsersGuide.Tutorial\">PowerGrids.UsersGuide.Tutorial</a>.
The idea is that the basic infrastructure of models (including
aspects such as basic quantity computations, scaling, and
initialization) is handled by base classes which are pre-defined in
the library, so that one can extend them using the Modelica inheritance mechanism and just focus on writing the core model equations, when developing new models.</p>
<p>Three-phase AC voltage and current systems are assumed to be balanced and represented by complex phasors. Quasi-static relationships between currents and voltages are assumed, described by complex equations involving the phasors. Dynamic phenomena are confined to the inertia of rotating machinery and to controllers.</p>
<p>Phasors represent the rotation of the corresponding three-phase system with respect to a rotating reference frame. The models of  interconnected AC systems are valid as long as the reference frame is the same for all of them. To this aim, the frequency of the reference frame is propagated through synchronously connected systems using <a href=\"https://specification.modelica.org/maint/3.6/connectors-and-connections.html#equation-operators-for-overconstrained-connection-based-equation-systems1\">overconstrained connectors</a>, similarly to  what is done in other Modelica power system libraries such as <a href=\"modelica://Modelica.Electrical.MultiPhase\">Modelica.Electrical.MultiPhase</a> or <a href=\"modelica://PowerSystems\">PowerSystems</a>. This allows to include more than one synchronously connected sub-systems in the same system model, as long as they are not directly connected by AC branches components; for example, they could be connected by a DC link.</p>
<p>Physical quantities in SI units are used on the connectors and, where appropriate, in the physical equations of the component models. The nominal attribute of SI variables is set in order to guarantee the proper scaling of the problem for the numerical solvers.</p>
<p>The library has been developed with the open source <a href=\"https://openmodelica.org\">OpenModelica</a> tool and is meant to be compatible with any Modelica tool that fully supports the standard. The efficient simulation of model with more than a handful of nodes requires the use of direct sparse DAE solvers, since the system model is sparse in the DAE representation, but becomes dense and unnecessary cumbersome if reduced to an ODE system, as Modelica tools normally do to simulate models. Succesful initialization also requires that all the start values that are computed from the initial power flow are actually used as initial guesses of the iterative solvers used in that phase.</p>
</body></html>"));
end Overview;
