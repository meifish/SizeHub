import 'package:flutter/material.dart';

class BottomNavigationFAB extends StatelessWidget {
  Widget child;

  BottomNavigationFAB({@required this.child});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
