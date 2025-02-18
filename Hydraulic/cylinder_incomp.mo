within riser_tensioner.Hydraulic;

model cylinder_incomp
  import Modelica.Units.SI.*;
  
  parameter Pressure p_init = 100e5;
  parameter Volume V_dead = 0.0001;
  
  package oil = Media.Oil.Generic;
  
  parameter Length d = 0.5;
  
  parameter Area A = Modelica.Constants.pi*(d^2)/4;
  
  parameter Length x_init = 0.4 "Początkowe położenie tłoka";
  Length x(start = x_init);
  

  
  Volume V_oil;
  Force F_oil;
  Pressure p_oil(start = p_init);

  Modelica.Mechanics.Translational.Interfaces.Flange_a flange annotation(
    Placement(transformation(origin = {-2, 40}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.fluid_port_a port annotation(
    Placement(transformation(origin = {2, -54}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}})));

equation

  V_oil = V_dead + x*A;
  F_oil = A*p_oil;
  flange.f = F_oil;
  flange.s = x;
  
  port.m_flow = A*der(x)*oil.density;

  
  port.p = p_oil;

annotation(
    Icon(graphics = {Rectangle(origin = {0, -18}, fillColor = {194, 194, 194}, fillPattern = FillPattern.Solid, extent = {{-50, 65}, {50, -82}}), Rectangle(origin = {0, 50}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-15, 50}, {15, -45}}), Rectangle(origin = {0, 2}, fillPattern = FillPattern.Solid, extent = {{-50, 4}, {50, -15}})}));
end cylinder_incomp;
