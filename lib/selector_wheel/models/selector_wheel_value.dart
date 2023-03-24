import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selector_wheel_value.freezed.dart';

@freezed
class SelectorWheelValue<T> with _$SelectorWheelValue<T> {
  const factory SelectorWheelValue({
    required String label,
    required T value,
    required int index,
  }) = _SelectorWheelValue<T>;
}
