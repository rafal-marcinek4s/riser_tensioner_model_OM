within riser_tensioner.Resources;

function PropsSI

  input String outProp;
  input String prop1;
  input Real val1;
  input String prop2;
  input Real val2;
  input String fluid;
  
  
  
  output Real result;
  
  external "C" result = calculate(outProp,prop1,val1,prop2,val2,fluid)
  annotation(
    Include = "#include \"wrap.h\"",
    IncludeDirectory = "modelica://riser_tensioner/Resources",
    Library = "main",
    LibraryDirectory = "modelica://riser_tensioner/Resources"
    );


end PropsSI;
