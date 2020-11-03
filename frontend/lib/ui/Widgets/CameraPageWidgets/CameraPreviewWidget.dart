import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/ui/animations/SlideInAnimation.dart';

class CameraPreviewWidget extends StatelessWidget {

  final CameraController controller;
  const CameraPreviewWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return SlideInAnimation(
      offset: Offset(0, 1000),
      duration: Duration(milliseconds: 500),
        child: AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    ));
  }
}
