import 'package:programming_calculator/core/defines/number_system.dart';

class NumConverter {
  static String toBin(int value) {
    if (value == 0) return "0";
    String result = "";
    int n = value;
    while (n > 0) {
      result = (n % 2).toString() + result;
      n ~/= 2;
    }
    return result;
  }

  static String toOct(int value) {
    if (value == 0) return "0";
    String result = "";
    int n = value;
    while (n > 0) {
      result = (n % 8).toString() + result;
      n ~/= 8;
    }
    return result;
  }

  static String toHex(int value) {
    if (value == 0) return "0";
    const hexDigits = "0123456789ABCDEF";
    String result = "";
    int n = value;
    while (n > 0) {
      int remainder = n % 16;
      result = hexDigits[remainder] + result;
      n ~/= 16;
    }
    return result;
  }

  static int binToDec(String bin) {
    int result = 0;
    for (int i = 0; i < bin.length; i++) {
      result = result * 2 + (bin.codeUnitAt(i) - '0'.codeUnitAt(0));
    }
    return result;
  }

  static int octToDec(String oct) {
    int result = 0;
    for (int i = 0; i < oct.length; i++) {
      result = result * 8 + (oct.codeUnitAt(i) - '0'.codeUnitAt(0));
    }
    return result;
  }

  static int hexToDec(String hex) {
    const hexDigits = "0123456789ABCDEF";
    int result = 0;
    for (int i = 0; i < hex.length; i++) {
      String char = hex[i].toUpperCase();
      int value = hexDigits.indexOf(char);
      result = result * 16 + value;
    }
    return result;
  }

  static int allToDec(String value, NumberSystem system) {
    switch (system) {
      case NumberSystem.hex:
        return hexToDec(value);
      case NumberSystem.dec:
        return int.parse(value);
      case NumberSystem.bin:
        return binToDec(value);
      case NumberSystem.oct:
        return octToDec(value);
    }
  }

  static String decToAll(int value, NumberSystem system) {
    switch (system) {
      case NumberSystem.hex:
        return toHex(value);
      case NumberSystem.dec:
        return value.toString();
      case NumberSystem.bin:
        return toBin(value);
      case NumberSystem.oct:
        return toOct(value);
    }
  }
}
