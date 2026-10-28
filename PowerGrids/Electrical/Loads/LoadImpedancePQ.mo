within PowerGrids.Electrical.Loads;

model LoadImpedancePQ "Load model with prescribed impedance specified by PRef and QRef"
  extends Icons.Load(PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    PStart = PRefConst,
    QStart = QRefConst,
    final hasSubPF,
    final localInit,
    final isLinear = false,
    redeclare PowerGrids.Electrical.PowerFlow.PQBus componentPF(
      SNom = SNom,
      UNom = UNom,
      P = if breakerStatusStartPF then PRefConst else 0,
      Q = if breakerStatusStartPF then QRefConst else 0));

  import Modelica.ComplexMath;

  parameter Types.ActivePower PRefConst = 0 "Active power consumption at reference voltage, reference P for the embedded PF";
  parameter Types.ReactivePower QRefConst = 0 "Reactive power consumption at reference voltage, reference Q for the embedded PF";
  parameter Types.Voltage URef = UStart "Reference value of phase-to-phase voltage";

  Types.ActivePower PRef(nominal = SNom) = PRefConst "Active power consumption at reference voltage, the default binding can be changed when instantiating";
  Types.ActivePower QRef(nominal = SNom) = QRefConst "Reactive power consumption at reference voltage, the default binding can be changed when instantiating";
  Types.ComplexVoltage v(re(nominal = port.VNom), im(nominal = port.VNom)) = port.v "Port voltage, phase-to-ground";
  Types.ComplexCurrent i(re(nominal = port.INom), im(nominal = port.INom)) = port.i "Port current";
  final Types.ComplexAdmittance Y = ComplexMath.conj(Complex(PRef,QRef)/URef^2) "Internal impedance";

protected
  parameter Boolean breakerStatusStartPF = true "breaker initial status for the EPF (to be set by the extensions which implements breakers) - true means breaker closed";
public
equation
  i = Y*v;

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}), graphics = {Text(origin = {70, -70}, extent = {{-30, 30}, {30, -30}}, textString = "Z")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics),
    Documentation(info = "<html><head></head><body>
<p>Model of a load with an iternal impedance whose value is specified by the current values of <code>PRef</code>, <code>QRef</code>, and <code>URef</code>.</p>
<p>If the embedded PF is active, the PRefConst and QRefConst values are used as reference for the embedded PF computation, so they should be set accordingly to the initial values of PRef and QRef respectively.
</p>
<p>The default <code>URef = UStart</code> ensures that the power calculated by the Embedded Power Flow (if used) is the same of the one calculated by the dynamic initialization, starting from the one calulated by the EPF.
</p></body></html>"));
end LoadImpedancePQ;