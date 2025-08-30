import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_calculator/core/defines/number_system.dart';
import 'package:programming_calculator/core/utils/num_converter.dart';
import 'package:programming_calculator/features/calculator/bloc/calculator_state.dart';
part 'calculator_event.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState.initial()) {
    on<CalculatorAddDigit>(_onCalculatorAddDigit);
    on<CalculatorChangeSystem>(_onCalculatorChangeSystem);
    on<CalculatorOperation>(_onCalculatorOperation);
    on<CalculatorClear>(_onCalculatorClear);
  }

  void _onCalculatorAddDigit(
    CalculatorAddDigit event,
    Emitter<CalculatorState> emit,
  ) {
    if (event.digit == "." && state.display.contains(".")) {
      return;
    }

    final newDisplay = (state.display == "0" || state.shouldClearDisplay)
        ? event.digit
        : state.display + event.digit;

    emit(state.copyWith(display: newDisplay, shouldClearDisplay: false));
  }

  void _onCalculatorChangeSystem(
    CalculatorChangeSystem event,
    Emitter<CalculatorState> emit,
  ) {
    emit(state.copyWith(system: event.system, display: "0"));
  }

  String _calculate(String a, String b, String operation, NumberSystem system) {
    double result;

    double x = NumConverter.toDouble(a, system);
    double y = NumConverter.toDouble(b, system);

    switch (operation) {
      case '+':
        result = x + y;
        break;
      case '-':
        result = x - y;
        break;
      case '*':
        result = x * y;
        break;
      case '/':
        result = y != 0 ? x / y : double.nan;
        break;
      case "mod":
        result = y != 0 ? x % y : double.nan;
        break;

      default:
        result = 0;
    }

    debugPrint(result.toString());

    return NumConverter.convert(result, system);
  }

  void _onCalculatorOperation(
    CalculatorOperation event,
    Emitter<CalculatorState> emit,
  ) {
    if (event.operation == '=') {
      if (state.pendingOperation != null && state.storedValue != null) {
        final result = _calculate(
          state.storedValue!,
          state.display,
          state.pendingOperation!,
          state.system,
        );
        emit(
          state.copyWith(
            display: result,
            pendingOperation: null,
            storedValue: null,
            shouldClearDisplay: true,
          ),
        );
      }
    } else {
      if (state.pendingOperation != null && state.storedValue != null) {
        final result = _calculate(
          state.storedValue!,
          state.display,
          state.pendingOperation!,
          state.system,
        );
        emit(
          state.copyWith(
            storedValue: result,
            pendingOperation: event.operation,
            display: result,
            shouldClearDisplay: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            storedValue: state.display,
            pendingOperation: event.operation,
            shouldClearDisplay: true,
          ),
        );
      }
    }
  }

  void _onCalculatorClear(
    CalculatorClear event,
    Emitter<CalculatorState> emit,
  ) {
    emit(CalculatorState.initial().copyWith(system: state.system));
  }
}
