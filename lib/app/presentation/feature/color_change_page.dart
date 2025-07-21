import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/app/presentation/feature/bloc/color_change_cubit.dart';

const _pageMainText = 'Hey there';
const _defaultErrorText = 'Something went wrong!';
const _mainTextFontSize = 24.0;
const _mainTextColor = Colors.black;

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
          final textColor = state.backgroundColor == Colors.black
              ? Colors.white
              : _mainTextColor;

          final mainText = Text(
            _pageMainText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: _mainTextFontSize,
              fontWeight: FontWeight.bold,
            ),
          );

          return GestureDetector(
            onTap: () async {
              await context.read<ColorChangeCubit>().changeColor();
            },
            child: ColoredBox(
              color: state.backgroundColor,
              child: Center(child: mainText),
            ),
          );
        },
      ),
    );
  }

  void _showErrorSnackBar() {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Center(child: Text(_defaultErrorText)),
          backgroundColor: _errorBackgroundColor,
          duration: _errorShowingDuration,
        ),
      );
  }
}
