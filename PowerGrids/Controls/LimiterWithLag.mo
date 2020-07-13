within PowerGrids.Controls;
block LimiterWithLag
  extends Modelica.Blocks.Interfaces.SISO;
  
  encapsulated type State = enumeration(
    upperSat "Upper limit reached",
    lowerSat "Lower limit reached",
    notSat   "u is in range"
  );
  
  parameter Real uMax  "Upper limit";
  parameter Real uMin  "Lower limit";
  parameter Types.Time LagMax  "Time lag before taking action when u going above uMax";
  parameter Types.Time LagMin  "Time lag before taking action when u going below uMin";
  parameter State stateStart = State.notSat "saturation initial state";
  final parameter Boolean useLag = (LagMax > 0) or (LagMin > 0) "Lags are used only if at least one is not null";
  
  State state(start = stateStart, fixed = true) "saturation state";
  discrete SI.Time saturationLimitReached(start = 0, fixed = true) "Time in which the saturation limit is reached";
  Boolean satON "Saturation is active";

algorithm  
  when u > uMax then
    state := State.upperSat;
    saturationLimitReached := time;
  end when;  

  when u < uMin then
    state := State.lowerSat;
    saturationLimitReached := time;
  end when;  

  when u < uMax and u > uMin then  
    state := State.notSat;
  end when;     

  when useLag and state == State.notSat then
    satON := false;
  elsewhen useLag and state == State.upperSat and (time - saturationLimitReached) > LagMax then
    satON := true;
  elsewhen useLag and state == State.lowerSat and (time - saturationLimitReached) > LagMin then
    satON := true;
  end when;

  if not useLag then
    satON := true;
  end if;
    
equation
  // The simplified model has no saturation, to make the controller equations linear
  y = homotopy(
    actual = if state == State.upperSat and satON then uMax 
             elseif state == State.lowerSat and satON then uMin
             else u,
    simplified =  u);

annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Line(origin = {-2, 0}, points = {{-88, 0}, {92, 0}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Line( points = {{0, 94}, {0, -94}}, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 7), Line(points = {{-80, -78}, {-80, -78}, {-40, -78}, {40, 78}, {80, 78}}), Text(origin = {-53, 72}, extent = {{-33, 12}, {33, -12}}, textString = "%LagMax"), Text(origin = {49, -74}, extent = {{-33, 12}, {33, -12}}, textString = "%LagMin")}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}, grid = {0.5, 0.5}, initialScale = 0.1)),
  Documentation(info = "<html><head></head><body><span class=\"pl-en\">Model of Limiter that enforces saturations only after they were violated without interruption during a certain amount of time.</span><div><br><div><span class=\"pl-en\">Switching from saturated to non saturated mode has no lag.</span></div><div><span class=\"pl-en\"><br></span></div><div><span class=\"pl-en\">Different lag can be set for upper and lower saturations.</span></div></div><div><span class=\"pl-en\"><br></span></div><div><span class=\"pl-en\">Saturated or not saturated initial state can be selected, if a saturated initial state is selected then it remain active until a change from saturated to not saturated state is detected.</span></div></body></html>"));
end LimiterWithLag;
