within ;
package PowerGrids
  extends Modelica.Icons.Package;
  import SI = Modelica.SIunits;
  import CM = Modelica.ComplexMath;

  annotation(
    version = "1.0.3",
    conversion(noneFromVersion = "1.0.0",
               noneFromVersion = "1.0.1",
               noneFromVersion = "1.0.2"),
    uses(Modelica(version="3.2.3")),
  Documentation(info = "<html><head></head><body><p>Copyright © 2018-2020, RTE.</p><p>PowerGrids is licensed under the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, you can obtain one&nbsp;<a href=\"http://mozilla.org/MPL/2.0.\">here</a>.</p><p></p><p>-------------------------------------------------------------------------------------------------------------</p><p>
The PowerGrids library is a library for the modelling of power generation and transmission systems for electro-mechanical phenomena (\"phasor\" approximation).</p>
<p>The main goal of the library is to demonstrate how it is possible to exploit the power of the Modelica language to develop fully declarative electro-mechanical models of power generation and transmission systems that are self-documented, easy to understand, and easy to modify and improve. For physical component models, the code is as close as possible to the model description as found in textbooks and basic theory manuals, entirely leaving to the Modelica tool the task of solving the equations. For control systems, block diagrams are used, as they are immediately recognized by domain experts.</p>
<p>To achieve this goal, the following features were implemented:</p>
<ul>
<li>Base classes for one-port and two-port components to factor out common code as much as possible.</li>
<li>Use of Complex numbers for maximum readability.</li>
<li>Use of physical SI units wherever appropriate, e.g., in connectors.</li>
<li>Proper scaling of the underlying differential-algebraic equations for numerical robustness achieved by using the nominal attribute of variables, rather than implementing it explicitly in the models.</li>
<li>Use of initial equations to compute all strictly necessary start values in a declarative, easy-to-understand way, starting from power-flow analysis results.</li>
<li>Use of initial equations for steady-state initialization of models.</li>
<li>Use of homotopy to improve the convergence of initial equations where necessary.</li>
</ul>
<p>
The library was developed by <a href=\"https://www.rte-france.com/\">RTE</a> with help from <a href=\"http://www.dynamica-it.com\">Dynamica s.r.l.</a>. It is part of a larger effort to promote both the use of the Modelica language for power system modeling and the advantages of open-source approaches - for more information, go to&nbsp;<a href=\"http://www.dynawo.org\">Dynawo</a> website.</p>
<p>PowerGrids was developed and tested using OpenModelica 1.14.1, but is expected to run on all Modelica tools that fully support Complex numbers and the homotopy transformation. For numerical efficiency of models with more than a few buses, it is necessary that the tool does not transform the equations into ODE form, but rather directly uses a sparse DAE solver. The reason for this requirement is that while the DAE is sparse, the corresponding ODE is dense.</p><p>Note that most of the models and test cases run with this version of OpenModelica but some solver issues are still under consideration and should only be available from OpenModelica 1.16 - in case you want to benefit from the latest developments, we recommend you to download the nightly-build from OpenModelica.</p>
<p>For further technical information, see the <a href=\"modelica://PowerGrids.UsersGuide\">User's Guide</a>.</p>
</body></html>"));
end PowerGrids;
