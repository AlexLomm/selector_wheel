import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:selector_wheel/selector_wheel/models/selector_wheel_value.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel_fixed_extent_scroll_physics.dart';
import 'package:selector_wheel/selector_wheel/selector_wheel_wheel.dart';

void main() {
  testWidgets(
      'SelectorWheelWheel renders correctly with provided width, height, childCount, and controller',
      (
    WidgetTester tester,
  ) async {
    const testWidth = 100.0;
    const testHeight = 50.0;
    const testChildCount = 5;

    final controller = FixedExtentScrollController();

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: SelectorWheelWheel<int>(
            width: testWidth,
            height: testHeight,
            childCount: testChildCount,
            controller: controller,
            convertIndexToValue: (int index) => SelectorWheelValue(
              label: index.toString(),
              value: index,
              index: index,
            ),
            onValueChanged: (SelectorWheelValue<int> value) {},
          ),
        ),
      ),
    );

    final selectorWheelWheelFinder = find.byType(SelectorWheelWheel<int>);
    expect(selectorWheelWheelFinder, findsOneWidget);

    final listWheelScrollViewFinder = find.byType(ListWheelScrollView);
    expect(listWheelScrollViewFinder, findsOneWidget);

    final sizedBoxFinder = find.ancestor(
      of: listWheelScrollViewFinder,
      matching: find.byType(SizedBox),
    );
    expect(sizedBoxFinder, findsOneWidget);

    final sizedBox = tester.widget<SizedBox>(sizedBoxFinder);
    expect(sizedBox.width, testWidth);

    final listWheelScrollView =
        tester.widget<ListWheelScrollView>(listWheelScrollViewFinder);
    expect(listWheelScrollView.itemExtent, testHeight);
    expect(listWheelScrollView.diameterRatio, 2.0);
    expect(listWheelScrollView.physics,
        isInstanceOf<SelectorWheelFixedExtentScrollPhysics>());

    final childBuilderDelegate =
        listWheelScrollView.childDelegate as ListWheelChildBuilderDelegate;
    expect(childBuilderDelegate.childCount, testChildCount);
  });

  testWidgets('SelectorWheelWheel calls onValueChanged callback on scroll end',
      (WidgetTester tester) async {
    const testWidth = 100.0;
    const testHeight = 50.0;
    const testChildCount = 5;

    final controller = FixedExtentScrollController();

    int? selectedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: SelectorWheelWheel<int>(
            width: testWidth,
            height: testHeight,
            childCount: testChildCount,
            controller: controller,
            convertIndexToValue: (int index) => SelectorWheelValue(
              label: index.toString(),
              value: index,
              index: index,
            ),
            onValueChanged: (SelectorWheelValue<int> value) {
              selectedValue = value.value;
            },
          ),
        ),
      ),
    );

    controller.jumpToItem(2);
    await tester.pumpAndSettle();

    expect(selectedValue, 2);
  });
}
