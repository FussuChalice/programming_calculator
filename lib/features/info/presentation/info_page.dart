import 'package:flutter/material.dart';
import 'package:programming_calculator/core/widgets/textured_card.dart';
import 'package:programming_calculator/features/info/presentation/widgets/info_card.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: TexturedCard(
          textureId: 1,
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 40, right: 40, top: 30),
            child: Center(child: InfoCard()),
          ),
        ),
      ),
    );
  }
}
