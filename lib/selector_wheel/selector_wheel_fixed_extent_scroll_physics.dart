import 'package:flutter/material.dart';

class SelectorWheelFixedExtentScrollPhysics extends FixedExtentScrollPhysics {
  const SelectorWheelFixedExtentScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  SpringDescription get spring {
    return const SpringDescription(
      mass: 20,
      stiffness: 300,
      damping: 1.0,
    );
  }

  @override
  SelectorWheelFixedExtentScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SelectorWheelFixedExtentScrollPhysics(parent: buildParent(ancestor));
  }
}
