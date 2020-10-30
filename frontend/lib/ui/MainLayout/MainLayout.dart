import 'package:flutter/material.dart';
import 'package:size_hub/ui/Pages/ExplorePage.dart';
import 'package:size_hub/ui/Pages/MapPage.dart';
import 'package:size_hub/ui/Pages/ProfilePage.dart';
import 'package:size_hub/ui/Pages/SearchPage.dart';
import 'BottomNavigationBar/BottomNavigation.dart';
import 'BottomNavigationBar/BottomNavigationFAB.dart';
import 'package:size_hub/ui/MainLayout/BottomNavigationBar/BottomNavigationIconButton.dart';

class MainLayout extends StatefulWidget {
  MainLayout({Key key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  List<Widget> _children = [
    ExplorePage(),
    SearchPage(),
    MapPage(),
    ProfilePage()
  ];

  void onIconButtonPress(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _children[_currentIndex],
      floatingActionButton: BottomNavigationFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigation(
        onButtonClick: onIconButtonPress,
        iconButtons: [
          BottomNavigationIconButton(icon: Icons.explore),
          BottomNavigationIconButton(icon: Icons.search),
          BottomNavigationIconButton(icon: Icons.map),
          BottomNavigationIconButton(
              icon: Icons.account_circle_sharp, hasNotification: true)
        ],
      ),
    );
  }
}
