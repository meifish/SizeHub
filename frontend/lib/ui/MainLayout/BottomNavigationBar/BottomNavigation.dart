import 'package:flutter/material.dart';
import 'BottomNavigationIconButton.dart';

class BottomNavigation extends StatefulWidget {
  final ValueChanged<int> onButtonClick;
  final List<BottomNavigationIconButton> iconButtons;

  BottomNavigation({this.onButtonClick, this.iconButtons});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;

  void _changeIndex(int index) {
    widget.onButtonClick(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> iconButtons =
        List.generate(widget.iconButtons.length, (int index) {
      return BottomNavigationIconButton().buildBottomNavigationIconButton(
          index: index,
          iconButton: widget.iconButtons[index],
          currentIndex: currentIndex,
          onPressed: _changeIndex);
    });
    iconButtons.insert(
        iconButtons.length >> 1, Expanded(child: SizedBox(height: 20)));
    return BottomAppBar(
      notchMargin: 4.0,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: iconButtons,
        ),
      ),
    );
  }
}
