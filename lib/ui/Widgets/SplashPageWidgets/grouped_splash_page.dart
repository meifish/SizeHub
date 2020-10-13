import 'package:flutter/material.dart';
import 'package:size_hub/ui/Pages/HomePage.dart';
import 'package:size_hub/ui/Widgets/SplashPageWidgets/splash_page_logo.dart';
import 'package:size_hub/ui/animations/bounce_in_animation.dart';
import 'package:size_hub/ui/animations/fade_in_animation.dart';

class GroupedSplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        SplashPageLogo(),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
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
    );
  }
}
