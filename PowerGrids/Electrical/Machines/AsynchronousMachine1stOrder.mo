within PowerGrids.Electrical.Machines;

model AsynchronousMachine1stOrder
  extends AsynchronousMachineBase;
equation
  0 = -RrPu / LrrPu * (udpPu + omegaRefPu * LmPu^2/LrrPu*iqPu) + slip * uqpPu;
  0 = -RrPu / LrrPu * (uqpPu - omegaRefPu * LmPu^2/LrrPu*idPu) - slip * udpPu;
end AsynchronousMachine1stOrder;
