import 'package:flutter/material.dart';
import 'package:programming_calculator/core/utils/url_launcher.dart';
import 'package:programming_calculator/core/widgets/textured_card.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_board.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_button.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_buttons_row.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: TexturedCard(
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 30),
            child: Column(
              spacing: 18,
              children: [
                CalculatorBoard(),
                CalculatorButtonsRow(
                  buttons: [
                    CalculatorButton(
                      label: 'CL',
                      onDoubleTap: UrlLauncher.launchGithubRepository,
                    ),
                    CalculatorButton(label: 'A'),
                    CalculatorButton(label: '='),
                    CalculatorButton(label: '*'),
                  ],
                ),
                CalculatorButtonsRow(
                  buttons: [
                    CalculatorButton(label: 'B'),
                    CalculatorButton(label: 'C'),
                    CalculatorButton(label: 'D'),
                    CalculatorButton(label: '/'),
                  ],
                ),
                CalculatorButtonsRow(
                  buttons: [
                    CalculatorButton(label: '9'),
                    CalculatorButton(label: 'E'),
                    CalculatorButton(label: 'F'),
                    CalculatorButton(label: '-'),
                  ],
                ),
                CalculatorButtonsRow(
                  buttons: [
                    CalculatorButton(label: '6'),
                    CalculatorButton(label: '7'),
                    CalculatorButton(label: '8'),
                    CalculatorButton(label: '+'),
                  ],
                ),
                CalculatorButtonsRow(
                  buttons: [
                    CalculatorButton(label: '3'),
                    CalculatorButton(label: '4'),
                    CalculatorButton(label: '5'),
                    CalculatorButton(label: '.'),
                  ],
                ),
                CalculatorButtonsRow(
                  buttons: [
                    CalculatorButton(label: '0'),
                    CalculatorButton(label: '1'),
                    CalculatorButton(label: '2'),
                    CalculatorButton(label: 'mod'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
