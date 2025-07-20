import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_software_test_project/app/presentation/feature/bloc/color_change_cubit.dart';
import 'package:solid_software_test_project/app/presentation/feature/color_change_page.dart';

void main() {
  testWidgets(
    'New background color is different from the old one and '
        'text is white on black background',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ColorChangeCubit>(
            create: (_) => ColorChangeCubit(),
            child: const ColorChangePage(),
          ),
        ),
      );

      final coloredBoxBefore = tester.widget<ColoredBox>(
        find.byType(ColoredBox),
      );
      final initialColor = coloredBoxBefore.color;

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      final coloredBoxAfter = tester.widget<ColoredBox>(
        find.byType(ColoredBox),
      );
      final newColor = coloredBoxAfter.color;

      expect(newColor, isNot(equals(initialColor)));

      if (newColor == Colors.black) {
        final textWidget = tester.widget<Text>(find.text('Hey there'));
        expect(textWidget.style?.color, equals(Colors.white));
      }
    },
  );
}
