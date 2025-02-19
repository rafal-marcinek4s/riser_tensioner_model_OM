within riser_tensioner.Mechanical;

model mass_friction_hardstop


  import Modelica.Units.SI.*;
  
  parameter Mass m = 5 "Masa [kg]";
  
  
  Velocity v;
  Acceleration a;
  Length x(start = 0);
  
  parameter Real f = 0.5;
  parameter Velocity v_brk = 0.01;
  parameter Force F_brk = 50;
  parameter Force F_c = 30;
  
  Force F_fric;
  Velocity v_c;
  Velocity v_st;
  Force F_total;
  
  parameter Length x_max = 0.2;
  parameter Length x_min = 0;
  parameter Force stop_stiffness = 1e9;
  parameter Damping stop_damping = 1000;
  Force F_stop;

  
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(
    Placement(transformation(origin = {-64, -6}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(
    Placement(transformation(origin = {80, -2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}})));
    
equation


  der(x) = v;
  der(v) = a;
  
  a * m = flange_a.f + flange_b.f - F_fric + F_stop;
  F_total = flange_a.f + flange_b.f - F_fric;
  
  
  flange_a.s = x;
  flange_b.s = x;
  
   
  v_c = v_brk/10;
  v_st = v_brk*sqrt(2);
  
  F_fric = sqrt(2*Modelica.Constants.e)*(F_brk-F_c) * exp(-(v/v_st)^2) * (v/v_st) + F_c * tanh(v/v_c) + f*v;
  
  if x > x_max then
    F_stop = -stop_stiffness * (x - x_max) - stop_damping * v;
  elseif x < x_min then
    F_stop = -stop_stiffness * (x - x_min) - stop_damping * v;
  else
    F_stop = 0;
  end if;
  
  
  
annotation(
    Icon(graphics = {Rectangle(fillColor = {181, 181, 181}, fillPattern = FillPattern.Solid, extent = {{-100, 40}, {100, -40}}, radius = 5), Rectangle(origin = {0, -46}, fillColor = {139, 139, 139}, fillPattern = FillPattern.Solid, extent = {{-110, 6}, {110, -6}})}));
end mass_friction_hardstop;
