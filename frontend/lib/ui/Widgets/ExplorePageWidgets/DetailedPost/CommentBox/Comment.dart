import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Common/LikeButton.dart';

class Comment extends StatelessWidget {
  Comment(this.comment, {Key key}) : super(key: key);
  final comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(comment['profilePic']),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment['name'],
              textScaleFactor: 0.8,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(comment['comment'])
        ],
      ),
      trailing: LikeButton(liked: comment['like'], likes: comment['likes']),
    );
  }
}
