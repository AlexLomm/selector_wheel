import 'package:flutter/material.dart';

class SelectorWheelChild extends StatelessWidget {
  final double width;
  final double height;
  final String value;

  const SelectorWheelChild({
    super.key,
    required this.width,
    required this.height,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: Text(
          value,
          softWrap: false,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
