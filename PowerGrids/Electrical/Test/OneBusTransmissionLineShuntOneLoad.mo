within PowerGrids.Electrical.Test;

model OneBusTransmissionLineShuntOneLoad
  extends OneBusTransmissionLineOneLoad(transmissionLine.B = 0.02, transmissionLine.G = 0.01, transmissionLine.portVariablesPu = true);
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    experiment(StopTime = 1, Interval = 0.02),
    Documentation(info = "<html><head></head><body><p>This model is similar to<a href=\"modelica://PowerGrids.Electrical.Test.OneBusTransmissionLineOneLoad\">OneBusTransmissionLineOneLoad</a>, but also has nonzero shunt admittance.
</body></html>"));
end OneBusTransmissionLineShuntOneLoad;
