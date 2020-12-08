import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  const Collection({
    this.image,
    this.text,
    this.firstColor,
    this.secondColor,
  });

  final String image;
  final String text;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          height: 250,
          width: 200,
        ),
        Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    firstColor.withOpacity(0.25),
                    secondColor.withOpacity(0.75),
                  ],
                  stops: [
                    0.0,
                    1.0
                  ])),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      text,
                      //textScaleFactor: 1.25,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
