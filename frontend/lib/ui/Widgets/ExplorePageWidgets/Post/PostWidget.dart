import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPost.dart';

class PostWidget extends StatelessWidget {
  final String userName;
  final String picture;
  final String id;

  PostWidget({
    this.userName,
    this.picture,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedPost(
                    id: id,
                    picture: picture,
                  )),
        )
      },
      child: Card(
          elevation: 8.0,
          child: Stack(children: [
            Center(
              child: FlareActor('assets/animations/Loading.flr',animation: 'Loading', fit: BoxFit.contain,),
            ),
            Expanded(child:Hero(
                tag: id,
                child: FadeInImage(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  image: CachedNetworkImageProvider(picture),
                  fit: BoxFit.cover,
                  placeholder: NetworkImage(
                      'https://assets.corusent.com/wp-content/uploads/2015/09/slider-transparent-placeholder.png'),
                ))
            )])),
    );
  }
}
