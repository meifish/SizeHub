import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Auth/BackgroundPainter.dart';
import 'package:size_hub/ui/Widgets/Auth/LoginCard.dart';
import 'package:size_hub/ui/Widgets/Common/PurpleRaisedButton.dart';
import 'package:size_hub/ui/animations/BounceInAnimation.dart';

import 'SignUpCard.dart';

class GroupedAuthWidgets extends StatefulWidget {
  GroupedAuthWidgets({Key key, this.isRegister}) : super(key: key);
  final bool isRegister;

  @override
  _GroupedAuthWidgetsState createState() => _GroupedAuthWidgetsState();
}

class _GroupedAuthWidgetsState extends State<GroupedAuthWidgets>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _isRegister;
  PageController _pageViewController;
  Curve _curve = Curves.bounceIn;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    if (widget.isRegister) {
      _isRegister = true;
      _pageViewController = PageController(initialPage: 1);
      _controller.forward(from: 0);
    } else {
      _isRegister = false;
      _pageViewController = PageController(initialPage: 0);
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox.expand(
        child: CustomPaint(
          painter: BackgroundPainter(
              animation: _controller.view,
              firstColor: Colors.purple,
              secondColor: Colors.deepPurple),
        ),
      ),
      AnimatedContainer(
          transform: Transform.translate(
            offset: Offset(30, _isRegister ? 100 : 200),
          ).transform,
          duration: Duration(milliseconds: 250),
          child: Text(
            _isRegister ? "Sign up" : 'Welcome\n back',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
            textScaleFactor: 2,
          )),
      PageView(
        physics: new NeverScrollableScrollPhysics(),
        controller: _pageViewController,
        children: [_buildLogin(), _buildSignUp()],
      ),
      Positioned(
        bottom: 250,
        left: 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BounceInAnimation(
              child: PurpleRaisedButton(
                child: Text(!_isRegister ? "Login" : "Create Account"),
                onPressed: () {
                  setState(() {
                    print(emailController.text + " " + passwordController.text);
                  });
                },
              ),
              delay: Duration(milliseconds: 200),
            ),
            BounceInAnimation(
              child: FlatButton(
                child: Text(
                    _isRegister ? "Already Have an account" : "Create Account"),
                textColor: _isRegister ? Colors.white : Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                onPressed: () {
                  setState(() {
                    _isRegister = !_isRegister;
                    if (!_isRegister) {
                      _controller.reverse();
                      _pageViewController.animateToPage(0,
                          duration: Duration(milliseconds: 200), curve: _curve);
                    } else {
                      _controller.forward(from: 0);
                      _pageViewController.animateToPage(1,
                          duration: Duration(milliseconds: 200), curve: _curve);
                    }
                  });
                },
              ),
              delay: Duration(milliseconds: 300),
            )
          ],
        ),
      )
    ]);
  }

  Center _buildLogin() {
    return Center(
      child: LoginCard(
        emailController: emailController,
        passwordController: passwordController,
        onChangedEmail: (v) {},
        onChangedPassword: (v) {},
      ),
    );
  }

  Center _buildSignUp() {
    return Center(
      child: SignUpCard(
        emailController: emailController,
        passwordController: passwordController,
        onChangedEmail: (v) {
          print(v);
          setState(() {
            print(v);
          });
        },
        onChangedPassword: (v) {},
      ),
    );
  }
}
