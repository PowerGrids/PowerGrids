within PowerGrids.Electrical.Controls.ExcitationSystems.BaseClasses;
model ExciterRectifierRegulationCharacteristicEquationsIEEE "Exciter rectifier regulation characteristic IEEE"
  extends Modelica.Blocks.Interfaces.SISO;

algorithm
  if u < 0.433 then
    y := 1 - 0.577*u;
  elseif u < 0.75 then  
    y := sqrt(0.75 - u^2); 
  elseif u < 1 then  
    y := 1.732*(1-u);
  else
    y := 0;
  end if;
    
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Rectangle(origin = {0, -1}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 101}, {100, -99}}), Text(origin = {1, -1}, extent = {{-85, 49}, {85, -49}}, textString = "Fex = f(In)")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Documentation(info = "<html><head></head><body><div>The model contains an algorithm which implements the equations (in explicit form) that are used to compute the exciter rectifier characteristic according to the annex D of the&nbsp;<span style=\"font-size: 12px;\">IEEE Std 421.5TM-2005.</span></div><div><span style=\"font-size: 12px;\"><br></span></div><div>Typical applications of said equations can be found in the following chapters of the same&nbsp;<span style=\"font-size: 12px;\">IEEE Std 421.5TM-2005:</span></div><div><ul><li>6 - Type AC - Alternator-supplied rectifierexcitation system,</li><li>7 - Type ST - Static excitation system.</li></ul></div></body></html>"));
end ExciterRectifierRegulationCharacteristicEquationsIEEE;
