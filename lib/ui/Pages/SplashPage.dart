import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/SplashPageWidgets/grouped_splash_page.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupedSplashPage(),
    );
  }
}
