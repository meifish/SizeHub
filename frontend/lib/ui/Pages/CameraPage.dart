import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:size_hub/ui/Widgets/CameraPageWidgets/Camera.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return Scaffold(
      body: Camera(),
    );
  }
}
