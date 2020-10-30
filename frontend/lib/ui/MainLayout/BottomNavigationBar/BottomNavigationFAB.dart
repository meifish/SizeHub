import 'package:flutter/material.dart';
import 'package:size_hub/ui/Pages/CameraPage.dart';

class BottomNavigationFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
      },
      child: Icon(
        Icons.camera_alt,
      ),
      backgroundColor: Colors.purple,
    );
  }
}
