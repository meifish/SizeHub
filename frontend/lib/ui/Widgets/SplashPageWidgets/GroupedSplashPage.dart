import 'package:flutter/material.dart';
import 'package:size_hub/ui/MainLayout/MainLayout.dart';
import 'package:size_hub/ui/Pages/LoginPage.dart';
import 'package:size_hub/ui/Widgets/Common/PurpleRaisedButton.dart';
import 'package:size_hub/ui/Widgets/FirebaseTest.dart';
import 'package:size_hub/ui/Widgets/SplashPageWidgets/SplashPageLogo.dart';
import 'package:size_hub/ui/animations/BounceInAnimation.dart';
import 'package:size_hub/ui/animations/FadeInAnimation.dart';

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
            child: PurpleRaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainLayout()),
                );
              },
            ),
          ),
          delay: Duration(milliseconds: 2000),
        )),
        Flexible(
            child: BounceInAnimation(
          child: SizedBox(
              width: 250,
              child: FlatButton(
                child: Text('Create Account'),
                textColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              )),
          delay: Duration(milliseconds: 2000),
        )),
      ],
    );
  }
}
