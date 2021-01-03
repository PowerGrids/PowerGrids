within PowerGrids.Electrical.Branches;

model LineConstantImpedanceWithBreakers "Transmission line with constant impedance and breakers"
  extends BaseClasses.PiNetwork(UNomA = UNom, UNomB = UNomA);
  extends Icons.Line;
  encapsulated type BreakersState = enumeration(
    AcBc "Both breakers at port A and at port B closed", 
    AcBo "Breaker at port A closed, breaker at port B open", 
    AoBc "Breaker at port A open, breaker at port B closed", 
    AoBo "Both breakers at port A and at port B open"
  );
  parameter Boolean useBreakerA = false "Use breaker at port A" annotation(
    Dialog(group = "External Inputs"),
    choices(checkBox = true));
  parameter Boolean useBreakerB = false "Use breaker at port B" annotation(
    Dialog(group = "External Inputs"),
    choices(checkBox = true));
  parameter Types.Voltage UNom(start = 400e3) "Nominal/rated voltage";
  parameter Types.Resistance R "Series resistance";
  parameter Types.Resistance X "Series reactance";
  parameter Types.Conductance G = 0 "Shunt conductance";
  parameter Types.Conductance B = 0 "Shunt susceptance";
  parameter Boolean breakerAStatusStart = true "Breaker A start status - true means breaker closed" annotation(
    Dialog(tab = "Initialization"));
  parameter Boolean breakerBStatusStart = true "Breaker B start status - true means breaker closed" annotation(
    Dialog(tab = "Initialization"));
  final parameter Types.ComplexAdmittance Yseries = 1 / Complex(R, X) "Series admittance" annotation(Evaluate = true);
  final parameter Types.ComplexAdmittance Yshunt = Complex(G / 2, B / 2) "Shunt admittance at port A/B";
  final parameter Types.ComplexAdmittance YbreakerOpen = Yseries * Yshunt / (Yseries + Yshunt) "Total admittance when breaker A/B is open" annotation(Evaluate = true);

  Types.ComplexAdmittance Y_actual "Actual series admittance";
  Types.ComplexAdmittance YA_actual "Actual shunt admittance at port A";
  Types.ComplexAdmittance YB_actual "Actual shunt admittance at port B";
  BreakersState breakerStatus(start = BreakersState.AcBc) "Breakers current status";

  Modelica.Blocks.Interfaces.BooleanInput breakerStatusA if useBreakerA "Breaker status at port A - true means breaker closed" annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.BooleanInput breakerStatusB if useBreakerB "Breaker status at port B - true means breaker closed" annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

protected
  Modelica.Blocks.Interfaces.BooleanInput breakerStatusInternalA(start = breakerAStatusStart, fixed = true) "Vreaker status at port A";
  Modelica.Blocks.Interfaces.BooleanInput breakerStatusInternalB(start = breakerBStatusStart, fixed = true) "Breaker status at port B";

initial algorithm
  if breakerAStatusStart then
    if breakerBStatusStart then
      breakerStatus := BreakersState.AcBc;
    else
      breakerStatus := BreakersState.AcBo;
    end if;
  else
    if breakerBStatusStart then
      breakerStatus := BreakersState.AoBc;
    else
      breakerStatus := BreakersState.AoBo;
    end if;  
  end if;    
      
algorithm
  when breakerStatus == BreakersState.AcBc 
       and not pre(breakerStatusInternalB) then
    breakerStatus := BreakersState.AcBo "AcBc to AcBo";
    
  elsewhen breakerStatus == BreakersState.AcBc 
           and not pre(breakerStatusInternalA) then
    breakerStatus := BreakersState.AoBc "AcBc to AoBc";
  
  elsewhen breakerStatus == BreakersState.AcBo 
           and not pre(breakerStatusInternalA) then
    breakerStatus := BreakersState.AoBo "AcBo to AoBo";
  
  elsewhen breakerStatus == BreakersState.AoBc 
           and not pre(breakerStatusInternalB) then
    breakerStatus := BreakersState.AoBo "AoBc to AoBo";
  
  elsewhen breakerStatus == BreakersState.AoBo 
           and pre(breakerStatusInternalA) then
    breakerStatus := BreakersState.AcBo "AoBo to AcBo";
  
  elsewhen breakerStatus == BreakersState.AoBo 
           and pre(breakerStatusInternalB) then
    breakerStatus := BreakersState.AoBc "AoBo to AoBc";
    
  elsewhen breakerStatus == BreakersState.AcBo 
           and pre(breakerStatusInternalB) then
    breakerStatus := BreakersState.AcBc "AcBo to AcBc";
    
  elsewhen breakerStatus == BreakersState.AoBc 
           and pre(breakerStatusInternalA) then
    breakerStatus := BreakersState.AcBc "AoBc to AcBc";
  end when;

equation
  if breakerStatus == BreakersState.AcBc then
    Y_actual = Yseries;
    YA_actual = Yshunt;
    YB_actual = Yshunt;
  
  elseif breakerStatus == BreakersState.AcBo then
    Y_actual = Complex(0);
    YB_actual = Complex(0);
    YA_actual = YbreakerOpen;
  
  elseif breakerStatus == BreakersState.AoBc then
    Y_actual = Complex(0);
    YA_actual = Complex(0);
    YB_actual = YbreakerOpen;
  
  else 
    // AoBo
    Y_actual = Complex(0);
    YB_actual = Complex(0);
    YA_actual = Complex(0);
  end if;  

  k = Complex(1);
  Y = Y_actual;
  YA = YA_actual;
  YB = YB_actual;

  connect(breakerStatusA, breakerStatusInternalA);
  connect(breakerStatusB, breakerStatusInternalB);
  if not useBreakerA then
    breakerStatusInternalA = true "Breaker closed";
  end if;
  if not useBreakerB then
    breakerStatusInternalB = true "Breaker closed";
  end if;
  annotation(
    Documentation(info = "<html><head></head><body><p>Transmission line with constant series impedance R+jX and constant shunt admittance G+jB. </p>
<p>Implemented as a child class of <a href=\"modelica://PowerGrids.Electrical.Branches.BaseClasses.PiNetwork\">PiNetwork</a>, where Ya=Yb=(G+jB)/2 and k = 1, see the corresponding documentation.</p><p>Two breakers are provided, one for each port of the line. Each breaker has a conditional boolean input to set the logical status:<br></p><ul><li>true &nbsp;= breaker closed</li><li>false = breaker open&nbsp;</li></ul><div>When a breaker is open the current entering from the corresponding port is forced to 0 (by setting to 0 both the actual values of the line impedance and of the shunt impedance of said port), and the total impedance seen to the other port becomes equal to the line impedance + the shunt impedance.</div><div><br></div><div>The actual values of the series impedance and of both the shunt impedances are managed by a state-machine, which monitors the state of the breakers.</div><p></p>
</body></html>"));

end LineConstantImpedanceWithBreakers;
