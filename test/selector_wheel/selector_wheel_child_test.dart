import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel_child.dart';

void main() {
  testWidgets('SelectorWheelChild displays the given value', (WidgetTester tester) async {
    const testValue = '42';
    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: SelectorWheelChild(
            width: 100.0,
            height: 50.0,
            value: testValue,
          ),
        ),
      ),
    );

    final textFinder = find.text(testValue);
    expect(textFinder, findsOneWidget);
  });

  testWidgets('SelectorWheelChild has the correct width and height', (WidgetTester tester) async {
    const testWidth = 100.0;
    const testHeight = 50.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: SelectorWheelChild(
            width: testWidth,
            height: testHeight,
            value: 'Test',
          ),
        ),
      ),
    );

    final sizedBoxFinder = find.byType(SizedBox);
    expect(sizedBoxFinder, findsOneWidget);

    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
    expect(sizedBox.width, testWidth);
    expect(sizedBox.height, testHeight);
  });

  testWidgets('SelectorWheelChild has the correct text style', (WidgetTester tester) async {
    const testValue = '42';

    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: SelectorWheelChild(
            width: 100.0,
            height: 50.0,
            value: testValue,
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text(testValue));
    expect(textWidget.style, isNotNull);

    final BuildContext context = tester.element(find.byType(SelectorWheelChild));
    final ThemeData theme = Theme.of(context);
    final TextStyle? textStyle = theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface);

    expect(textWidget.style, textStyle);
  });
}
