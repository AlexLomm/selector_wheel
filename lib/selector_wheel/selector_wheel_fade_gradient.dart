import 'package:flutter/material.dart';

enum SelectorWheelFadeGradientDirection { toTop, toBottom }

class SelectorWheelFadeGradient extends StatelessWidget {
  final double width;
  final double height;
  final SelectorWheelFadeGradientDirection direction;

  const SelectorWheelFadeGradient({
    Key? key,
    required this.width,
    required this.height,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final begin = direction == SelectorWheelFadeGradientDirection.toTop ? Alignment.bottomCenter : Alignment.topCenter;

    final end = direction == SelectorWheelFadeGradientDirection.toTop ? Alignment.topCenter : Alignment.bottomCenter;

    return IgnorePointer(
      child: SizedBox(
        width: width,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: begin,
              end: end,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.surface.withOpacity(0.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
