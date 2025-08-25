part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class CalculatorAddDigit extends CalculatorEvent {
  final String digit;

  CalculatorAddDigit(this.digit);
}

class CalculatorChangeSystem extends CalculatorEvent {
  final NumberSystem system;

  CalculatorChangeSystem(this.system);
}

class CalculatorOperation extends CalculatorEvent {
  final String operation;

  CalculatorOperation(this.operation);
}

class CalculatorClear extends CalculatorEvent {}
