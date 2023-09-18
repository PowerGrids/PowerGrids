within PowerGrids.Electrical.PowerFlow;

model SlackBus "Slack Bus"
  extends BaseClasses.OnePortACBus(
    final UStart = U, 
    final UPhaseStart = theta,
    final PStart = 0,
    final QStart = 0);  
  extends Icons.Bus;
  parameter Types.Voltage U = UNom "Voltage magnitude, phase-to-phase";
  parameter Types.Angle theta = 0 "Phase of voltage phasor";
equation
  port.u = CM.fromPolar(U, theta) "Voltage of ideal generator, phase-to-ground";
  
  // Overconstrained connector
  Connections.potentialRoot(terminalAC.omegaRefPu);
  if Connections.isRoot(terminalAC.omegaRefPu) then
     terminalAC.omegaRefPu =  1;
  end if;
    
annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {126, 12}, extent = {{-26, 20}, {34, -40}}, textString = "S")}),
    Documentation(info = "<html>
<p>Slack bus: prescribes voltage magnitude and phase (default zero).</p>
<p>Exactly one slack bus is required in each interconnected AC system. If the system is isolated, the active and reactive power flows <code>port.P</code> and <code>port.Q</code> should be small, ideally zero; they are not if the system is not balanced in terms of active and reactive power production and consumption.</p>
</html>"));
    
end SlackBus;
