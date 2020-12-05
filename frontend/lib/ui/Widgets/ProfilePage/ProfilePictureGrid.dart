import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Common/Point.dart';

class ProfilePictureGrid extends StatefulWidget {
  ProfilePictureGrid({Key key, this.point, this.images}) : super(key: key);
  final Point point;
  final List<String> images;

  @override
  _ProfilePictureGridState createState() => _ProfilePictureGridState();
}

class _ProfilePictureGridState extends State<ProfilePictureGrid>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  final Duration delay = Duration.zero;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = CurveTween(curve: Curves.easeInCubic).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.point.y);
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 2,
        crossAxisSpacing: 10.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) =>
                Transform.translate(
              offset: Offset(
                  ((index % 3) * -132 - 100 + widget.point.x) *
                      (1 - _animation.value),
                  ((index / 3) * -33 -
                          MediaQuery.of(context).size.height /2+
                          widget.point.y) *
                      (1 - _animation.value)),
              child: child,
            ),
            child: Image.asset(widget.images[index]),
          );
        },
        childCount: widget.images.length,
      ),
    );
  }

  @override
  void didUpdateWidget(ProfilePictureGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    this._controller.forward(from: 0);
  }
}
