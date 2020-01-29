within PowerGrids;

package Types "Domain-specific type definitions"
  extends Modelica.Icons.TypesPackage;
  type Voltage = SI.Voltage(nominal = 1e4, displayUnit = "kV");
  type Current = SI.Current(nominal = 1e4, displayUnit = "kA");
  type ActivePower = SI.ActivePower(nominal = 1e8, displayUnit = "MW");
  type ReactivePower = SI.ReactivePower(nominal = 1e8, displayUnit = "MVA");
  type Power = SI.Power(nominal = 1e8, displayUnit = "MW");
  type ApparentPower = SI.ApparentPower(nominal = 1e8, displayUnit = "MVA");
  type Angle = SI.Angle;
  type AngularVelocity = SI.AngularVelocity;
  type Frequency = SI.Frequency;
  type Resistance = SI.Resistance;
  type Reactance = SI.Reactance;
  type Conductance = SI.Conductance;
  type Susceptance = SI.Susceptance;
  type Impedance = SI.Impedance;  
  type PerUnit = SI.PerUnit;
  type Time = SI.Time;
  operator record ComplexVoltage = SI.ComplexVoltage(re(nominal = 1e4, displayUnit="kV"), im(nominal = 1e4, displayUnit="kV"));
  operator record ComplexCurrent = SI.ComplexCurrent(re(nominal = 1e4, displayUnit="kA"), im(nominal = 1e4, displayUnit="kA"));
  operator record ComplexAdmittance = SI.ComplexAdmittance;
  operator record ComplexImpedance = SI.ComplexImpedance;
  operator record ComplexPower = SI.ComplexPower(re(nominal = 1e8, displayUnit="MW"), im(nominal = 1e8, displayUnit="MVA"));
  operator record ComplexPerUnit = Complex(re(unit = "1"), im(unit = "1"));

  package Choices
    extends Modelica.Icons.TypesPackage;
  
    type ReferenceFrequency = enumeration(
         nominalFrequency "Nominal frequency",
         fixedReferenceGenerator "Fixed reference generator frequency",
         adaptiveReferenceGenerators "One reference generator for each synchronous island");

    type ExcitationPuType = enumeration(
      nominalStatorVoltageNoLoad "1 p.u. gives nominal air-gap stator voltage at no load",
      Kundur "Base voltage as per Kundur, Power System Stability and Control");

    type TimeConstantsApproximation = enumeration(
      classicalDefinition "Tpd0 = T1, Tppd0 = T3",
      accurateEstimation "Tpd0 = T1+T2, Tppd0 = T1T3/(T1+T2)",
      exactComputation "Exact polynomial roots");

    type InitializationOption = enumeration(
      globalSteadyStateFixedSetPoints "Global steady state, fixed set points",
      globalSteadyStateFixedPowerFlow "Global steady state, fixed power flow",
      localSteadyStateFixedPowerFlow "Local steady state, fixed power flow",
      noInit "No initial equations");
  
    type LocalInitializationOption = enumeration(
      none "Global initialization",
      PV "Try to match PV",
      PQ "Try to match PQ");
  end Choices;
end Types;
