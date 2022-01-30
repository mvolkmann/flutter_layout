import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  /// Wraps a widget in a Container that has a border.
  /// This is very useful for debugging.
  /// It is similar to the CSS property "outline: 1px solid red;".
  Widget border({Color color = Colors.red}) {
    return Container(
      child: this,
      decoration: BoxDecoration(border: Border.all(color: color)),
    );
  }

  /// Wraps a widget in a Padding with given padding on all sides.
  Widget padding(double size) {
    return Padding(child: this, padding: EdgeInsets.all(size));
  }
}
