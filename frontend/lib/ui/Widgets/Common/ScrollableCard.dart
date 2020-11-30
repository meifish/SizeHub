import 'package:flutter/material.dart';
import 'package:size_hub/ui/animations/SlideInAnimation.dart';

class ScrollableCard extends StatelessWidget {
  final Widget child;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final double radius;
  final Color backgroundColor;

  const ScrollableCard(
      {Key key,
      @required this.child,
      this.backgroundColor = Colors.white,
      this.initialChildSize = 0.2,
      this.minChildSize = 0.1,
      this.maxChildSize = 1,
      this.radius = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: SlideInAnimation(
              offset: Offset(0, 1000),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                  ),
                  child: child)),
        );
      },
    );
  }
}
