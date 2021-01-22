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
  0 = (RrPu / XrrPu * XmPu) * idPuStart - RrPu / XrrPu * lambdardPuStart + lambdarqPuStart; // Approximated omegaRefPu with nominal
  0 = (RrPu / XrrPu * XmPu) * iqPuStart - RrPu / XrrPu * lambdarqPuStart - lambdardPuStart; // Approximated omegaRefPu with nominal
  udPuStart = RsPu * idPuStart - omegaRefPu / omegaNomPu / 1 * lambdasqPuStart;
  uqPuStart = RsPu * iqPuStart + omegaRefPu / omegaNomPu / 1 * lambdasdPuStart;
  
  der(lambdardPu) = 0;
  der(lambdarqPu) = 0;
equation
  der(lambdardPu) / omegaBase = (RrPu / XrrPu * XmPu) * idPu - RrPu / XrrPu * lambdardPu + (omegaRefPu/omegaNomPu) * lambdarqPu;
  der(lambdarqPu) / omegaBase = (RrPu / XrrPu * XmPu) * iqPu - RrPu / XrrPu * lambdarqPu - (omegaRefPu/omegaNomPu) * lambdardPu;
  udPu = RsPu * idPu - omegaRefPu / omegaNomPu * lambdasqPu;
  uqPu = RsPu * iqPu + omegaRefPu / omegaNomPu * lambdasdPu;
  
end AsynchronousMachine3rdOrder;
