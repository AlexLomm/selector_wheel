import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel_highlight.dart';

void main() {
  testWidgets('SelectorWheelHighlight renders correctly with custom width, height, and borderRadius', (WidgetTester tester) async {
    const testWidth = 100.0;
    const testHeight = 50.0;
    const testBorderRadius = 10.0;

    await tester.pumpWidget(
       MaterialApp(
        home: Material(
          child: SelectorWheelHighlight(
            width: testWidth,
            height: testHeight,
            borderRadius: BorderRadius.circular(testBorderRadius),
          ),
        ),
      ),
    );

    final sizedBoxFinder = find.byType(SizedBox);
    expect(sizedBoxFinder, findsOneWidget);

    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
    expect(sizedBox.width, testWidth);
    expect(sizedBox.height, testHeight);

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final container = tester.widget<Container>(containerFinder);
    final BoxDecoration? decoration = container.decoration as BoxDecoration?;
    expect(decoration, isNotNull);
    expect(decoration!.color, isNotNull);
    expect(decoration.color, isInstanceOf<Color>());
    expect(decoration.borderRadius, BorderRadius.circular(testBorderRadius));
  });

  testWidgets('SelectorWheelHighlight uses correct color from theme', (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Theme(
            data: ThemeData(
              colorScheme: const ColorScheme.light().copyWith(
                secondaryContainer: testColor,
              ),
            ),
            child: SelectorWheelHighlight(
              width: 100,
              height: 50,
              borderRadius: BorderRadius.circular(8.0)
            ),
          ),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final container = tester.widget<Container>(containerFinder);
    final BoxDecoration? decoration = container.decoration as BoxDecoration?;
    expect(decoration, isNotNull);
    expect(decoration!.color, testColor);
  });
}
