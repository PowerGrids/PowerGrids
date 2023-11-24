within PowerGrids.Electrical.BaseClasses;

partial model TwoPortAC "Base class for two-port AC components with synchronous connection"
  extends TwoPortACBase;
equation
  // Propagation of the reference frame
  terminalAC_a.omegaRefPu = terminalAC_b.omegaRefPu;
  Connections.branch(terminalAC_a.omegaRefPu, terminalAC_b.omegaRefPu);

  annotation (
    Documentation(info = "<html><head></head><body><p>This is the base class for all the components with two AC terminals. It contains two corresponding <code>PortAC</code> components to compute useful quantities for modelling and monitoring purposes.</p>
    </body></html>"));
end TwoPortAC;
