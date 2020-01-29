# PowerGrids - A Modelica library for electro-mechanical modelling of power systems

This repository contains the code for PowerGrids, a Modelica library for electro-mechanical modelling of power systems. This library was originally developed by RTE with help from Dynamica s.r.l. It is part of a larger effort to promote both the use of Modelica for power system modelling and the advantages of open-source approaches (for more detail, go to [Dyna&omega;o website](http://dynawo.org)). 

## Table of Contents
- [About PowerGrids](#about)
- [Getting started](#start)
- [Get involved](#contributions)
- [Quoting PowerGrids](#quoting)
- [License](#license)
- [Maintainers](#maintainers)
- [Links](#links)

<a name="about"></a>
## About PowerGrids 
The PowerGrids library is a library for the modelling of power generation and transmission systems for electro-mechanical phenomena ("phasor" approximation). 

The main goal of the library is to demonstrate how it is possible to exploit the power of the Modelica language to develop fully declarative electro-mechanical models of power generation and transmission systems that are self-documented, easy to understand, and easy to modify and improve. For physical component models, the code is as close as possible to the model description as found in textbooks and basic theory manuals, entirely leaving to the Modelica tool the task of solving the equations. For control systems, block diagrams are used, as they are immediately recognized by domain experts.

To achieve this goal, the following features were implemented:

* Base classes for one-port and two-port components to factor out common code as much as possible.
* Use of Complex numbers for maximum readability.
* Use of physical SI units wherever appropriate, e.g., in connectors.
* Proper scaling of the underlying differential-algebraic equations for numerical robustness achieved by using the nominal attribute of variables, rather than implementing it explicitly in the models.
* Use of initial equations to compute all strictly necessary start values in a declarative, easy-to-understand way, starting from power-flow analysis results.
* Use of initial equations for steady-state initialization of models.
* Use of homotopy to improve the convergence of initial equations where necessary.

The library is meant to be used to model small-scale systems, e.g. for teaching, as well as medium-scale systems. Small system models can be built and managed with the graphical user interface of Modelica tools, while larger models can be built automatically by suitable scripts.

PowerGrids was developed and tested using OpenModelica 1.14.1, but is expected to run on all Modelica tools that fully support Complex numbers and the homotopy transformation. For numerical efficiency of models with more than a few buses, it is necessary that the tool does not transform the equations into ODE form, but rather directly uses a sparse DAE solver. The reason for this requirement is that while the DAE is sparse, the corresponding ODE is dense.
Note that most of the models and test cases run with this version of OpenModelica but some solver issues are still under consideration and should only be available from OpenModelica 1.16 - in case you want to benefit from the latest developments, we recommend you to download the nightly-build from OpenModelica.

If you want more detail on PowerGrids, you can either go through the library documentation or have a look to the [Modelica Conference paper](https://modelica.org/events/modelica2019/proceedings/html/papers/Modelica2019paper5D3.pdf).

<a name="start"></a>
## Getting started!
To begin using the PowerGrids library, we recommend you to open it in your favorite Modelica environment and to follow the tutorial available in the UsersGuide section. The tutorial provides a large overview of the library main features while helping you to be accustomized to the library main concepts and choices.

You can also have a look to the existing models, available in the Electrical and Control directories, as well as the test cases provided with the library, available in the Examples part.

<a name="contributions"></a>
## Get involved!
PowerGrids is an open-source project and as such, questions, discussions, contributions and feedbacks are very welcome. It is also an ongoing project and we are actively working on improving it and making it better so we encourage you to regularly check the project status and progresses.

Contributions in different forms, such as the addition of a new model, the creation of a new test case or any correction on the existing code, will be greatly appreciated. The final procedure to accept a new contribution is still under discussion but in the meantime, we encourage you to submit pull request associated to an issue, explaining the reason of your development. We will go through it and use it as a basis for discussion before inserting your modifications into the library. In any case, when adding new Modelica code, please follow the coding style available in the NamingConventions file. 
<a name="quoting"></a>
## Quoting PowerGrids
If you use the PowerGrids library in your work or paper, it is not mandatory but we kindly ask you to cite the following paper in your presentations or publications: 

A. Bartolini, F. Casella, and A. Guironnet, “Towards Pan-European Power Grid Modelling in Modelica: Design Principles and a Prototype for a Reference Power System Library,” Proceedings of the 13th International Modelica Conference, Regensburg, Germany, March 4–6, 2019, Feb. 2019
<a name="license"></a>
## License
PowerGrids is licensed under the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0. You can also see the [LICENSE](LICENSE.txt) file for more information.
<a name="maintainers"></a>
## Maintainers
PowerGrids has been originally developed by RTE with the help from F. Casella (Politecnico di Milano, Dynamica s.r.l.) and A. Bartolini (Dynamica s.r.l.). It is currently maintained by the following people in RTE: 
* Adrien Guironnet, [adrien.guironnet@rte-france.com](mailto:adrien.guironnet@rte-france.com)
* Romain Losseau, [romain.losseau@rte-france.com](mailto:romain.losseau@rte-france.com)
* Marianne Saugier, [marianne.saugier@rte-france.com](mailto:marianne.saugier@rte-france.com)

In case of questions or issues, you can also send an e-mail to [rte-dynawo@rte-france.com](mailto:rte-dynawo@rte-france.com).
<a name="links"></a>
## Links
If you are interested by the use of Modelica for power system modelling and by open-source approaches, please have a look to the following projects:
* [Dyna&omega;o](http://dynawo.org), an open source hybrid C++/Modelica time-domain simulation tool for power system simulation.
* [OpenModelica](http://openmodelica.org), an open source Modelica based modelling and simulation environment.

If you want to get additional information related to [RTE](https://www.rte-france.com/) or [Dynamica s.r.l.](http://www.dynamica-it.com), please go to our websites.



