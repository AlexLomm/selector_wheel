import 'package:flutter/material.dart';
import 'package:selector_wheel/selector_wheel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ----------------------------------------------
              // Example 1, regular selector wheel
              // ----------------------------------------------
              _Background(
                child: SelectorWheel(
                  childCount: 10,
                  convertIndexToValue: (int index) {
                    return SelectorWheelValue(
                      label: index.toString(),
                      value: index,
                      index: index,
                    );
                  },
                  onValueChanged: (SelectorWheelValue<int> value) {
                    // ignore: avoid_print
                    print(value);
                  },
                ),
              ),
              const SizedBox(height: 32.0),
              // ----------------------------------------------
              // Example 2, overriding the colors of the selector wheel
              // ----------------------------------------------
              Theme(
                // Overriding the colors of the selector wheel
                data: ThemeData(
                  textTheme: Theme.of(context).textTheme.copyWith(
                        titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        surface: Colors.black,
                        onSurface: Colors.white,
                        secondaryContainer: Colors.purple,
                      ),
                ),
                child: _Background(
                  child: SelectorWheel(
                    childCount: 10,
                    childHeight: 48.0,
                    highlightBorderRadius: BorderRadius.circular(32.0),
                    highlightHeight: 48.0,
                    highlightWidth: 120.0,
                    fadeOutHeightFraction: 0.33,
                    convertIndexToValue: (int index) {
                      final fraction = index / 4;
                      final value = '${fraction.toStringAsFixed(2)} lb';

                      return SelectorWheelValue(label: value, value: fraction, index: index);
                    },
                    onValueChanged: (value) {
                      // ignore: avoid_print
                      print(value);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              // ----------------------------------------------
              // Example 3, customized wheel selectors displayed side by side
              // ----------------------------------------------
              _Background(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                              secondaryContainer: Colors.amber,
                            ),
                      ),
                      child: SelectorWheel(
                        width: 60.0,
                        childCount: 10,
                        highlightBorderRadius: BorderRadius.circular(4.0),
                        convertIndexToValue: (int index) {
                          final value = index * 5;

                          return SelectorWheelValue(
                            label: value.toString(),
                            value: value,
                            index: index,
                          );
                        },
                        onValueChanged: (SelectorWheelValue<int> value) {
                          // ignore: avoid_print
                          print(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 32.0,
                      child: Text(
                        '✕',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        textTheme: Theme.of(context).textTheme.copyWith(
                              titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                              // surface: Colors.black,
                              // onSurface: Colors.white,
                              secondaryContainer: Colors.lime,
                            ),
                      ),
                      child: SelectorWheel(
                        width: 60.0,
                        childCount: 4,
                        highlightBorderRadius: BorderRadius.circular(4),
                        convertIndexToValue: (int index) {
                          const fruits = ['🍇', '🍍', '🍒', '🥥', '🍓', '🥭', '🍈'];

                          final value = fruits[index];

                          return SelectorWheelValue(label: value, value: value, index: index);
                        },
                        onValueChanged: (SelectorWheelValue<String> value) {
                          // ignore: avoid_print
                          print(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final Widget child;

  const _Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: child,
    );
  }
}
