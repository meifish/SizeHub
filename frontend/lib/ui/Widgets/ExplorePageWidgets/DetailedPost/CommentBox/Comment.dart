import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/data/CommentData.dart';
import 'package:size_hub/ui/Widgets/Common/LikeButton.dart';

class Comment extends StatelessWidget {
  Comment(this.comment, {Key key}) : super(key: key);
  final CommentData comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider('https://images.lululemon.com/is/image/lululemon/LW9CT0S_0001_1?wid=1080&op_usm=0.5,2,10,0&fmt=webp&qlt=80,1&fit=constrain,0&op_sharpen=0&resMode=sharp2&iccEmbed=0&printRes=72'),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment.publicUserProfileData.user.username,
              textScaleFactor: 0.8,
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text(comment.comment)
        ],
      ),
      trailing: LikeButton(liked: true, likes: '24k'),
    );
  }
}
