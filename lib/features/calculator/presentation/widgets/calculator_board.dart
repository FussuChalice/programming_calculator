import 'package:flutter/material.dart';
import 'package:programming_calculator/core/defines/number_system.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_board_divider.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_board_tile.dart';

class CalculatorBoard extends StatelessWidget {
  const CalculatorBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 4),
      ),
      child: Column(
        children: [
          CalculatorBoardTile(
            label: NumberSystem.hex.name.toUpperCase(),
            value: '0',
          ),
          CalculatorBoardDivider(),
          CalculatorBoardTile(
            label: NumberSystem.dec.name.toUpperCase(),
            value: '0',
          ),
          CalculatorBoardDivider(),
          CalculatorBoardTile(
            label: NumberSystem.oct.name.toUpperCase(),
            value: '0',
          ),
          CalculatorBoardDivider(),
          CalculatorBoardTile(
            label: NumberSystem.bin.name.toUpperCase(),
            value: '0',
          ),
        ],
      ),
    );
  }
}
