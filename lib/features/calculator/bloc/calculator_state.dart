import 'package:programming_calculator/core/defines/number_system.dart';

class CalculatorState {
  final String display;
  final String? storedValue;
  final String? pendingOperation;
  final NumberSystem system;
  final bool shouldClearDisplay;

  CalculatorState({
    required this.display,
    this.storedValue,
    this.pendingOperation,
    required this.system,
    this.shouldClearDisplay = false,
  });

  factory CalculatorState.initial() => CalculatorState(
    display: "0",
    storedValue: null,
    pendingOperation: null,
    system: NumberSystem.dec,
    shouldClearDisplay: false,
  );

  CalculatorState copyWith({
    String? display,
    String? storedValue,
    String? pendingOperation,
    NumberSystem? system,
    bool? shouldClearDisplay,
  }) {
    return CalculatorState(
      display: display ?? this.display,
      storedValue: storedValue ?? this.storedValue,
      pendingOperation: pendingOperation ?? this.pendingOperation,
      system: system ?? this.system,
      shouldClearDisplay: shouldClearDisplay ?? this.shouldClearDisplay,
    );
  }
}
