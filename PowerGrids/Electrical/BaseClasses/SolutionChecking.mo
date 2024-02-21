within PowerGrids.Electrical.BaseClasses;

model SolutionChecking
  outer Electrical.System systemPowerGrids "Reference to system object";

  parameter Boolean enableAssertions = systemPowerGrids.enableAssertions "=true, enables asserts in order to check the validity of the numerical solution" annotation(
    Evaluate = true, Dialog(tab="Solution checking"));
  parameter AssertionLevel assertionLevel = systemPowerGrids.assertionLevel "assertion level for the solution checking (error level stops the simulation)" annotation(
  Evaluate = true, Dialog(group="Solution checking", enable=enableAssertions));
  parameter SI.PerUnit VPuMin = systemPowerGrids.VPuMin "min value of voltage in p.u at buses and sinchronous generators nodes" annotation(
    Dialog(tab="Solution checking"));
  parameter SI.PerUnit VPuMax = systemPowerGrids.VPuMax "max value of voltage in p.u at buses and sinchronous generators nodes" annotation(
    Dialog(tab="Solution checking"));
  parameter SI.PerUnit IPuMax = systemPowerGrids.IPuMax "max value of current in p.u that flows through the loads" annotation(
    Dialog(tab="Solution checking"));
  parameter SI.PerUnit omegaPuMin = systemPowerGrids.omegaPuMin "min value of frequency in p.u at generators nodes" annotation(
    Dialog(tab="Solution checking"));
  parameter SI.PerUnit omegaPuMax = systemPowerGrids.omegaPuMax "max value of frequency in p.u at generators nodes" annotation(
    Dialog(tab="Solution checking"));
  parameter Boolean enableOmegaPuChecking = false "=true, enables omegaPu checking";

  input SI.PerUnit VPuCheck "Absolute value of voltage across the port in p.u. (base VBase)";
  input SI.PerUnit IPuCheck "Absolute value of complex current flowing into the port in p.u. (base IBase)";
  Modelica.Blocks.Interfaces.RealInput omegaPuCheck if enableOmegaPuChecking  "Angular frequency in p.u.";

protected
  Modelica.Blocks.Interfaces.RealInput omegaPuInt "internal Angular frequency in p.u.";

equation
  if enableAssertions then
    assert(VPuCheck < VPuMax, "Voltage too high (VPu="+String(VPuCheck)+" > "+String(VPuMax)+"), check if the numerical solution is valid", level=assertionLevel);
    assert(VPuCheck > VPuMin, "Voltage too low (VPu="+String(VPuCheck)+" < "+String(VPuMin)+"), check if the numerical solution is valid", level=assertionLevel);
    assert(IPuCheck < IPuMax, "Current too high (IPu="+String(IPuCheck)+" > "+String(IPuMax)+"), check if the numerical solution is valid", level=assertionLevel);

    if enableOmegaPuChecking then
      assert(omegaPuInt < omegaPuMax, "frequency too high (omegaPu="+String(omegaPuInt)+" > "+String(omegaPuMax)+"), check if the numerical solution is valid", level=assertionLevel);
      assert(omegaPuInt > omegaPuMin, "frequency too low (omegaPu="+String(omegaPuInt)+" < "+String(omegaPuMin)+"), check if the numerical solution is valid", level=assertionLevel);
    end if;
  end if;

  connect(omegaPuCheck, omegaPuInt);
  if not enableOmegaPuChecking then
    omegaPuInt = 0 "not used";
  end if;

end SolutionChecking;
