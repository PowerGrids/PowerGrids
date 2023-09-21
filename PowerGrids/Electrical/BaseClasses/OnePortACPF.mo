within PowerGrids.Electrical.BaseClasses;

model OnePortACPF
  extends OnePortACVI(
    redeclare PowerGrids.Interfaces.TerminalACPF terminalAC(
      v(re(start = port.vStart.re), im(start = port.vStart.im)),
      i(re(start = port.iStart.re), im(start = port.iStart.im))),
    port(final v = terminalAC.v, final i = terminalAC.i,
         final UNom = UNom, final SNom = SNom,
         final portVariablesPhases = portVariablesPhases,
         final generatorConvention = generatorConvention,
         final UStart = UNom,
         final UPhaseStart = 0,
         final PStart = SNom,
         final QStart = 0),
    final computePF = false);
  annotation(
    Documentation(info = "<html>
<p>This is the base class for all the PF components with an AC terminal.</p>
</html>"));    
end OnePortACPF;
