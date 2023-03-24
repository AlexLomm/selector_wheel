// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selector_wheel_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectorWheelValue<T> {
  /// The string representation of the [value]. This
  /// is what will be displayed in the wheel.
  String get label => throw _privateConstructorUsedError;

  /// The value of the wheel item.
  T get value => throw _privateConstructorUsedError;

  /// The index of the wheel item.
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectorWheelValueCopyWith<T, SelectorWheelValue<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectorWheelValueCopyWith<T, $Res> {
  factory $SelectorWheelValueCopyWith(SelectorWheelValue<T> value,
          $Res Function(SelectorWheelValue<T>) then) =
      _$SelectorWheelValueCopyWithImpl<T, $Res, SelectorWheelValue<T>>;
  @useResult
  $Res call({String label, T value, int index});
}

/// @nodoc
class _$SelectorWheelValueCopyWithImpl<T, $Res,
        $Val extends SelectorWheelValue<T>>
    implements $SelectorWheelValueCopyWith<T, $Res> {
  _$SelectorWheelValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = freezed,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectorWheelValueCopyWith<T, $Res>
    implements $SelectorWheelValueCopyWith<T, $Res> {
  factory _$$_SelectorWheelValueCopyWith(_$_SelectorWheelValue<T> value,
          $Res Function(_$_SelectorWheelValue<T>) then) =
      __$$_SelectorWheelValueCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String label, T value, int index});
}

/// @nodoc
class __$$_SelectorWheelValueCopyWithImpl<T, $Res>
    extends _$SelectorWheelValueCopyWithImpl<T, $Res, _$_SelectorWheelValue<T>>
    implements _$$_SelectorWheelValueCopyWith<T, $Res> {
  __$$_SelectorWheelValueCopyWithImpl(_$_SelectorWheelValue<T> _value,
      $Res Function(_$_SelectorWheelValue<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = freezed,
    Object? index = null,
  }) {
    return _then(_$_SelectorWheelValue<T>(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SelectorWheelValue<T>
    with DiagnosticableTreeMixin
    implements _SelectorWheelValue<T> {
  const _$_SelectorWheelValue(
      {required this.label, required this.value, required this.index});

  /// The string representation of the [value]. This
  /// is what will be displayed in the wheel.
  @override
  final String label;

  /// The value of the wheel item.
  @override
  final T value;

  /// The index of the wheel item.
  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectorWheelValue<$T>(label: $label, value: $value, index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectorWheelValue<$T>'))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectorWheelValue<T> &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, label, const DeepCollectionEquality().hash(value), index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectorWheelValueCopyWith<T, _$_SelectorWheelValue<T>> get copyWith =>
      __$$_SelectorWheelValueCopyWithImpl<T, _$_SelectorWheelValue<T>>(
          this, _$identity);
}

abstract class _SelectorWheelValue<T> implements SelectorWheelValue<T> {
  const factory _SelectorWheelValue(
      {required final String label,
      required final T value,
      required final int index}) = _$_SelectorWheelValue<T>;

  @override

  /// The string representation of the [value]. This
  /// is what will be displayed in the wheel.
  String get label;
  @override

  /// The value of the wheel item.
  T get value;
  @override

  /// The index of the wheel item.
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_SelectorWheelValueCopyWith<T, _$_SelectorWheelValue<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
