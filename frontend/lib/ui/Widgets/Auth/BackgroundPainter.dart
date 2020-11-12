import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:size_hub/ui/Widgets/Common/Point.dart';

class BackgroundPainter extends CustomPainter {
  Paint firstPaint;
  Paint secondPaint;

  final Color firstColor;
  final Color secondColor;

  final Animation<double> animation;
  final Animation<double> liquidAnimation;

  Animation<double> firstAnimation;
  Animation<double> secondAnimation;

  BackgroundPainter({this.animation, this.firstColor, this.secondColor})
      : firstPaint = Paint()
          ..color = firstColor
          ..style = PaintingStyle.fill,
        secondPaint = Paint()
          ..color = secondColor
          ..style = PaintingStyle.fill,
        liquidAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeInBack,
        ),
        firstAnimation = CurvedAnimation(
          parent: animation,
          curve: BounceCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        secondAnimation = CurvedAnimation(
          parent: animation,
          curve: BounceCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    paintFirstColor(canvas, size);
    paintSecondColor(size, canvas);
  }

  void paintFirstColor(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, lerpDouble(0, size.height, firstAnimation.value));
    _addTargetPointsToBezierPath(
      path,
      [
        Point(
          lerpDouble(0, size.width / 3, firstAnimation.value),
          lerpDouble(0, size.height * 4 / 4, firstAnimation.value),
        ),
        Point(
          lerpDouble(size.width / 2, size.width * 2 / 2, liquidAnimation.value),
          lerpDouble(
              size.height / 2, size.height * 4 / 5, liquidAnimation.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 2, size.height / 2, liquidAnimation.value),
        ),
      ],
    );
    path.close();
    canvas.drawPath(path, firstPaint);
  }

  void paintSecondColor(Size size, Canvas canvas) {
    final path = Path();
    path.moveTo(size.width, 300);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(
        size.height / 4,
        size.height / 2,
        secondAnimation.value,
      ),
    );
    _addTargetPointsToBezierPath(
      path,
      [
        Point(
          size.width / 4,
          lerpDouble(
              size.height / 2, size.height * 2 / 4, liquidAnimation.value),
        ),
        Point(
          size.width * 2 / 4,
          lerpDouble(size.height / 6, size.height / 4, liquidAnimation.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 4, size.height / 4, secondAnimation.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 8, secondAnimation.value),
        ),
      ],
    );

    canvas.drawPath(path, secondPaint);
  }

  @override
  bool shouldRepaint(CustomPainter customPainter) {
    return true;
  }

  void _addTargetPointsToBezierPath(Path path, List<Point> targetPoints) {
    //, List<Point> controlPoints) {
    // if (targetPoints.length < 3) throw UnsupportedError('You need 3 points or more');
    for (int i = 0; i < targetPoints.length - 2; i++) {
      final controlX = (targetPoints[i].x + targetPoints[i + 1].x) / 2;
      final controlY = (targetPoints[i].y + targetPoints[i + 1].y) / 2;
      //path.quadraticBezierTo(controlPoints[i].x, controlPoints[i].y, targetPoints[i].x, targetPoints[i].y);
      path.quadraticBezierTo(
          targetPoints[i].x, targetPoints[i].y, controlX, controlY);
    }

    //   // this should connect the last points
    path.quadraticBezierTo(
        targetPoints[targetPoints.length - 2].x,
        targetPoints[targetPoints.length - 2].y,
        targetPoints[targetPoints.length - 1].x,
        targetPoints[targetPoints.length - 1].y);
  }
}

class BounceCurve extends Curve {
  final double amplitude;
  final double wave;

  BounceCurve({this.amplitude = 0.2, this.wave = 20});

  //Linearly interpolate between two numbers, a and b, by an extrapolation factor t. by using lerpDouble()
  double transformInternal(double t) {
    return (-(pow(e, -t / this.amplitude) * cos(t * this.wave)) + 1).toDouble();
    //return(1/pow(e, -t)).toDouble();
  }
}
