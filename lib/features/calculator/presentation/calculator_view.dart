import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_calculator/core/defines/number_system.dart';
import 'package:programming_calculator/core/utils/url_launcher.dart';
import 'package:programming_calculator/core/widgets/textured_card.dart';
import 'package:programming_calculator/features/calculator/bloc/calculator_bloc.dart';
import 'package:programming_calculator/features/calculator/bloc/calculator_state.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_board.dart';
import 'package:programming_calculator/features/calculator/presentation/widgets/calculator_button.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: TexturedCard(
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              left: 20,
              right: 20,
              top: 30,
              bottom: 40,
            ),
            child: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) => Column(
                spacing: 28,
                children: [
                  CalculatorBoard(data: state),

                  Expanded(
                    child: StaggeredGridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      staggeredTiles: [
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),

                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),

                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),

                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),

                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 1.72),

                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                        StaggeredTile.count(1, 0.86),
                      ],
                      children: [
                        CalculatorButton(
                          label: 'CL',
                          onDoubleTap: UrlLauncher.launchGithubRepository,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorClear(),
                          ),
                        ),
                        CalculatorButton(
                          label: 'A',
                          disabled: state.system != NumberSystem.hex,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('A'),
                          ),
                        ),
                        CalculatorButton(
                          label: '=',
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorOperation('='),
                          ),
                        ),
                        CalculatorButton(
                          label: '*',
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorOperation('*'),
                          ),
                        ),

                        CalculatorButton(
                          label: 'B',
                          disabled: state.system != NumberSystem.hex,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('B'),
                          ),
                        ),
                        CalculatorButton(
                          label: 'C',
                          disabled: state.system != NumberSystem.hex,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('C'),
                          ),
                        ),
                        CalculatorButton(
                          label: 'D',
                          disabled: state.system != NumberSystem.hex,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('D'),
                          ),
                        ),
                        CalculatorButton(
                          label: '/',
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorOperation('/'),
                          ),
                        ),

                        CalculatorButton(
                          label: '9',
                          disabled:
                              state.system == NumberSystem.oct ||
                              state.system == NumberSystem.bin,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('9'),
                          ),
                        ),
                        CalculatorButton(
                          label: 'E',
                          disabled: state.system != NumberSystem.hex,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('E'),
                          ),
                        ),
                        CalculatorButton(
                          label: 'F',
                          disabled: state.system != NumberSystem.hex,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('F'),
                          ),
                        ),
                        CalculatorButton(
                          label: '-',
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorOperation('-'),
                          ),
                        ),

                        CalculatorButton(
                          label: '6',
                          disabled: state.system == NumberSystem.bin,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('6'),
                          ),
                        ),
                        CalculatorButton(
                          label: '7',
                          disabled: state.system == NumberSystem.bin,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('7'),
                          ),
                        ),
                        CalculatorButton(
                          label: '8',
                          disabled:
                              state.system == NumberSystem.oct ||
                              state.system == NumberSystem.bin,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('8'),
                          ),
                        ),
                        CalculatorButton(
                          label: '+',
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorOperation('+'),
                          ),
                        ),

                        CalculatorButton(
                          label: '3',
                          disabled: state.system == NumberSystem.bin,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('3'),
                          ),
                        ),
                        CalculatorButton(
                          label: '4',
                          disabled: state.system == NumberSystem.bin,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('4'),
                          ),
                        ),
                        CalculatorButton(
                          label: '5',
                          disabled: state.system == NumberSystem.bin,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('5'),
                          ),
                        ),
                        CalculatorButton(
                          label: 'mod',
                          bottom: true,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorOperation('mod'),
                          ),
                        ),

                        CalculatorButton(
                          label: '0',
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('0'),
                          ),
                        ),
                        CalculatorButton(
                          label: '1',
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('1'),
                          ),
                        ),
                        CalculatorButton(
                          label: '2',
                          disabled: state.system == NumberSystem.bin,
                          onTap: () => context.read<CalculatorBloc>().add(
                            CalculatorAddDigit('2'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
