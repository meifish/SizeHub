import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SplashPageLogo extends StatefulWidget {
  SplashPageLogo({Key key}) : super(key: key);

  @override
  _SplashPageLogoState createState() => _SplashPageLogoState();
}

class _SplashPageLogoState extends State<SplashPageLogo> {
  bool startAnimation = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        startAnimation = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return startAnimation
        ? Flexible(
            flex: 2,
            child: FlareActor(
              "assets/animations/FullLogo.flr",
              animation: "animate",
            ),
          )
        : Flexible(flex: 2, child: Container());
  }
}
