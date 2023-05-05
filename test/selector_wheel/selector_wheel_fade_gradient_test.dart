import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel_fade_gradient.dart';

void main() {
  testWidgets(
      'SelectorWheelFadeGradient renders correctly for "toTop" direction',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: SelectorWheelFadeGradient(
            width: 100.0,
            height: 50.0,
            color: testColor,
            direction: SelectorWheelFadeGradientDirection.toTop,
          ),
        ),
      ),
    );

    final gradientContainerFinder = find.byType(Container);
    expect(gradientContainerFinder, findsOneWidget);

    final gradientContainer = tester.widget<Container>(gradientContainerFinder);
    final BoxDecoration? decoration =
        gradientContainer.decoration as BoxDecoration?;
    final LinearGradient? gradient = decoration?.gradient as LinearGradient?;

    expect(gradient, isNotNull);
    expect(gradient!.colors, [testColor, testColor.withOpacity(0.0)]);
    expect(gradient.begin, Alignment.bottomCenter);
    expect(gradient.end, Alignment.topCenter);
  });

  testWidgets(
      'SelectorWheelFadeGradient renders correctly for "toBottom" direction',
      (WidgetTester tester) async {
    const testColor = Colors.blue;

    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: SelectorWheelFadeGradient(
            width: 100.0,
            height: 50.0,
            color: testColor,
            direction: SelectorWheelFadeGradientDirection.toBottom,
          ),
        ),
      ),
    );

    final gradientContainerFinder = find.byType(Container);
    expect(gradientContainerFinder, findsOneWidget);

    final gradientContainer = tester.widget<Container>(gradientContainerFinder);
    final BoxDecoration? decoration =
        gradientContainer.decoration as BoxDecoration?;
    final LinearGradient? gradient = decoration?.gradient as LinearGradient?;

    expect(gradient, isNotNull);
    expect(gradient!.colors, [testColor, testColor.withOpacity(0.0)]);
    expect(gradient.begin, Alignment.topCenter);
    expect(gradient.end, Alignment.bottomCenter);
  });

  testWidgets('SelectorWheelFadeGradient has the correct width and height',
      (WidgetTester tester) async {
    const testWidth = 100.0;
    const testHeight = 50.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: Material(
          child: SelectorWheelFadeGradient(
            width: testWidth,
            height: testHeight,
            color: Colors.red,
            direction: SelectorWheelFadeGradientDirection.toTop,
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
}
