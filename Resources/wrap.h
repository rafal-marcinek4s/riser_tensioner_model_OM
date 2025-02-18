
#ifndef COOLPROP_CALCULATE_H
#define COOLPROP_CALCULATE_H

#ifdef __cplusplus
extern "C" {
#endif

// Dla Windows - eksportowanie funkcji z DLL:
__declspec(dllexport) double calculate(
  const char* outputProperty,
  const char* inputProperty1,
  double value1,
  const char* inputProperty2,
  double value2,
  const char* fluid) ;

#ifdef __cplusplus
}
#endif

#endif // COOLPROP_CALCULATE_H