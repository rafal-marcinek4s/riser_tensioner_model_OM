within riser_tensioner.Hydraulic;

model pressure_drop_kv
  import Modelica.Units.SI.*;
  
  parameter Real Kv = 5;
  
  parameter Density rho = 850;
  parameter Real SG = 850/997;
  
  Interfaces.fluid_port_a inlet annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.fluid_port_b outlet annotation(
    Placement(transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
    
  Pressure dP;
  MassFlowRate m_flow;
  
  constant Real convFactor = 1/(3600*sqrt(1e5));
equation

  inlet.m_flow + outlet.m_flow = 0;
  
  dP = inlet.p - outlet.p;
  
  m_flow = sign(dP)*Kv*rho*convFactor*sqrt(abs(dP)/SG);
  
  inlet.m_flow = m_flow;

annotation(
    Icon(graphics = {Rectangle(origin = {0, 2}, fillColor = {132, 132, 132}, fillPattern = FillPattern.Solid, extent = {{-100, 30}, {100, -30}}), Text(origin = {-7, 4}, extent = {{-45, 18}, {45, -18}}, textString = "kv pressure drop")}));
end pressure_drop_kv;
