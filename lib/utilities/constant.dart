import 'package:flutter/material.dart';

String userKey = "";

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///space between  alignment [height]
Widget manualStepper({int step = 5}) {
  return SizedBox(height: step.toDouble());
}

///space between  alignment [width]
Widget manualSpacer({int step = 5}) {
  return SizedBox(width: step.toDouble());
}

ScrollPhysics physics = const BouncingScrollPhysics();

final ShapeBorder shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
const double elevation = 15;
