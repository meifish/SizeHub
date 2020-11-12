import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'BodyShapeDialog.dart';

class DialogHelper {
  static open(context) {
    showDialog(
        context: context,
        builder: (context) {
          return BodyShapeDialog();
        });
  }
}
