import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/app/presentation/feature/bloc/color_change_cubit.dart';

const _pageMainText = 'Hey there';
const _defaultErrorText = 'Something went wrong!';
const _pageMainTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const _errorBackgroundColor = Colors.red;
const _errorShowingDuration = Duration(seconds: 3);

/// A page that displays a colored background that changes on tap.
///
/// Uses [ColorChangeCubit] to manage color state and shows an error snackbar
/// if color change fails.
class ColorChangePage extends StatefulWidget {
  /// Creates a [ColorChangePage] instance.
  const ColorChangePage({super.key});

  /// Creates the state for [ColorChangePage].
  @override
  State<ColorChangePage> createState() => _ColorChangePageState();
}

class _ColorChangePageState extends State<ColorChangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ColorChangeCubit, ColorChangeState>(
        listener: (_, state) {
          if (!state.hasError) return;
          _showErrorSnackBar();
        },
        builder: (context, state) {
          return Material(
            child: GestureDetector(
              onTap: () async {
                await context.read<ColorChangeCubit>().changeColor();
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
      ),
    );
  }

  void _showErrorSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text(_defaultErrorText)),
        backgroundColor: _errorBackgroundColor,
        duration: _errorShowingDuration,
      ),
    );
  }
}
