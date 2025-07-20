import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_software_test_project/app/data/feature/color/color_manager.dart';

part 'state.dart';

const int _maxRgbColorValue = 0xFFFFFF;

class ColorChangeCubit extends Cubit<ColorChangeState> {
  static final Color _savedColor = ColorManager.instance.getSavedColor();

  ColorChangeCubit() : super(ColorChangeState(backgroundColor: _savedColor));

  Future<void> changeColor() async {
    try {
      final randomColor = Color(
        (Random().nextDouble() * _maxRgbColorValue).toInt(),
      ).withValues(alpha: 1.0);

      await ColorManager.instance.saveColor(randomColor);

      emit(ColorChangeState(backgroundColor: randomColor));
    } catch (ex) {
      emit(ColorChangeState(backgroundColor: state.backgroundColor, hasError: true));
    }
  }
}
