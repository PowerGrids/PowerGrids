within PowerGrids.Electrical.BaseComponents;

partial model InfiniteBusVI "Base models for infinite buses, prescribing the node voltage (modulus and phase)"
  extends PowerGrids.Electrical.BaseClasses.OnePortACVI(final isLinear = true);
  extends Icons.Bus(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);

  Types.ComplexVoltage v(re(nominal = port.VNom), im(nominal = port.VNom)) = port.v "Port voltage, phase-to-ground";
  Types.ComplexCurrent i(re(nominal = port.INom), im(nominal = port.INom)) = port.i "Port current";
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body>Infinite bus model with prescribed voltage v (modulus and phase).
</body></html>"));

end InfiniteBusVI;
