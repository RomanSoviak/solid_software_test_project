part of 'color_change_cubit.dart';

/// Represents the state of the [ColorChangeCubit].
///
/// Holds the current background color and an error flag.
class ColorChangeState {
  /// The background color to be displayed.
  final Color backgroundColor;

  /// Indicates whether an error occurred while changing the color.
  final bool hasError;

  /// Creates a state with [backgroundColor] and optional [hasError].
  const ColorChangeState({
    required this.backgroundColor,
    this.hasError = false,
  });
}
