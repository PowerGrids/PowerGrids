within PowerGrids.Electrical.Machines;

model AsynchronousMachine3rdOrder
extends AsynchronousMachine1stOrder;

  // Single cage model parameters
  final parameter Types.PerUnit XssPu = XmPu + XsPu "Stator leakage reactance";
  final parameter Types.PerUnit XrrPu = XmPu + XrPu "Rotor leakage reactance";
  Types.PerUnit lambdardPu(start=lambdardPuStart) "d-axis rotor flux";
  Types.PerUnit lambdarqPu(start=lambdarqPuStart) "q-axis rotor flux";
  Types.PerUnit lambdasdPu(start=lambdasdPuStart) "d-axis stator flux";
  Types.PerUnit lambdasqPu(start=lambdasqPuStart) "q-axis stator flux";

  // Start parameters
  final parameter Types.PerUnit lambdardPuStart(fixed=false) "Start d-axis rotor flux";
  final parameter Types.PerUnit lambdarqPuStart(fixed=false) "Start q-axis rotor flux";
  final parameter Types.PerUnit lambdasdPuStart(fixed=false) "Start d-axis stator flux";
  final parameter Types.PerUnit lambdasqPuStart(fixed=false) "Start q-axis stator flux";  
initial equation
  0 = (RrPu / XrrPu * XmPu) * idPu - RrPu / XrrPu * lambdardPuStart + lambdarqPuStart; // Approximated omegaSynchPu with nominal
  0 = (RrPu / XrrPu * XmPu) * iqPu - RrPu / XrrPu * lambdarqPuStart - lambdardPuStart; // Approximated omegaSynchPu with nominal
  udPuStart = RsPu * idPuStart - omegaSynchPu / omegaNomPu / 1 * lambdasqPuStart;
  uqPuStart = RsPu * iqPuStart + omegaSynchPu / omegaNomPu / 1 * lambdasdPuStart;
  
  der(lambdardPu) = 0;
  der(lambdarqPu) = 0;
equation
  der(lambdardPu) / omegaBase = (RrPu / XrrPu * XmPu) * idPu - RrPu / XrrPu * lambdardPu + (omegaSynchPu/omegaNomPu) * lambdarqPu;
  der(lambdarqPu) / omegaBase = (RrPu / XrrPu * XmPu) * iqPu - RrPu / XrrPu * lambdarqPu - (omegaSynchPu/omegaNomPu) * lambdardPu;
  udPu = RsPu * idPu - omegaSynchPu / omegaNomPu * lambdasqPu;
  uqPu = RsPu * iqPu + omegaSynchPu / omegaNomPu * lambdasdPu;
  
end AsynchronousMachine3rdOrder;
