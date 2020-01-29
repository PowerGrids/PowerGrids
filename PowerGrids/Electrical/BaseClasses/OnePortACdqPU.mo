within PowerGrids.Electrical.BaseClasses;

partial model OnePortACdqPU "Base class for one-port AC components with p.u. Park's transformation"
  extends OnePortAC(
    final portVariablesPu = true);

  parameter SI.Angle thetaStart = UPhaseStart "Start value of rotation between machine rotor frame and port phasor frame";
  final parameter Types.PerUnit udPuStart(fixed = false) "Start value of udPu";
  final parameter Types.PerUnit uqPuStart(fixed = false) "Start value of uqPu";
  final parameter Types.PerUnit idPuStart(fixed = false) "Start value of idPu";
  final parameter Types.PerUnit iqPuStart(fixed = false) "Start value of iqPu";

  // d-q axis p.u. variables
  Types.PerUnit udPu(start = udPuStart) "Voltage of direct axis in p.u.";
  Types.PerUnit uqPu(start = uqPuStart) "Voltage of quadrature axis in p.u.";
  Types.PerUnit idPu(start = idPuStart) "Current of direct axis in p.u.";
  Types.PerUnit iqPu(start = iqPuStart) "Current of quadrature axis in p.u.";
  
  // other variables
  Types.Angle theta(start = thetaStart) "Rotation between machine rotor frame and port phasor frame";
  
initial equation
  // Park's transformations for start values
  port.vStart.re/port.VBase =  sin(thetaStart)*udPuStart + cos(thetaStart)*uqPuStart;
  port.vStart.im/port.VBase = -cos(thetaStart)*udPuStart + sin(thetaStart)*uqPuStart;
  port.iStart.re/port.IBase =  sin(thetaStart)*idPuStart + cos(thetaStart)*iqPuStart;
  port.iStart.im/port.IBase = -cos(thetaStart)*idPuStart + sin(thetaStart)*iqPuStart;

equation
  // Park's transformations
  port.vPu.re =  sin(theta)*udPu + cos(theta)*uqPu;
  port.vPu.im = -cos(theta)*udPu + sin(theta)*uqPu;
  port.iPu.re =  sin(theta)*idPu + cos(theta)*iqPu;
  port.iPu.im = -cos(theta)*idPu + sin(theta)*iqPu;
annotation(
    Documentation(info = "<html>
This model provides a base class for all one-port AC components that use Park's transformation with per-unit currents and voltages.
</html>"));end OnePortACdqPU;
