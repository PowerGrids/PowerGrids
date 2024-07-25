within PowerGrids.Electrical.Loads;

model LoadImpedancePQ "Load model with impedance specified by PRef and QRef"   
  extends Icons.Load(PIcon = port.P, QIcon = port.Q, PPuIcon = port.PPu, QPuIcon = port.QPu);
  extends Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    PStart = PRefConst,
    QStart = QRefConst,
    final hasSubPF,
    final localInit,
    redeclare PowerGrids.Electrical.PowerFlow.PQBus componentPF(
      SNom = SNom,
      UNom = UNom,
      P = PRefConst, 
      Q = QRefConst));
    
  import Modelica.ComplexMath;
  
  parameter Types.ActivePower PRefConst = 0 "Active power consumption at reference voltage, reference P for the embedded PF";
  parameter Types.ReactivePower QRefConst = 0 "Reactive power consumption at reference voltage, reference Q for the embedded PF";
  parameter Types.Voltage URef = UNom "Reference value of phase-to-phase voltage";
  
  Types.ActivePower PRef(nominal = SNom) = PRefConst "Active power consumption at reference voltage, the default binding can be changed when instantiating";
  Types.ActivePower QRef(nominal = SNom) = QRefConst "Reactive power consumption at reference voltage, the default binding can be changed when instantiating";
  Types.ComplexVoltage v(re(nominal = port.VNom), im(nominal = port.VNom)) = port.v "Port voltage, phase-to-ground";
  Types.ComplexCurrent i(re(nominal = port.INom), im(nominal = port.INom)) = port.i "Port current";
  final Types.ComplexImpedance Z = 1/ComplexMath.conj(Complex(PRef,QRef)/URef^2) "Internal impedance";

equation
  v = Z*i;    

  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Documentation(info = "<html><head></head><body>
<p>Model of a fixed impedance load, whose value is specified by the reference values <code>PRef</code>, <code>QRef</code>, and <code>URef</code>.</p>
<p>If the embedded PF is active, the PRefConst and QRefConst values are used as reference for the embedded PF computation, so they should be set accordingly to the initial values of PRef and QRef respectively.
</body></html>"));
end LoadImpedancePQ;
