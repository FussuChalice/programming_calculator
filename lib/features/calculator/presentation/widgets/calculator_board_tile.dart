import 'package:flutter/material.dart';

class CalculatorBoardTile extends StatelessWidget {
  final String label;
  final bool? selected;
  final String value;
  final void Function()? onTap;
  const CalculatorBoardTile({
    super.key,
    this.selected,
    required this.label,
    required this.value,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    bool isSelected = selected ?? false;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: !isSelected ? onTap : null,
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
              label,
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
        // Padding(
        //   padding: EdgeInsetsGeometry.only(right: 16),
        //   child: Text(
        //     value,
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontFamily: 'FindersKeepers',
        //       fontSize: 36,
        //       height: 1.5,
        //     ),
        //   ),
        // ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: TextField(
              keyboardType: TextInputType.none,
              readOnly: true,
              controller: TextEditingController(text: value),
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
