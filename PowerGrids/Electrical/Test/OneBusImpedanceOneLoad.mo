within PowerGrids.Electrical.Test;

model OneBusImpedanceOneLoad
  extends OneBusOneLoad(infiniteBus.R = 0.3, infiniteBus.X = 1.5, infiniteBus.portVariablesPhases = true, infiniteBus.portVariablesPu = true, infiniteBus.generatorConvention = true);
  annotation(
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html>
<p>This model is similar to <a href=\"modelica://PowerGrids.Electrical.Test.OneBusOneLoad\">OneBusOneLoad</a>, save for the internal impedance of the bus, which is set to R = 0.3 Ohm and X = 1.5 Ohm.</p>
<p>As a consequence, the voltage at the port is reduced to 0.956 p.u., due to the internal ohmic losses of the bus, and the voltage and current of the load have a phase of about 21 deg instead of 30 deg due to the internal reactive load of the bus.</p>
</html>"));
end OneBusImpedanceOneLoad;
