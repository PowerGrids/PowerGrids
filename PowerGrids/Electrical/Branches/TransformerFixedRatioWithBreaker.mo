within PowerGrids.Electrical.Branches;
model TransformerFixedRatioWithBreaker
  extends BaseClasses.PiNetwork;
  extends Icons.Transformer;

  encapsulated type BreakersState = enumeration(
    Bc "breaker closed",
    Bo "breaker open");
  parameter Boolean useBreaker = false "Use breaker (port b)" annotation(
    Dialog(group = "External Inputs"),
    choices(checkBox = true));
  parameter SI.PerUnit rFixed = 1 "Fixed transformer ratio VB/VA";
  parameter SI.Angle thetaFixed = 0 "Fixed phase lead of VB w.r.t. VA";
  parameter Types.Resistance R "Series resistance on B side";
  parameter Types.Reactance X "Series reactance on B side";
  parameter Types.Conductance G = 0 "Shunt conductance on B side";
  parameter Types.Susceptance B = 0
                                   "Shunt susceptance on B side";
  parameter Boolean breakerStatusStart = true "Breaker start status - true means breaker closed" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.ComplexAdmittance Yseries = Complex(1)/Complex(R, X) "Series admittance" annotation(Evaluate = true);
  final parameter Types.ComplexAdmittance Yshunt = Complex(G, B) "Shunt admittance at port B";
  final parameter Types.ComplexAdmittance YbreakerOpen = Yseries*Yshunt/(Yseries + Yshunt) "Total admittance when breaker is open (port B)" annotation(Evaluate = true);

  Types.ComplexAdmittance Y_actual "Actual series admittance";
  Types.ComplexAdmittance YA_actual "Actual shunt admittance at port A";
  Types.ComplexAdmittance YB_actual "Actual shunt admittance at port B";
  BreakersState breakerStatus(start = BreakersState.Bc) "breacker current status";

  Modelica.Blocks.Interfaces.BooleanInput breakerStatusIn if useBreaker "Breaker Status (port B) - true means breaker closed" annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

initial algorithm
  if breakerStatusStart then
    breakerStatus := BreakersState.Bc;
  else
    breakerStatus := BreakersState.Bo;
  end if;

protected
  Modelica.Blocks.Interfaces.BooleanInput breakerStatusInInternal(start = breakerStatusStart, fixed = true) "breaker Status (port B)";

algorithm
  when breakerStatus == BreakersState.Bc
       and not pre(breakerStatusInInternal) then
    breakerStatus := BreakersState.Bo "Bc to Bo";

  elsewhen breakerStatus == BreakersState.Bo
           and pre(breakerStatusInInternal) then
    breakerStatus := BreakersState.Bc "Bo to Bc";

  end when;

equation
  if breakerStatus == BreakersState.Bc then
    Y_actual = Yseries;
    YA_actual = Complex(0);
    YB_actual = Yshunt;

  else
    // Bo
    Y_actual = Complex(0);
    YA_actual = YbreakerOpen;
    YB_actual = Complex(0);
  end if;

  k = CM.fromPolar(rFixed, thetaFixed);
  Y = Y_actual;
  YA = YA_actual;
  YB = YB_actual;

  connect(breakerStatusIn, breakerStatusInInternal);
  if not useBreaker then
    breakerStatusInInternal = true "Breaker closed";
  end if;

annotation(
    Documentation(info = "<html><head></head><body><p>Transformer with fixed voltage ratio k = rFixed*exp(j*thetaFixed). The series impedance R+jX and shunt admittance G+jB are referred to the high-voltage side B.</p><p>Step-up transformers with fixed voltage ratio can be implemented by only setting <code>rFixed</code> and leaving  <code>thetaFixed</code> to zero default value. Phase shifters can be implemented by only setting  <code>thetaFixed</code> and leaving  <code>rFixed</code> to the default of 1.</p>
<p>Implemented as a child class of <a href=\"modelica://PowerGrids.Electrical.Branches.BaseClasses.PiNetwork\">PiNetwork</a>, where Ya=0 Yb=G+jB and k = rFixed*exp(j*thetaFixed), see the corresponding documentation.</p><p>One breaker is provided at port b side. The breaker has a conditional boolean input to set the logical status:<br></p><ul><li>true &nbsp;= breaker closed</li><li>false = breaker open&nbsp;</li></ul><div>When the breaker is open the current entering from the port b is forced to 0 (by setting to 0 both the actual values of the series impedance and of the shunt impedance of port b), and the total impedance seen to the side a (high-level voltage side) becomes equal to the line impedance + the shunt impedance.</div><div><br></div><div>The actual values of the series impedance and of both the shunt impedances are managed by a state-machine, which monitors the state of the breaker.</div>
</body></html>"));
end TransformerFixedRatioWithBreaker;
