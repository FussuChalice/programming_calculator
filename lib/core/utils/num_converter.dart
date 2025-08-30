import 'dart:math' as math;

import 'package:programming_calculator/core/defines/number_system.dart';

/// All actions in dart, what do a += b or another operations, equivalent a = a + b.

/// I rewrote the class functionality a bit, since there was no necessary logic
/// for processing the fractional part. Plus optimization, reducing the number of repetitions.
/// The old version of the class can be seen in Git. :)

class NumConverter {
  static String convert(
    double value,
    NumberSystem system, {
    int precision = 10,
  }) {
    int intPart = value.truncate();
    double fracPart = value - intPart;

    String intStr = _convertInt(intPart, system.base);
    String fracStr = _convertFrac(fracPart, system.base, precision);

    return fracStr.isEmpty ? intStr : "$intStr.$fracStr";
  }

  static String _convertInt(int number, int base) {
    if (number == 0) {
      return "0";
    }

    String result = "";

    int n = number;
    while (n > 0) {
      int remainder = n % base;
      result = _digitToChar(remainder) + result;
      n ~/= base;
    }

    return result;
  }

  static double toDouble(String value, NumberSystem system) {
    final List<String> parts = value.split('.');

    double intPart = 0;
    final String intStr = parts[0];

    for (int i = 0; i < intStr.length; i++) {
      int digit = _charToDigit(intStr[i]);
      int power = intStr.length - i - 1;
      intPart += digit * math.pow(system.base.toDouble(), power);
    }

    double fracPart = 0;
    if (parts.length > 1) {
      final fracStr = parts[1];
      for (int i = 0; i < fracStr.length; i++) {
        int digit = _charToDigit(fracStr[i]);
        fracPart += digit / math.pow(system.base, i + 1);
      }
    }

    return intPart + fracPart;
  }

  static String _convertFrac(double fraction, int base, int precision) {
    String result = "";
    double fractionTmp = fraction;

    for (var i = 0; i < precision && fractionTmp > 0; i++) {
      fractionTmp *= base;
      int digit = fractionTmp.truncate();
      result += _digitToChar(digit);
      fractionTmp -= digit;
    }

    return result;
  }

  static const List<String> _symbols = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];

  static int _charToDigit(String char) {
    return _symbols.indexOf(char.toUpperCase());
  }

  static String _digitToChar(int digit) {
    return _symbols[digit];
  }
}
