import 'package:flutter/material.dart';

class BottomNavigationIconButton {
  final IconData icon;
  final bool hasNotification;
  final String text;

  BottomNavigationIconButton(
      {this.icon, this.text, this.hasNotification = false});

  Widget buildBottomNavigationIconButton(
      {int index,
      BottomNavigationIconButton iconButton,
      ValueChanged<int> onPressed,
      int currentIndex}) {
    return Expanded(
        child: GestureDetector(
      onTap: () => onPressed(index),
      child: iconButton.hasNotification
          ? Align(
              alignment: Alignment.center,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Tooltip(
                    message: iconButton.text,
                    child: Icon(
                      iconButton.icon,
                      color:
                          currentIndex == index ? Colors.purple : Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Icon(
                      Icons.brightness_1,
                      color: Colors.red[800],
                      size: 10,
                    ),
                  )
                ],
              ),
            )
          : Tooltip(
              message: iconButton.text,
              child: Icon(iconButton.icon,
                  color: currentIndex == index ? Colors.purple : Colors.grey),
            ),
    ));
  }
}
