import 'package:flutter/material.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace({double height}) {
    return SizedBox(height: height);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace({double width}) {
    return SizedBox(width: width);
  }

  static double deviceHeigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget emptySizedBox() {
    return const SizedBox();
  }
}
