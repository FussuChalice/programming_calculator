import 'package:flutter/material.dart';
import 'package:flutter_overlay_manager/flutter_overlay_manager.dart';
import 'package:programming_calculator/features/calculator/presentation/calculator_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return FlutterOverlayManager.I.builder((context) => child!);
      },
      home: CalculatorPage(),
    );
  }
}
