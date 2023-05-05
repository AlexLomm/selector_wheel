import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/selector_wheel_value.dart';
import 'selector_wheel_fade_gradient.dart';
import 'selector_wheel_highlight.dart';
import 'selector_wheel_wheel.dart';

class SelectorWheel<T> extends StatefulWidget {
  /// The width of the wheel.
  ///
  /// @default 80.0
  final double width;

  /// The number of children in the wheel.
  final int? childCount;

  /// The height of the wheel's children.
  ///
  /// @default 36.0
  final double childHeight;

  /// If true, the wheel will vibrate lightly when the user scrolls.
  ///
  /// @default true
  final bool enableHapticFeedback;

  /// If true, the wheel will fade out at the top and bottom.
  ///
  /// Please note that this feature works only when the background
  /// of the wheel is a solid color. i.e the overridden
  /// `colorScheme.surface` color must be a solid color (with opacity
  /// of 1.0). If this is not the case, the fade out will be disabled
  /// automatically.
  ///
  /// @default true
  final bool enableFadeOut;

  /// The height percentage of the fade out at the top and bottom
  /// of the wheel. Must be a value between 0.0 and 1.0.
  ///
  /// @default 0.36
  final double fadeOutHeightFraction;

  /// Initially selected value of the wheel.
  final int? selectedItemIndex;

  /// Determines the logic of how an item with an index of "i" is
  /// appearing on the wheel.
  ///
  /// In other words, this function is responsible for converting
  /// an index to a value. Example:
  ///
  /// ```
  /// convertIndexToValue(0) // could return '0.25', or 'Foo', etc.
  /// ```
  final SelectorWheelValue<T> Function(int index) convertIndexToValue;

  /// onValueChanged is called when the user scrolls the wheel and
  /// the wheel stops on a new value.
  final void Function(SelectorWheelValue<T> value) onValueChanged;

  /// Selector wheel's highlighted area border radius.
  ///
  /// @default BorderRadius.circular(8.0)
  final BorderRadiusGeometry? highlightBorderRadius;

  /// Selector wheel's highlighted area height.
  ///
  /// @default [childHeight]
  final double? highlightHeight;

  /// Selector wheel's highlighted area width.
  ///
  /// @default [width]
  final double? highlightWidth;

  final double? perspective;

  final double? diameterRatio;

  const SelectorWheel({
    super.key,
    this.selectedItemIndex,
    this.width = 80.0,
    this.childCount,
    this.childHeight = 36.0,
    required this.convertIndexToValue,
    required this.onValueChanged,
    this.enableFadeOut = true,
    this.fadeOutHeightFraction = 0.36,
    this.enableHapticFeedback = true,
    this.highlightBorderRadius,
    this.highlightHeight,
    this.highlightWidth,
    this.perspective,
    this.diameterRatio,
  }) : assert(fadeOutHeightFraction >= 0.0 && fadeOutHeightFraction <= 1.0);

  @override
  State<SelectorWheel<T>> createState() => _SelectorWheelState<T>();
}

class _SelectorWheelState<T> extends State<SelectorWheel<T>> {
  late final FixedExtentScrollController _controller;

  late final StreamController<T> _streamController;

  @override
  void initState() {
    super.initState();

    _streamController = StreamController<T>.broadcast();

    _streamController.stream.distinct().listen(
      (value) {
        if (widget.enableHapticFeedback) HapticFeedback.lightImpact();
      },
    );

    _controller = FixedExtentScrollController()
      ..addListener(() => _streamController.sink
          .add(widget.convertIndexToValue(_controller.selectedItem).value));

    // if the selectedItemIndex is set, jump to it after the first frame
    if (widget.selectedItemIndex != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.jumpToItem(widget.selectedItemIndex!);
      });
    }
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedItemIndex != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.jumpToItem(widget.selectedItemIndex!);
      });
    }
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final surfaceColor = Theme.of(context).colorScheme.surface;

    final enableFadeOut = widget.enableFadeOut && surfaceColor.opacity == 1.0;

    final borderRadius =
        widget.highlightBorderRadius ?? BorderRadius.circular(8.0);

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SelectorWheelHighlight(
            height: widget.highlightHeight ?? widget.childHeight,
            width: widget.highlightWidth ?? widget.width,
            borderRadius: borderRadius,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SelectorWheelWheel(
            controller: _controller,
            childCount: widget.childCount,
            height: widget.childHeight,
            width: widget.width,
            convertIndexToValue: widget.convertIndexToValue,
            onValueChanged: widget.onValueChanged,
            perspective: widget.perspective,
            diameterRatio: widget.diameterRatio,
          ),
        ),
        if (enableFadeOut) ...[
          Align(
            alignment: Alignment.topCenter,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SelectorWheelFadeGradient(
                  height: constraints.maxHeight * widget.fadeOutHeightFraction,
                  width: widget.width,
                  color: surfaceColor,
                  direction: SelectorWheelFadeGradientDirection.toBottom,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SelectorWheelFadeGradient(
                  height: constraints.maxHeight * widget.fadeOutHeightFraction,
                  width: widget.width,
                  color: surfaceColor,
                  direction: SelectorWheelFadeGradientDirection.toTop,
                );
              },
            ),
          )
        ],
      ],
    );
  }
}
