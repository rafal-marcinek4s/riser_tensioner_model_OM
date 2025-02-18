within riser_tensioner.Pneumatic;

model gasChamberCP
  import Modelica.Units.SI.*;

  parameter Temperature T_init = 300;
  parameter Pressure p_init = 100e5;
  parameter Volume V_dead = 0.0001;
  
  parameter Length d = 0.5;
  parameter Length l = 0.8;
  parameter Area A = Modelica.Constants.pi*(d^2)/4;
  
  parameter Length x_init = 0.4 "Początkowe położenie tłoka";
  Length x(start = x_init);
  
  Volume V;
  Pressure p(start = p_init);
  Force F;
  Mass m;
  Density rho;
  SpecificInternalEnergy u;
  Temperature T;
  
  
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange annotation(
    Placement(transformation(origin = {4, -2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}})));


initial equation

  m = Resources.PropsSI("D","P",p_init,"T",T_init,"Nitrogen") * (l-x_init)*A;
  u = Resources.PropsSI("U","P",p_init,"T",T_init,"Nitrogen");
  T = T_init; 
  rho = Resources.PropsSI("D","P",p_init,"T",T_init,"Nitrogen");
  
equation
  der(m) = 0;
  
  V = V_dead + (l-x)*A;
  rho = m/V;
  der(u) = -p/m * der(V);
  p = Resources.PropsSI("P","D",rho,"U",u,"Nitrogen");
  T = Resources.PropsSI("T","D",rho,"U",u,"Nitrogen");
  
  F = A*p;
  
  flange.f = -F;
  flange.s = x;
annotation(
    Icon(graphics = {Rectangle(origin = {0, 20}, fillColor = {60, 160, 247}, fillPattern = FillPattern.Solid, extent = {{-50, 42}, {50, -120}}), Rectangle(origin = {0, 50}, fillColor = {153, 153, 153}, fillPattern = FillPattern.Solid, extent = {{-20, 50}, {20, -50}}), Rectangle( fillPattern = FillPattern.Solid, extent = {{-50, 4}, {50, -15}})}));
end gasChamberCP;
