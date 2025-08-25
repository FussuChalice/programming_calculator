import 'package:flutter/material.dart';

class Common {
  static PageRouteBuilder _noAnimationRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  static void pushWithoutAnimation(BuildContext context, Widget page) {
    Navigator.push(context, _noAnimationRoute(page));
  }

  static void popWithoutAnimation(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }
}
