within PowerGrids.UsersGuide;

package NamingConventions
  extends Modelica.Icons.Information;
annotation(
    preferredView = "info",
    Documentation(info = "<html>
<p>This section contains the naming and style guidelines for the PowerGrids library development. If you want to contribute to the library, please make sure you follow them strictly, to ensure a consistent style throughout the whole library.</p>

<p>When writing a Modelica model, please respect the general <a href=\"modelica://Modelica.UsersGuide.Conventions\" >Modelica conventions</a> and follow the recommendations below.</p>

<p>Please always use the English language for the code and comments.</p>

<h2>Electrical conventions</h2>

<p>For currents and powers, the <strong>receptor convention</strong> is normally followed, i.e. the value is positive when entering the device. Variables following the opposite generator conventions are available on the component ports; they are marked explicitly with <code>Gen</code> in their name.</p>

<h2>Naming conventions</h2>

<h3>Generalities</h3>

<p>Use package namespaces as much as possible to avoid naming conflicts. Do not duplicate parent namespaces in the children model names.</p>

<p>Please follow the <a href=\"modelica://Modelica.UsersGuide.Conventions.ModelicaCode.Naming\">Modelica naming conventions</a>.</p>

<ul>
<li>
<strong>Package/Class/Model</strong> : start with upper case letter and use camel-case convention, e.g \"ElectricCurrent\" </li>
<li>
<strong>Parameters/Constants</strong>: start with an upper case letter</li>
<li>
<strong>Variables/Connectors/Component</strong> instance : start with lower case letter and use camel-case convention</li>
<li>
<strong>Functions</strong>: start with lower case letter</li>
</ul>

<p>In addition to this, please follow the additional naming conventions bellow:</p>

<ul dir=\"auto\">
<li>
<strong>Start</strong> parameters/variables: end with <code>Start</code></li>
<li>
<strong>Per-unit</strong> parameters/variables: end with <code>Pu</code></li>
<li>
<strong>Min/Max</strong> parameters/variables: end with <code>Min/Max</code></li>
</ul>

<h3>
Exceptions for physical variables</h3>

<p>There are some exceptions for the physical variables. Please refer to the list below:</p>

<ul>
<li>
<strong>Frequencies</strong> should be named f. A parameter related to a frequency should start with a lower case letter, e.g fACNetwork.</li>
<li>
<strong>Currents</strong> should be named <code>i</code> (for complex variable) or <code>I</code> (for absolute value)</li>
<li>
<strong>Voltages (phase-to-phase)</strong> should be named <code>u</code> (for complex variable) or <code>U</code> (for absolute value)</li>
<li>
<strong>Voltages (phase-to-ground)</strong> should be named <code>v</code> (for complex variable) or <code>V</code> (for absolute value)</li>
<li>
<strong>Apparent power</strong> should be named s (for complex variable) or S (for absolute value)</li>
<li>
<strong>Active power</strong> should be named P, <strong>reactive power</strong> should be named Q</li>
<li>
<strong>Impedance</strong> should be named <code>Z</code>, <strong>resistance</strong> should be named <code>R</code>, <strong>reactance</strong> should be named <code>X</code>, 
</li><strong>Admittance</strong> should be named <code>Y</code>, <strong>conductance</strong> should be named <code>G</code>, <strong>susceptance</strong> should be named <code>B</code></li>
<li>
<strong>Angles</strong> should be named according to their name in textbooks (ex: theta)</li>
<li>
<strong>Time</strong> should be named t (T is used for the temperature).
 A parameter related to a time should start with a lower case letter, 
e.g tInteger, t0...</li>
</ul>

<h3>Types conventions</h3>

<p dir=\"auto\">Preferably use the types defined in the <a href=\"modelica://PowerGrids.Types\">PowerGrids.Types</a> package, or possibly locally redefined types with ad-hoc nominal attributes. For other units, please use <a href=\"modelica://Modelica.SIunits\">Modelica.SIunits</a> types. Use the appropriate unit for <code>PerUnit</code> variables. Avoid using plain <code>Real</code> variables that lack dimensional information and prevent automatic dimension checking on physical equations.</p>

<h2>Model structure conventions</h2>

<h3>Generalities</h3>

<p>Respect the following order while writing or updating a model:</p>

<ul>
<li>Modelica library imports (alphabetical order)</li>
<li>other libraries imports (alphabetical order)</li>
<li>internal PowerGrids imports (alphabetical order)</li>
<li>extends statements</li>
<li>public items: parameters, connectors (group them based on functional aspects)</li>
<li>protected items: parameters, variables, blocks (group them based on functional aspects)</li>
<li>initial equations</li>
<li>equations</li>
</ul>

<h2>Comments conventions</h2>

<p>Comments should start with a capital letter.</p>

<ul>
<li>Always comment <strong>all</strong> models, function, parameters and variables, using the Modelica <code>\"comments\"</code>, explaining concisely but clearly what is their meaning/use. These comments are meant for the library users and automatically show up at various places in the graphical user interface (e.g. in the variables browser to inspect simulation results).</li>
<li>Use <code>//</code> comments for equations and implementation description (base transformation, model conventions). These comments meant for library developers.</li>
</ul>

<h2>Model implementation</h2>

<ul>
<li>Use complex numbers (and native associated functions) whenever possible</li>
<li>Only use per-unit for models which are natively described in per-unit variables, otherwise use SI physical quantities.</li>
<li>Never introduce explicit scaling factors in physical models, rely on the <code>nominal</code> attribute of variables and on the automatic scaling performed by the Modelica tool instead</li>
<li>Use discrete Real for non-continuous variables</li>
<li>Use inner/outer variables for shared general variables</li>
<li>Use input/output keywords or conectors for the inputs/ouputs seen from the model (at least for control models)</li>
<li>Component state

<ul>
<li>
<strong>running</strong> describes a state when something is flowing through the device</li>
<li>
<strong>on</strong> describes a state when the device is turned on (but no flow may be flowing through)</li>
<li>
<strong>off</strong> describes a state when the device is shut down (no flow is expected)</li>
</ul>
</li>
</ul>
</html>"));
end NamingConventions;
