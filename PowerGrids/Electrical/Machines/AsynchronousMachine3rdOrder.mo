within PowerGrids.Electrical.Machines;

model AsynchronousMachine3rdOrder
  extends AsynchronousMachineBase;
initial equation
  der(uqpPu) = 0;
  der(udpPu) = 0;
equation
  der(udpPu) = -RrPu / LrrPu * (udpPu + 1 * LmPu^2/LrrPu*iqPu) + slip * uqpPu;
  der(uqpPu) = -RrPu / LrrPu * (uqpPu - 1 * LmPu^2/LrrPu*idPu) - slip * udpPu;
end AsynchronousMachine3rdOrder;
