import 'package:flutter/material.dart';

class PurpleRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double elevation;

  PurpleRaisedButton({this.child, this.onPressed, this.elevation = 2});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: child,
        onPressed: onPressed,
        textColor: Colors.white,
        color: Colors.purple,
        splashColor: Colors.purpleAccent,
        elevation: elevation,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)));
  }
}
