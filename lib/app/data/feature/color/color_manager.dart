import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _defaultColor = Colors.white;

/// Manages color persistence using shared preferences.
///
/// Provides methods to save and retrieve a color with a singleton instance
/// for global access.
class ColorManager {
  /// Singleton instance of [ColorManager].
  static final ColorManager instance = ColorManager._internal();
  static const String _colorKey = 'randomly_selected_color_key';

  SharedPreferences? _prefs;

  /// Private constructor for singleton pattern.
  ColorManager._internal();

  /// Initializes the [ColorManager] by loading [SharedPreferences].
  ///
  /// Must be called before using [saveColor] or [getSavedColor].
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Saves a [color] to persistent storage.
  ///
  /// The color is stored as an ARGB integer value using [SharedPreferences].
  Future<void> saveColor(Color color) async {
    await _prefs?.setInt(_colorKey, color.toARGB32());
  }

  /// Retrieves the saved color from persistent storage.
  ///
  /// Returns the saved [Color] if available, otherwise returns [_defaultColor].
  Color getSavedColor() {
    final colorValue = _prefs?.getInt(_colorKey);
    final savedColor = colorValue != null ? Color(colorValue) : _defaultColor;

    return savedColor;
  }
}
