import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_calculator/core/defines/number_system.dart';
import 'package:programming_calculator/core/utils/num_converter.dart';
import 'package:programming_calculator/features/calculator/bloc/calculator_bloc.dart';

class CalculatorBoardTile extends StatelessWidget {
  final NumberSystem localSystem;
  final NumberSystem globalSystem;
  final String value;

  const CalculatorBoardTile({
    super.key,
    required this.value,
    required this.localSystem,
    required this.globalSystem,
  });
  @override
  Widget build(BuildContext context) {
    final bool isSelected = localSystem == globalSystem;

    final String localSystemValue = isSelected
        ? value
        : NumConverter.convert(
            NumConverter.toDouble(value, globalSystem),
            localSystem,
          );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (!isSelected) {
              context.read<CalculatorBloc>().add(
                CalculatorChangeSystem(localSystem),
              );
              context.read<CalculatorBloc>().add(CalculatorClear());
            }
          },
          child: Container(
            width: 75,
            height: 58,
            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colors.black, width: 4)),
              image: isSelected
                  ? DecorationImage(
                      image: AssetImage('assets/textures/1.png'),
                      repeat: ImageRepeat.repeat,
                    )
                  : null,
            ),
            child: Text(
              localSystem.name.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'FindersKeepers',
                fontSize: 36,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: TextField(
              keyboardType: TextInputType.none,
              readOnly: true,
              controller: TextEditingController(text: localSystemValue),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'FindersKeepers',
                fontSize: 36,
                height: 1,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
