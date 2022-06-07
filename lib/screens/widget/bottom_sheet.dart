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

void universalWithStateDialog(BuildContext context,
    {Widget title,
    Widget body,
    bool dismiss = false,
    bool showSecondButton = true,
    bool showThirdButton = false,
    String thirdButtonLabel,
    Function thirdButtonPressed,
    Function buttonPressed,
    String buttonLabel,
    Color colors,
    double elevation,
    double radius,
    double buttonWidth,
    double buttonHeight,
    ValueKey valueKey,
    ButtonStyle buttonStyle,
    TextStyle style,
    BorderSide borderSide,
    ShapeBorder shapeBorder,
    GlobalKey key}) {
  showDialog(
      context: context,
      barrierDismissible: dismiss,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return AlertDialog(
            title: title,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            content: body,
            actions: [],
          );
        });
      });
}
