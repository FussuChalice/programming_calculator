import 'package:flutter/material.dart';
import 'package:programming_calculator/core/defines/number_system.dart';
import 'package:programming_calculator/features/calculator/bloc/calculator_state.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_board_divider.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_board_tile.dart';

class CalculatorBoard extends StatelessWidget {
  final CalculatorState data;
  const CalculatorBoard({super.key, required this.data});

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
            value: data.display,
            localSystem: NumberSystem.hex,
            globalSystem: data.system,
          ),
          CalculatorBoardDivider(),
          CalculatorBoardTile(
            value: data.display,
            localSystem: NumberSystem.dec,
            globalSystem: data.system,
          ),
          CalculatorBoardDivider(),
          CalculatorBoardTile(
            value: data.display,
            localSystem: NumberSystem.oct,
            globalSystem: data.system,
          ),
          CalculatorBoardDivider(),
          CalculatorBoardTile(
            value: data.display,
            localSystem: NumberSystem.bin,
            globalSystem: data.system,
          ),
        ],
      ),
    );
  }
}
