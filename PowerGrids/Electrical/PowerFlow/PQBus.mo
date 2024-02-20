within PowerGrids.Electrical.PowerFlow;

model PQBus "PQ bus"
  extends Icons.Load(PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends BaseClasses.OnePortACPF(final portVariablesPhases = true);
  parameter Types.ActivePower P = SNom "Active power entering the bus";
  parameter Types.ReactivePower Q = 0 "Reactive power entering the bus";
equation
  port.P = P;
  port.Q = Q;
annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {60, -60}, extent = {{-20, 20}, {48, -40}}, textString = "PQ")}),
    Documentation(info = "<html>
<p>PQBus: prescribes the active power <code>P</code> and the reactive power <code>Q</code> entering the bus.</p>
</html>"));
    
end PQBus;
