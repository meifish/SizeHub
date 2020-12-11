import 'dart:async';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/data/UserMeasurementsData.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPost.dart';
import 'package:size_hub/ui/animations/BounceInAnimation.dart';

class DraggableWidget extends StatefulWidget {
  DraggableWidget(
      {this.image,
      this.imageHeight,
      this.screenWidth,
      this.screenHeight,
      this.uKey});

  final String image;
  final double imageHeight;
  final double screenHeight, screenWidth;
  final String uKey;

  @override
  _DraggableWidgetsStat createState() => _DraggableWidgetsStat();
}

class _DraggableWidgetsStat extends State<DraggableWidget> {
  Color color;
  double _dx = 0, _dy = 0;
  int speed;

  @override
  void initState() {
    _dx = Random()
        .nextInt((widget.screenWidth - widget.imageHeight).toInt())
        .toDouble();
    _dy = widget.screenHeight + widget.imageHeight;
    speed = Random().nextInt(10) + 10;
    new Timer.periodic(new Duration(milliseconds: speed), increase);
    super.initState();
  }

  void increase(Timer t) {
    if (mounted) {
      setState(() {
        if (_dy < -widget.imageHeight) {
          _dx = Random().nextInt((widget.screenWidth).toInt()).toDouble();
          _dy = widget.screenHeight;
          speed = Random().nextInt(40) + 10;
        }
        _dy--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _dy,
      left: _dx,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailedPost(id: widget.uKey, picture: widget.image,
                          //userMeasurementData: UserMeasurementsData(25, '25'),
                          photoUrls: [])));
        },
        onPanUpdate: (tapInfo) {
          setState(() {
            _dx += tapInfo.delta.dx;
            _dy += tapInfo.delta.dy;
          });
        },
        onPanEnd: (tapInfo) {
          setState(() {
            _dx = Curves.bounceIn.transform(_dx);
          });
        },
        child: BounceInAnimation(
          child: Hero(
            tag: widget.uKey,
            child: CachedNetworkImage(
              imageUrl: widget.image,
              height: widget.imageHeight,
            ),
          ),
        ),
      ),
    );
  }
}
