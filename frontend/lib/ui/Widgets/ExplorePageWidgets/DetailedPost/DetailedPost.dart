import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'DetailedPostScrollableCard.dart';

class DetailedPost extends StatefulWidget {
  String id;
  String picture;

  DetailedPost({this.id, this.picture});

  @override
  _DetailedPostState createState() => _DetailedPostState();
}

class _DetailedPostState extends State<DetailedPost> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              child: Hero(
            tag: widget.id,
            child: CachedNetworkImage(
              imageUrl: widget.picture,
              fit: BoxFit.cover,
            ),
          )),
        ),
        DetailedPostScrollableCard(),
      ],
    ));
  }
}
