import 'package:flutter/material.dart';

class RaisedPurpleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  RaisedPurpleButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: child,
        onPressed: onPressed,
        textColor: Colors.white,
        color: Colors.purple,
        splashColor: Colors.purpleAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
