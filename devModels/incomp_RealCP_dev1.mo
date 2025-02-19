within riser_tensioner.devModels;

model incomp_RealCP_dev1
  Hydraulic.cylinder_incomp oil1(x(fixed = false), V_dead = 0.001)  annotation(
    Placement(transformation(origin = {10, 24}, extent = {{-10, -10}, {10, 10}})));
  Pneumatic.gasChamberCP gas1(l = 1, V_dead = 0.001)  annotation(
    Placement(transformation(origin = {50, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 5)  annotation(
    Placement(transformation(origin = {30, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Components.Damper damper(d = 1000)  annotation(
    Placement(transformation(origin = {40, 72}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {40, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Hydraulic.cylinder_incomp oil2(V_dead = 0.001, p_oil(fixed = false))  annotation(
    Placement(transformation(origin = {-28, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.05, f = 0.25, phase = -Modelica.Constants.pi/2) annotation(
    Placement(transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}})));
  Hydraulic.pressure_drop_kv pressure_drop_kv(Kv = 50, rho(displayUnit = "kg/m3"))  annotation(
    Placement(transformation(origin = {-6, 6}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Mechanics.Translational.Sources.Position position(exact = false) annotation(
    Placement(transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(mass.flange_a, oil1.flange) annotation(
    Line(points = {{20, 52}, {10, 52}, {10, 34}}, color = {0, 127, 0}));
  connect(mass.flange_b, gas1.flange) annotation(
    Line(points = {{40, 52}, {50, 52}, {50, 34}}, color = {0, 127, 0}));
  connect(damper.flange_b, mass.flange_b) annotation(
    Line(points = {{40, 62}, {40, 52}}, color = {0, 127, 0}));
  connect(fixed.flange, damper.flange_a) annotation(
    Line(points = {{40, 88}, {40, 82}}, color = {0, 127, 0}));
  connect(pressure_drop_kv.inlet, oil2.port) annotation(
    Line(points = {{-14, 6}, {-28, 6}, {-28, 14}}));
  connect(pressure_drop_kv.outlet, oil1.port) annotation(
    Line(points = {{2, 6}, {2, 6.5}, {10, 6.5}, {10, 14}}));
  connect(position.flange, oil2.flange) annotation(
    Line(points = {{-46, 50}, {-28, 50}, {-28, 34}}, color = {0, 127, 0}));
  connect(position.s_ref, sine.y) annotation(
    Line(points = {{-68, 50}, {-78, 50}}, color = {0, 0, 127}));
end incomp_RealCP_dev1;
