import 'package:flutter/material.dart';

import 'selector_wheel_fixed_extent_scroll_physics.dart';
import 'models/selector_wheel_value.dart';
import 'selector_wheel_child.dart';

class SelectorWheelWheel<T> extends StatelessWidget {
  final double width;
  final double height;
  final int? childCount;
  final FixedExtentScrollController controller;
  final SelectorWheelValue<T> Function(int index) convertIndexToValue;
  final void Function(SelectorWheelValue<T> value) onValueChanged;

  const SelectorWheelWheel({
    Key? key,
    required this.width,
    required this.height,
    required this.childCount,
    required this.controller,
    required this.convertIndexToValue,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            final index = controller.selectedItem;

            onValueChanged(convertIndexToValue(index));
          }

          return false;
        },
        child: ListWheelScrollView.useDelegate(
          controller: controller,
          itemExtent: height,
          perspective: 0.009,
          diameterRatio: 2.0,
          physics: const SelectorWheelFixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: childCount,
            builder: (context, index) {
              return SelectorWheelChild(
                width: width,
                height: height,
                value: convertIndexToValue(index).label,
              );
            },
          ),
        ),
      ),
    );
  }
}
