import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selector_wheel_value.freezed.dart';

@freezed
class SelectorWheelValue<T> with _$SelectorWheelValue<T> {
  const factory SelectorWheelValue({
    /// The string representation of the [value]. This
    /// is what will be displayed in the wheel.
    required String label,

    /// The value of the wheel item.
    required T value,

    /// The index of the wheel item.
    required int index,
  }) = _SelectorWheelValue<T>;
}
