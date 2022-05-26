import 'package:flutter/material.dart';

void universalBottomSheet(
  BuildContext context, {
  Color backgroundColor,
  double elevation = 10,
  bool scrollable = false,
  Widget child,
  bool dismiss = true,
  double radiusLeft = 12,
  double radiusRight = 12,
}) {
  showModalBottomSheet<dynamic>(
    elevation: elevation,
    isDismissible: dismiss,
    isScrollControlled: scrollable,
    backgroundColor: Theme.of(context).cardTheme.color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radiusLeft),
        topRight: Radius.circular(radiusRight),
      ),
    ),
    context: context,
    builder: (context) {
      return child;
    },
  );
}

