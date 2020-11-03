import 'package:flutter/material.dart';

class BottomNavigationFAB extends StatelessWidget {
  final Widget child;

  BottomNavigationFAB({@required this.child});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'camera',
      onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => child));
      },
      child: Icon(
        Icons.camera_alt,
      ),
      backgroundColor: Colors.purple,
    );
  }
}
