import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _defaultColor = Colors.white;

class ColorManager {
  static final ColorManager instance = ColorManager._internal();
  static const String _colorKey = 'randomly_selected_color_key';

  SharedPreferences? _prefs;

  ColorManager._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveColor(Color color) async {
    await _prefs?.setInt(_colorKey, color.toARGB32());
  }

  Color getSavedColor() {
    final colorValue = _prefs?.getInt(_colorKey);
    final savedColor = colorValue != null ? Color(colorValue) : _defaultColor;

    return savedColor;
  }
}
