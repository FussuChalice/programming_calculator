import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  final bool? disabled;
  final bool? bottom;
  final String label;
  final void Function()? onTap, onDoubleTap;

  const CalculatorButton({
    super.key,
    required this.label,
    this.onTap,
    this.disabled,
    this.onDoubleTap,
    this.bottom,
  });

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isDisabled = widget.disabled ?? false;
    bool isBottom = widget.bottom ?? false;

    return InkResponse(
      onDoubleTap: widget.onDoubleTap,
      onTap: () {
        if (!isDisabled) {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        }
      },
      onTapDown: (details) {
        setState(() {
          isHovered = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: !isDisabled ? Colors.white : null,
          border: Border.all(color: Colors.black, width: 4),
          image: isDisabled || isHovered
              ? DecorationImage(
                  image: AssetImage('assets/textures/1.png'),
                  repeat: ImageRepeat.repeat,
                )
              : null,
          boxShadow: !isHovered
              ? [
                  BoxShadow(
                    color: Colors.black,
                    offset: const Offset(8, 8),
                    blurRadius: 0, // no blur
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Text(
          widget.label,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'FindersKeepers',
            fontSize: 36,
            height: !isBottom ? 0.8 : 3,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
