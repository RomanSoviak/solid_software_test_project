import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_software_test_project/app/presentation/feature/bloc/color_change_cubit.dart';
import 'package:solid_software_test_project/app/presentation/feature/color_change_page.dart';

// ignore: prefer_match_file_name
class FakeBlackColorChangedCubit extends ColorChangeCubit {
  FakeBlackColorChangedCubit() : super() {
    emit(const ColorChangeState(backgroundColor: Colors.black));
  }
}

void main() {
  testWidgets('New background color is different from the old one', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ColorChangeCubit>(
          create: (_) => ColorChangeCubit(),
          child: const ColorChangePage(),
        ),
      ),
    );

    final coloredBoxBefore = tester.widget<ColoredBox>(find.byType(ColoredBox));
    final initialColor = coloredBoxBefore.color;
    if (kDebugMode) {
      print('Initial background color: $initialColor');
    }

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    final coloredBoxAfter = tester.widget<ColoredBox>(find.byType(ColoredBox));
    final newColor = coloredBoxAfter.color;
    if (kDebugMode) {
      print('New background color after tap: $newColor');
    }

    expect(newColor, isNot(equals(initialColor)));
  });

  testWidgets('Text color is white when background is black', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ColorChangeCubit>(
          create: (_) => FakeBlackColorChangedCubit(),
          child: const ColorChangePage(),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('Hey there'));
    final textColor = textWidget.style?.color;
    if (kDebugMode) {
      print('Black background test: text color is $textColor');
    }
    expect(textColor, equals(Colors.white));
  });
}
