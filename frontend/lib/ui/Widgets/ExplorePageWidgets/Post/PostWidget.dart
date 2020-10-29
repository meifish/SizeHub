import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPost.dart';

class PostWidget extends StatelessWidget {
  final String userName;
  final String picture;

  PostWidget({
    this.userName,
    this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailedPost()),
        )
      },
      child: Card(
          elevation: 8.0,
          child: new FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: CachedNetworkImageProvider(picture),
            fit: BoxFit.cover,
            placeholder: AssetImage("assets/pictures/logo.jpg"),
          )),
    );
  }
}
