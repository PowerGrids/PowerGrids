within PowerGrids.Electrical;

package PowerFlow "Components for power flow calculations"
  extends Modelica.Icons.Package;

  annotation(
    Documentation(info = "<html><head></head><body><p>The components in this package can be used to build power flow models, together with the <a href=\"modelica://PowerGrids.Electrical.Branches.LineConstantImpedance\">LineConstantImpedance</a> models for transmission lines, <a href=\"modelica://PowerGrids.Electrical.Branches.TransformerFixedRatio\">TransformerFixedRatio</a> for transformers, and <a href=\"modelica://PowerGrids.Electrical.Buses.Bus\">Bus</a> for connection buses.</p>
<p>The power flow models have been developed to provide an easy way to calculate initial power flow values in a Modelica environment to ease dynamic simulations initialization and the switch to Modelica for power system simulations. They don't cover all the functionnalities required by an industrial power flow simulation (PV &lt;-&gt; PQ switches, controllers, etc.) and they don't reflect RTE long-term views on power flow calculations (switch to simplified time-domain simulations).</p><p>Note that you can obtain simple dynamic models of the same system by duplicating the power flow model and by replacing the PVbus and PQbus models, while keeping the transformer, line, and connection bus models as they are.</p><p><br></p>
</body></html>"));
end PowerFlow;
