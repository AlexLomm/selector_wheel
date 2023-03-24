import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel_child.dart';

void main() {
  group('SelectorWheelChild', () {
    testWidgets('displays the provided value', (WidgetTester tester) async {
      const String testValue = 'Test Value';

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SelectorWheelChild(
            width: 100,
            height: 100,
            value: testValue,
          ),
        ),
      ));

      expect(find.text(testValue), findsOneWidget);
    });

    testWidgets('uses provided width and height', (WidgetTester tester) async {
      const double testWidth = 200;
      const double testHeight = 150;

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SelectorWheelChild(
            width: testWidth,
            height: testHeight,
            value: 'Test',
          ),
        ),
      ));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, testWidth);
      expect(sizedBox.height, testHeight);
    });

    testWidgets('uses correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SelectorWheelChild(
            width: 100,
            height: 100,
            value: 'Test',
          ),
        ),
      ));

      final text = tester.widget<Text>(find.byType(Text));
      final textStyle = text.style;

      final theme = Theme.of(tester.element(find.byType(SelectorWheelChild)));
      final expectedTextStyle = theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.onSurface,
      );

      expect(textStyle, expectedTextStyle);
    });
  });
}
