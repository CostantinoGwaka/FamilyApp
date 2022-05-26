import 'package:flutter/material.dart';

class UniversalButton extends StatelessWidget {
  final double radius;
  final VoidCallback action;
  final double scale;
  final Widget child;
  final FontWeight weight;
  final double elevation;
  final double size;
  final Color color;
  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final double spacing;
  const UniversalButton({
    Key key,
    @required this.action,
    this.radius = 5.0,
    this.elevation = 0,
    @required this.buttonColor,
    this.spacing = 1,
    @required this.child,
    this.buttonHeight = 40,
    @required this.buttonWidth,
    this.color = Colors.white,
    this.size = 12,
    this.scale = 1,
    this.weight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(

        key: key,
        style: ElevatedButton.styleFrom(
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: elevation,
          primary: buttonColor,
        ),
        onPressed: () => action(),
        child: child,
      ),
    );
  }
}
