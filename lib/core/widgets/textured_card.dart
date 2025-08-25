import 'package:flutter/material.dart';

class TexturedCard extends StatelessWidget {
  final int? textureId;
  final Widget? child;

  const TexturedCard({super.key, this.textureId, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 4, color: Colors.black)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          image: DecorationImage(
            image: AssetImage('assets/textures/${textureId ?? 0}.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: child,
      ),
    );
  }
}
