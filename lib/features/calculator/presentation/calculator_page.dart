import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_calculator/features/calculator/bloc/calculator_bloc.dart';
import 'package:programming_calculator/features/calculator/presentation/calculator_view.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalculatorBloc(),
      child: const CalculatorView(),
    );
  }
}
