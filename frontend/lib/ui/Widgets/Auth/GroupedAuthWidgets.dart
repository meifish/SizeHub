import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Auth/BackgroundPainter.dart';
import 'package:size_hub/ui/Widgets/Auth/LoginCard.dart';

class GroupedAuthWidgets extends StatefulWidget {
  GroupedAuthWidgets({Key key}) : super(key: key);

  @override
  _GroupedAuthWidgetsState createState() => _GroupedAuthWidgetsState();
}

class _GroupedAuthWidgetsState extends State<GroupedAuthWidgets>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isRegister = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
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
      isRegister
          ? Align(
              alignment: Alignment(-0.8, -0.7),
              child: Text(
                'Sign in',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              ))
          : Align(
              alignment: Alignment(-0.8, -0.45),
              child: Text(
                'Welcome\n back',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              )),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment(0, 0.6),
          child: LoginCard(
            registerOnPressed: () {
              setState(() {
                isRegister = true;
              });
              _controller.forward(from: 0);
            },
            loginOnPressed: () {
              setState(() {
                isRegister = false;
              });
              _controller.reverse();
            },
            isRegister: isRegister,
          ),
        ),
      ),
    ]);
  }
}
