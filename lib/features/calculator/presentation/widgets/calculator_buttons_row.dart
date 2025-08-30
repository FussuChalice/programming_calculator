import 'package:flutter/material.dart';

class CalculatorButtonsRow extends StatelessWidget {
  final List<Widget> buttons;
  const CalculatorButtonsRow({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Row(spacing: 16, children: buttons));
  }
}
