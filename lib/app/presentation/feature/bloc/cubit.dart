import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ColorChangeCubit extends Cubit<ColorChangeState> {
  ColorChangeCubit()
    : super(const ColorChangeState(backgroundColor: Colors.white));

  void changeColor() {
    final randomColor = Color(
      (Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withValues(alpha: 1.0);

    emit(ColorChangeState(backgroundColor: randomColor));
  }
}
