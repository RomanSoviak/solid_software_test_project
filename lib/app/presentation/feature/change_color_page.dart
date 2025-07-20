import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/app/presentation/feature/bloc/cubit.dart';

class ColorChangePage extends StatefulWidget {
  const ColorChangePage({super.key});

  @override
  State<ColorChangePage> createState() => _ColorChangePageState();
}

class _ColorChangePageState extends State<ColorChangePage> {
  @override
  void initState() {
    super.initState();

    // context.read<ColorChangeCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorChangeCubit, ColorChangeState>(
      builder: (context, state) {
        return Material(
          child: GestureDetector(
            onTap: () {
              context.read<ColorChangeCubit>().changeColor();
            },
            child: Stack(
              children: [
                Container(color: state.backgroundColor),
                const Center(
                  child: Text(
                    "Hey there",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
