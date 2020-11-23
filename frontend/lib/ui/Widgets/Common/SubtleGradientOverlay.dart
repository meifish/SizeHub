import 'package:flutter/material.dart';

class SubtleGradientOverlay extends StatelessWidget {
  const SubtleGradientOverlay({
    Key key,
    this.firstColor=Colors.grey,
    this.secondColor=Colors.black,
  }) : super(key: key);
  final Color firstColor;
  final Color secondColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  firstColor.withOpacity(0.0),
                  secondColor.withOpacity(0.75),
                ],
                stops: [
                  0.0,
                  1.0
                ])));
  }
}
