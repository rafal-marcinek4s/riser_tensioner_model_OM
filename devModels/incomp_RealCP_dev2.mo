within riser_tensioner.devModels;

model incomp_RealCP_dev2
  Hydraulic.cylinder_incomp oil1(x(fixed = false), V_dead = 0.001)  annotation(
    Placement(transformation(origin = {10, 24}, extent = {{-10, -10}, {10, 10}})));
  Pneumatic.gasChamberCP gas1(l = 1, V_dead = 0.001)  annotation(
    Placement(transformation(origin = {50, 24}, extent = {{-10, -10}, {10, 10}})));
  Hydraulic.cylinder_incomp oil2(V_dead = 0.001, p_oil(fixed = false))  annotation(
    Placement(transformation(origin = {-28, 24}, extent = {{-10, -10}, {10, 10}})));
  Hydraulic.pressure_drop_kv pressure_drop_kv(Kv = 200, rho(displayUnit = "kg/m3"))  annotation(
    Placement(transformation(origin = {-10, 6}, extent = {{-8, -8}, {8, 8}})));
  Modelica.Mechanics.Translational.Sources.Position position(exact = false) annotation(
    Placement(transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}})));
  Mechanical.mass_friction_hardstop mass_friction_hardstop(m = 5, x_max = 1, f = 1000, F_brk = 2000, F_c = 1600, x(start = 0.4))  annotation(
    Placement(transformation(origin = {30, 58}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 0.4; 0.2, 0.4; 1.2, 0.5; 1.5, 0.5; 2.0, 0.3; 3.0, 0.3])  annotation(
    Placement(transformation(origin = {-88, 50}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(pressure_drop_kv.inlet, oil2.port) annotation(
    Line(points = {{-18, 6}, {-28, 6}, {-28, 14}}));
  connect(pressure_drop_kv.outlet, oil1.port) annotation(
    Line(points = {{-2, 6}, {-2, 6.5}, {10, 6.5}, {10, 14}}));
  connect(position.flange, oil2.flange) annotation(
    Line(points = {{-46, 50}, {-28, 50}, {-28, 34}}, color = {0, 127, 0}));
  connect(mass_friction_hardstop.flange_a, oil1.flange) annotation(
    Line(points = {{20, 58}, {10, 58}, {10, 34}}, color = {0, 127, 0}));
  connect(mass_friction_hardstop.flange_b, gas1.flange) annotation(
    Line(points = {{40, 58}, {50, 58}, {50, 34}}, color = {0, 127, 0}));
  connect(timeTable.y, position.s_ref) annotation(
    Line(points = {{-76, 50}, {-68, 50}}, color = {0, 0, 127}));
end incomp_RealCP_dev2;
