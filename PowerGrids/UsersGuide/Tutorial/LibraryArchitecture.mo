within PowerGrids.UsersGuide.Tutorial;

package LibraryArchitecture
  extends Modelica.Icons.Information;
annotation(preferredView = "info",
    Documentation(info = "<html><head></head><body>
<h2>Scope of the Library</h2>
<p>The PowerGrids library allows to build electro-mechanical models of balanced, three-phase AC power systems. DC links can be added, described by components of the <a href=\"modelica://Modelica.Electrical.Analog\"> Modelica.Electrical.Analog</a> library. Three-phase AC balanced systems are described by complex phasors. In the current version of the library, the reference frame of the phasors can be either a fixed-speed frame, rotating at the nominal system frequency, or the rotor frame of one selected reference synchronous generator. The library design can be extended to accommodate dynamically splitting an joining synchronous islands.</p>

<h2>Library Design Principles</h2>
The PowerGrids library is designed around two fundamental principles.<p></p>
<p>The first one is model-solver separation, also known as declarative modelling style. Component models are described in a way that is as close as possible to their original formulation, as found in textbooks, research papers, or standards, not to the way they will actually be solved at runtime. The most natural formalism is used to describe each model: differential-algebraic equations for synchronous machines, complex phasors for transmission lines and transformers, block diagrams for control systems. The transformation to efficient and numerically robust simulation code is then automatically provided by the tools that compile the original Modelica model into executable code, possibly based on additional declarative information.</p>
<p>One notable case of application of this principle is in the choice of units for the component models. In some cases, e.g. synchronous machine models, per-unit variables are used in textbooks, because they lead to a more compact and readable description of the machine behaviour, if convenient machine-specific base quantities are used. However, the use of per-unit variables at the system level, with some arbitrarily chose base quantities (e.g. 100 MW for power) makes the models hard to understand and potentially error-prone, because of the co-existence of multiple per-unit base quantities across the system model. A better choice in this case is to use SI units consistently across all models, and use the <code>nominal</code> attribute of Modelica variables to provide scaling information, that the tool will automatically and transparently apply when generating the code. </p>
<p>Another application of the declarative modelling principle involves the initialization of the models. One common practice in the field of power systems modelling and simulation is to provide two separate models for each component, one for simulation and one for initialization. In fact, the underlying equations are the same, what is different in those two cases are the choices of input variables, which result into different solution procedures. Writing these pairs of models is inconvenient and potentially prone to inconsistency. In the PowerGrids library, Modelica initial equations are extensively used in order to avoid this unnecessary code duplication and extra work, relying on the simulation tools to solve the equations according to the different causality of the simulation and initialization cases.</p>
<p>Last, but not least, the models in the PowerGrids library are ultimately equivalent to differential-algebraic equations, so they can be coupled to any present or future numerical solver that can handle them, without the need of changing one line of code. This allows to preserve the investment in modelling knowledge, while making it possible to take advantage of future progress in the field of numerical solvers.</p>

<p>The other principle regards the use of advanced Modelica features, such as inheritance. In the PowerGrids library, such advanced features have been used in order to set up a basic modelling framework for individual components, which takes care of potentially critical aspects such as scaling and initialization. This framework, that will be described later in this tutorial, allows experts in power system modelling to write their own models by focusing on the core consitutive equations, without worrying about the more low-level issues which are handled by the basic framework. In this way, ease of development, clarity and maintainability of the code is maximised. Replaceable classes have not been employed, because they introduce a level of abstraction that allows to develop very elegant and compact code, which however requires a fairly steep learning curve.</p>

<h2>Basic Modelling Framework</h2>

<h3>Types for Physical Quantities</h3>
<p>The <a href=\"modelica://PowerGrids.Types\">PowerGrids.Types</a> package defines the types for all physical variables, which use SI units, and for non-dimensional per-unit variables. Physical types include a default <code>nominal</code> attribute for proper scaling of variable in the generated simulation code, and default <code>displayUnit</code> attributes, which allow GUIs to provide parameter input and to display simulation results using more convenient units such as kV or MW. Note that the numerical values in the Modelica source code are always in SI units for consistency.
</p><h3>Name conventions</h3><div>The following conventions are used for the names of the parameters that define nominal/reference Voltages and/or Powers:</div><ul dir=\"auto\"><li><b>xxNom:</b> these parameters&nbsp;are always present in the input mask, possibly with some 
default value (see below the PQ load case). They are used to set the Nominal/rated xx values and as p.u. base. They are also used in the library as&nbsp;<code>nominal</code>&nbsp;attribute for proper scaling of variable in the generated simulation code.<br><u>Exception to this rule:</u> SNom for the Bus component is declared as 
final SNom = 1, so it is removed from the input mask, since SPu = 0 all 
the time (no power flow through the port). As a consequence port.P, 
port.Q, port.PPu, port.QPu etc. will all be zero, as they should, with 
no divisions by zero.</li>
<li><b>xxRef: </b>these&nbsp;parameters are used to define the behaviour of a components by
 specifying a reference operating point. In this case, the default value
 for <b>xxNom</b> is defined in terms of <b>xxRef</b> to avoid double input if one 
wants to see 1 p.u. at the reference operating point, this can be 
changed by explicitly inputting some different value for <b>xxNom</b>.</li>
</ul><p>Some example are listed below,</p><p><!--StartFragment--><!--EndFragment--></p><ol dir=\"auto\">
<li><b>Machines (Synchronous and transformer):</b> The user will be asked for 
xxNom in the input mask, intended as the nominal, or rated values of the
 machine, <em>but also</em> as the values from which p.u. impedances are
 computed from the corresponding ohm values, as made it clear from the 
comment to the parameter. No need of xxRef. For transformer we will have
 one UNom per winding. xxNom will also be used for scaling, but we don't
 mention that in the parameter input mask.</li>
<li><b>Lines:</b> same as machines, will be asked for xxNom in the input mask, intended as the nominal, or rated values of the line, <em>but also</em>
 as the ones from which p.u. impedances are computed from the 
corresponding ohm values. xxNom values are asked only once and used for 
both ports, contrary to transformers that have one SNom but two separate
 UNomA and UNomB. We can give a default value for SNom = UNom^2/CM.abs(Complex(R,X)), 
which is probably good enough in most cases, but can always be changed.</li>
<li><b>Constant impedance loads described through P and Q:</b> the user will be
 asked in the components' mask for PRefConst, QRefConst and URef 
(intended as the value at which, from the inputed P and Q, the internal 
impedances are computed). Regarding UNom and SNom, they will also appear
 in the input mask, but they will have the defaults UNom = URef and SNom
 = sqrt(PRefConst^2+ QRefConst^2) already set. One could always change 
them if you want to see a value of p.u. different from 1 at the 
reference operating point, which can be different from the nominal one 
(e.g. you are working at 50% load, so you want to see 0.5 p.u.)</li>
</ol>

<h3>Connectors</h3>
<p>AC connections are made through the <a href=\"modelica://PowerGrids.Interfaces.TerminalAC\">PowerGrids.Interfaces.TerminalAC</a> connectors, which carry a phase-to-ground voltage phasor and a line current phasor. Any two connectors belonging to the same synchronous system can be connected.</p>

<h3>AC Ports</h3>
<p>The <a href=\"modelica://PowerGrids.Electrical.BaseClasses.PortAC\">PowerGrids.Electrical.BaseClasses.PortAC</a> model is the fundamental component to interface AC models with the outside world via a three-phase balanced AC system. The <code>PortAC</code> model contains all the useful representations of the quantites found at a component port, as well as the equations relating them: phase-to-phase and phase-to-ground voltage in Cartesian and polar coordinates, line currents in Cartesian and polar coordinates, active and reactive power flows, both in SI units and per-unit, referred to local base power SBase and voltage UBase. Each of these quantities can be used to formulate the equations of the component, without the need of re-defining them each and every time.</p>
<p>Since the port variables are often the unknowns of the initialization problem, their start attributes must be set to provide appropriate initial guess values for iterative implicit equation solvers. The <code>PortAC</code> model takes care of this, provided that its parameters <code>PStart</code>, <code>QStart</code>, <code>UStart</code>, and <code>UPhaseStart</code> are correctly set to the values provided by the initial power flow calculation.</p>

<h3>Base classes for components with one and two AC ports</h3>
<p>The <a href=\"modelica://PowerGrids.Electrical.BaseClasses.OnePortAC\">PowerGrids.Electrical.BaseClasses.OnePortAC</a> model provides the basic framework for components with one AC port and an implicit ground connection: one AC connector, one AC port model, and several parameters to declare the rated quantities and the guess values from the power flow. These parameters are then propagated to the the AC port model. Any one-port model (e.g. a load or a generator) can be developed by extending the <code>OnePortAC</code> model and by directly using the port variables with the dot notation (e.g. <code>port.P</code> for the active power entering the component from the port).</p><p>The&nbsp;<a href=\"modelica://PowerGrids.Electrical.BaseClasses.OnePortACdqPU\">PowerGrids.Electrical.BaseClasses.OnePortACdqPU</a>&nbsp;base class extends One<code>PortAC</code>&nbsp;by adding a rotating reference frame with Park's transformation, and by defining per-unit direct and quadrature axis quantities; this model can be used as a base class to write all rotating machine models defined on per-unit Park's transformed variables.</p>
<p>The <a href=\"modelica://PowerGrids.Electrical.BaseClasses.TwoPortAC\">PowerGrids.Electrical.BaseClasses.TwoPortAC</a> base class provides a similar framework for two-port components such as transmission lines or transformers.</p>
<p>The <a href=\"modelica://PowerGrids.Electrical.Branches.BaseClasses.PiNetwork\">PowerGrids.Electrical.Branches.BaseClasses.PiNetwork</a> model extends <code>TwoPortAC</code> and provides the equations for a generic pi-circuit with a series admittance, two shunt admittances, and an ideal transformer. This class can be then easily specialized by extending it and specifying the values of the admittances and transformer ratios, that can be constant values (e.g. a transformer ratio of 1 for transmission lines), user-defined parameters, or time-varying quantities, see all the components in the  <a href=\"modelica://PowerGrids.Electrical.Branches\">PowerGrids.Electrical.Branches</a> package.</p>

<h3>Basic control blocks</h3>
<p>Controllers such as turbine governors, automatic voltage controllers and power system stabilizers are usually specified in terms of block diagrams, e.g. in the well-known IEEE 421.5 standard. The basic building blocks are provided in package <a href=\"modelica://PowerGrids.Controls\">PowerGrids.Control</a>; as their implementation

</p><h2>Initialization</h2>
<p>Dynamic system models built with the <code>PowerGrids</code> library must be initialized in steady-state. Doing so requires in general the solution of implicit nonlinear systems of equations, using iterative Newton-type solvers.  The analysis reported in <a href=\"https://arxiv.org/abs/1911.12433\">Casella, Bachmann 2019</a>, in particular Criterion 1, reveals that in order to obtain a quick convergence of Newton's algorithm to the desired solution, only the variables influencing the system Jacobian, i.e., the variables appearing in a nonlinear fashion in at least one equation of the system, must be given a good initial guess. </p>
<p>The library was thus designed to compute all the required initial guesses by means of suitable initial equations, which require the knowledge of the results of a power flow computation, i.e., the active and reactive power flows, as well as the voltage magnitude and phase, at each component port in the system. For small systems, this power flow can be computed by building the corresponding power flow model using components from the <a href=\"modelica://PowerGrids.Electrical.PowerFlow\">PowerGrids.Electrical.PowerFlow</a> and by simulating it with the Modelica tool. For larger systems, and/or systems including complex wide-area controllers, the results obtained by any external power flow computation code can be used.</p>

<p>Please note that, according to the previously mentioned convergence criterion, providing correct start values at the ports <i>is only required for those components that contain nonlinear equations</i>, e.g., synchronous machines or PQ loads. Components containing only linear equations, such as buses, transmission lines, transformers (without saturations), capacitor banks, do not require accurate initial values to achieve convergence of the steady-state initialization problem. Hence, particularly if you build the system model manually through a GUI, you can safely keep their default values and not bother to provide them the results of the power flow computation.</p>

The library was designed to initialize the system model according to three different problem set-ups, which can be selected by a parameter in the <code>System</code> object of the model and are discussed in the following sub-sections. The correct initial equations are triggered within each component based on the parameter choice made in the <code>System</code> object.

<h3>Global steady-state, fixed set points</h3>
<p>In this case a global steady-state problem is solved, assuming the set points of governors and AVRs to be known, or possibly assuming that the excitation voltage and active power signal are directly provided to the synchronous machine model. The system is initialized at the nominal frequency of 50 Hz (or 60 Hz if so selected in the <code>System</code> object preferences). The reference bus of the model plays the role of slack node, prescribing the initial voltage and providing the required (hopefully small) active and reactive power supply to balance the system.</p>

<h3>Global steady-state, fixed power flows</h3>
<p>In this case, the guess values at the ports coming from the power flow are tentatively prescribed, causing the Modelica tool to back-compute the offsets for the governor and AVR setpoints, which are provided by suitable <a href=\"modelica://PowerGrids.Controls.FreeOffset\">FreeOffset</a> blocks activated by this initialization option. In case the controllers cannot provide the required output values corresponding to the power flow, because of control action saturations, then a conventional value for the setpoint is computed, to guarantee a certain amount of oversaturation of the manipulated variable (e.g. 10%).</p>

<h3>Local steady-state, fixed power flows</h3>
<p>In the two previous cases, a global steady-state initialization problem needs to be solved, involving the generators, transformers, grid, and load simultaneously. In those cases, the port voltage and current and the connector voltage and current at each generator port are identically equal.</p>
<p>However, in case discrete controllers (e.g. tap changers) are present in the system, this problem may be hard or impossible to solve by means of general-purpose solvers as those that are employed by Modelica tools, particularly for very large systems.</p>
<p>In this case, the option discussed in this sub-section triggers a special configuration of the generator ports during the initialization phase, whereby there is no direct connection between the port variables and the connector variables; conversely, the connector (which is attached to the grid) is subject to prescribed P,Q flows based on the power flow computation results, while all four degrees of freedom at the port side towards the generator (active and reactive power, voltage magnitude and angle) are prescribed at the power flow values, see the initial equations of <a href=\"modelica://PowerGrids.Electrical.BaseClasses.OnePortAC\">OnePortAC</a> </p>
<p> The two additional initial conditions prescribed in this case are again required to compute the initial offsets of the governor and AVR setpoints. However, contrary to the previous case, the machine models are not interacting with each other through the connection to the grid, so the Modelica tool will be able to sort out the initial equations accordingly and solve the backward initialization problem for each machine separately, while the rest of the grid model is solved by prescribing the P,Q values of the power flow, which is un-problematic. This makes the solution of the initialization problem more robust, since it is split in a large number of smaller problems. Notice however that if the supplied power flow values are not exactly consistent with the steady-state behaviour of the dynamic system model, the simulation will not start in a (global) steady state, but there will be a relaxation transient at the beginning of the simulation.</p>

<h3>Use of homotopy for the initialization</h3>
<p>The physical component models are set up in order to provide a suitable initial guess (start value) for variables appearing nonlinearly in the equations - this is reasonably easy to achieve, as most useful values are already computed in the <code>port</code> model, and the few extra ones may be computed by implicit initial equations that mimick the actual equations of the component, see e.g., the initial equations in the <a href=\"modelica://PowerGrids.Electrical.Machines.SynchronousMachine4WindingsInternalParameters\">PowerGrids.Electrical.Machines.SynchronousMachine4WindingsInternalParameters</a> model.</p>
<p>On the other hand, setting up proper initial guesses for the variables appearing nonlinearly in controller models (e.g. governors, AVRs, PSSs) is highly inconvenient, because those variables are spread among the various blocks making up the controller, and it is often not exactly clear who they may be. </p>
<p>The solution in this case is the use of a homotopy transformation (see the paper by <a href=\"https://dx.doi.org/10.3384/ecp1106375\">Sielemann et al. 2011</a>), whereby a simplified version of the equations is first solved, which is then continuously morphed into the actual one. In the case of controllers, they are usually linear, except for the presence of saturations. The simplified model solved at the beginning of the homotopy tranformation ignores the saturations, making the controller models fully linear and hence avoiding the need of providing any initial guess for their unknowns, as discussed previously. It is then essential that all blocks with saturations employed in control systems have their saturations initially disabled when the homotopy transformation is performed, for the whole initialization procedure to succeed.</p>

<h3>System object</h3>
Each system model needs to add an <code>inner</code> instance of the <code>System</code> object named <code>system</code> (you can get it in any Modelica GUI by simply dragging the system object into the top-level system diagram). The system objects holds system-wide defaults, e.g., the nominal frequency or the initialization option, and provides a frequency reference to all synchronous machines. All components can access the variables and parameters of the system object via the inner/outer mechanism, without the need of explicitly establishing connections.<p></p>

<h3>Frequency reference</h3>
<p>PowerGrids uses overconstrained  connectors and the built-in static connection graph analysis of Modelica 3.4 to handle the distribution of the reference frequency information (in terms of rotational speed in PerUnit) across connected synchronous systems.</p>
</body></html>"));
end LibraryArchitecture;
