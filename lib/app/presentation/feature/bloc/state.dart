part of 'cubit.dart';

class ColorChangeState {
  final Color backgroundColor;
  final bool hasError;

  const ColorChangeState({
    required this.backgroundColor,
    this.hasError = false,
  });
}
