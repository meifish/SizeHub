import 'package:flutter/material.dart';

class SubtleGradientOverlay extends StatelessWidget {
  const SubtleGradientOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.black.withOpacity(0.75),
                ],
                stops: [
                  0.0,
                  1.0
                ])));
  }
}
