import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/app/data/feature/color/color_manager.dart';

part 'color_change_state.dart';

const int _maxRgbColorValue = 0xFFFFFF;

/// Manages the state for changing the background color in the app.
///
/// Uses a [ColorManager] to save and retrieve colors, emitting new states
/// with updated colors or error status.
class ColorChangeCubit extends Cubit<ColorChangeState> {
  /// The initial color retrieved from [ColorManager].
  static final Color _savedColor = ColorManager.instance.getSavedColor();

  /// Creates a [ColorChangeCubit] with the initial background color.
  ColorChangeCubit() : super(ColorChangeState(backgroundColor: _savedColor));

  /// Generates a random color, saves it, and updates the state.
  ///
  /// Emits a new [ColorChangeState] with the random color on success or
  /// sets [ColorChangeState.hasError] to true if an error occurs.
  Future<void> changeColor() async {
    try {
      final randomColor = Color(
        (Random().nextDouble() * _maxRgbColorValue).toInt(),
      ).withValues(alpha: 1.0);

      await ColorManager.instance.saveColor(randomColor);

      emit(ColorChangeState(backgroundColor: randomColor));
    } catch (ex) {
      emit(
        ColorChangeState(
          backgroundColor: state.backgroundColor,
          hasError: true,
        ),
      );
    }
  }
}
