import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:size_hub/ui/animations/bounce_in_animation.dart';
import 'package:size_hub/ui/animations/fade_in_animation.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: FadeInAnimation(
              child: Container(
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                      fontFamily: 'SnowburstOne',
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          startAnimation
              ? Flexible(
                  flex: 2,
                  child: FlareActor(
                    "assets/animations/FullLogo.flr",
                    animation: "animate",
                  ),
                )
              : Flexible(flex: 2, child: Container()),
          Flexible(
              child: BounceInAnimation(
            child: SizedBox(
                width: 250,
                child: RaisedButton(
                  child: Text('Login'),
                  color: Colors.purple,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.purple)),
                  onPressed: () {},
                )),
            delay: Duration(milliseconds: 2000),
          )),
          Flexible(
              child: BounceInAnimation(
            child: SizedBox(
                width: 250,
                child: FlatButton(
                  child: Text('Create Account'),
                  textColor: Colors.black,
                  onPressed: () {},
                )),
            delay: Duration(milliseconds: 2000),
          ))
        ],
      ),
    ));
  }
}
