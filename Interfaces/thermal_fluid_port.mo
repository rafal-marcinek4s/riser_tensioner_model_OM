within riser_tensioner.Interfaces;

connector thermal_fluid_port

   Modelica.Units.SI.Pressure p;
   flow Modelica.Units.SI.MassFlowRate m_flow;
   stream Modelica.Units.SI.SpecificEnthalpy h;annotation(
    Icon(graphics = {Polygon(fillColor = {16, 139, 255}, fillPattern = FillPattern.Solid,lineThickness = 3, points = {{-100, -100}, {0, 100}, {100, -100}, {2, -100}, {-100, -100}})}));

end thermal_fluid_port;
