import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/app/presentation/feature/bloc/cubit.dart';

const _pageMainText = "Hey there";
const _pageMainTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

class ColorChangePage extends StatefulWidget {
  const ColorChangePage({super.key});

  @override
  State<ColorChangePage> createState() => _ColorChangePageState();
}

class _ColorChangePageState extends State<ColorChangePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorChangeCubit, ColorChangeState>(
      builder: (context, state) {
        return Material(
          child: GestureDetector(
            onTap: () {
              context.read<ColorChangeCubit>().changeColor();
            },
            child: ColoredBox(
              color: state.backgroundColor,
              child: const Center(
                child: Text(
                  _pageMainText,
                  textAlign: TextAlign.center,
                  style: _pageMainTextStyle,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
