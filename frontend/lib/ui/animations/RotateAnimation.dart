import 'package:flutter/material.dart';
import 'dart:math' show pi;

const Duration defaultDuration = Duration(seconds: 2);

class RotateAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  RotateAnimation(
      {@required this.child,
      this.duration = defaultDuration,
      this.delay = Duration.zero});

  @override
  _RotateAnimationState createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this);
    Future<void>.delayed(widget.delay).then((_) {
      if (mounted) {
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * pi * 2,
          child: child,
        );
      },
    );
  }
}
