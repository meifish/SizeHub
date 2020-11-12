import 'package:flutter/material.dart';

class textInfoPaddingBox extends StatelessWidget {
  String text;
  TextStyle textStyle;
  bool center;
  var padding;
  var edgetinset;

  textInfoPaddingBox(
      {this.text, this.textStyle, this.padding, this.center = false}) {
    if (this.padding is List) {
      this.edgetinset = EdgeInsets.fromLTRB(
          this.padding[0], this.padding[1], this.padding[2], this.padding[3]);
    } else {
      this.edgetinset = EdgeInsets.all(this.padding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.edgetinset,
      child: Text(text,
          style: textStyle ?? Theme.of(context).textTheme.bodyText1,
          textAlign: center ? TextAlign.center : TextAlign.left),
    );
  }
}
