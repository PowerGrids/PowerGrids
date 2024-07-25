within PowerGrids.UsersGuide.Tutorial;

package UsingPowerGrids
  extends Modelica.Icons.Information;
annotation(preferredView = "info",
    Documentation(info = "<html><head></head><body>
<h2>1. What can you model with PowerGrids</h2>
<p>The PowerGrids library allows to build electro-mechanical models of balanced, three-phase AC power systems. Three-phase AC balanced systems are described by complex phasors, representing the magnitude and phase of voltages and currents with respect to a reference rotating frame. The frequency of the reference frame is automatically generated by components such as infinte buses or large synchronous generators and automatically propagated to components of synchronously connected sub-systems.</p>
<p>The library was mainly conceived for the modelling of generation and transmission systems, but it can as well be used to model distribution systems.</p>

<h2>2. Building and simulating a system model</h2>

<p>The PowerGrid library can be used with any simulation tool that follows the Modelica language standard. Tool support and tool-specific settings are discussed in the <a href=\"modelica://PowerGrids.UsersGuide.ToolSupport\">ToolSupport</a> section of this Tutorial.</p>

<h3>2.1 Drag, drop and connect</h3>

<p>After creating a new empty Modelica model, you should first drag and drop the System component from the Electrical package; this provides system-wide settings, such as the reference system frequency (50 or 60 Hz), the type of initialization, the minimum and maximum limits for currents and voltage, and various visualization options. Meaningful default values are provided for all parameters and options.</p>

<p>You can then add physical components taken from the various sub-packages of Electrical: Branches, Buses, Faults, Loads, Banks, and Machines. It is recommended that you connect different components through Bus components, which provide proper initialization support, as well as clear visualization of node voltages in the grid.</p>

<p>The Electrical.Controls sub-package contains some examples of control systems (governors, PSS, etc.) taken from IEEE standards. You can build your own control system models as block diagrams by using blocks from the <a href=\"modelica://PowerGrids.Controls\">PowerGrids.Controls</a> package and from the <a href=\"modelica://Modelica.Blocks\">Modelica.Blocks</a> package.</p>

<h3>2.2 Set component parameters</h3>

<p>You can then provide parameter values for each component by double-clicking on them and using the parameter input window. Most parameter have default values (possibly depending on other parameter values) to avoid the need of setting each and every value all the time. </p>

<p>The <i>Visualization</i> and <i>Solution checking</i> tabs can be used to set parameters relative to the visualization of the results in the diagram and to the checking of min and max variable limits in the simulation. All the parameters in these two tabs take their default value from the system object, so if the same setting is required for the entire system, simply set the corresponding parameter in the system object. However, it is possible to locally override the system default of specific components by setting their parameter values in these two tabs.</p>

<p>The parameters in the initialization tab only need to be set if the embedded power flow computation is disabled in the systm object, otherwise they are set automatically and the parameter input fields are disabled.</p>

<h3>2.3 Initialization</h3>

<p>The dynamic system models are always initialized in steady state. This requires to solve large non-linear systems, using iterative Newton-Raphson solvers, whose nonlinear unknowns must be given a good enough initial guess to ensure solver convergence. To this purpose, all components with nonlinear equations have parameter to set start values (i.e. initial guesses) for the active and reactive power flows into their ports, while bus components provide start values for initial gusse of voltages. Initial guesses for the remaining nonlinear variables in componen models are automatically computed from the port values by means of initial equations in the components themselves.</p>

<p>By default, the <i>embedded power flow</i> option is activated in the system object. This option enables embedded static power flow models for each component, e.g. a PV bus for a synchronous machine or a PQ bus for a load, which form an embedded power flow problem. This is automatically solved as a first step of the initialization, providing appropriate initial guesses to the port quantities and hence to all nonlinear unknowns in the model.</p>

<p>So, if default system object settings are kept, it is only necessay to provide values to the parameters that determine the power flows into components with nonlinear equations, e.g., PRefConst and QRefConst in load models, or PPF and QPF in synchronous machine models; everything else necessary for steady-state initialization of the dynamic system model will be computed automatically.</p>

<h3>2.4. Running a simulation</h3>

<p>Simulation parameters such as start and stop time, number of intervals in the result and solver tolerance must be set. Additional settings may be required, please consult the <a href=\"modelica://PowerGrids.UsersGuide.ToolSupport\">Tool Support</a> section of this guide for more information. </p>

<h3>2.5 Analyzing results </h3>

<p>Once the simulation is over, it is possible to plot variable trends over time, selecting the variables of interest in the variable browser of the Modelica tool. It is also possible to visualize the main operating parameters (bus voltage magnitude and phase on buses, active and reactive power flows entering the connectors in all other component) on the system diagram, using the visualization controls to move forward and backward in time.</p>

<h2>3. Advanced Use</h2>
<p>In the previous sections, out-of-the-box use of the library was presented. This is useful for beginners or, e.g., for classroom use when teaching basic power systems courses. However, the library can be used in many different ways, regarding several aspects, which are briefly summarized here.
</p><ul>
<li>Build your own customized components: this can be done easily, by exploiting ready-made base classes that provide all the basic modelling and initialization infrastructure, to which you only need to add the specific model equations.</li>
<li>Using externally provided initial power flow: you can disable the embedded power flow  computationin the system object and directly provide as parameters the values of the voltage magnitude and phase for bus components and the active and reactive flow into component ports, for all nonlinear components. These values can be obtained from external power flow and optimization tools.</li>
<li>Use within other tool chains: the Modelica model is actually a UTF-8 text file, so it can be automatically produced, e.g., starting from netlists or databases. If you are using OpenModelica, APIs to interact with the compiler are available for Python, Julia, and Matlab.</li>
</ul>
For more details about these features, please consult the <a href=\"modelica://PowerGrids.UsersGuide.Tutorial.LibraryArchitecture\">LibraryArchitecture</a> section, which provides in-depth discussion of the library architecture and about all possible ways to use it.<p></p>

</body></html>"));
end UsingPowerGrids;
