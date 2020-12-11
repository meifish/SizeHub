import 'package:size_hub/data/DetailedPostData.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/Post/PostWidget/PostWidgetStack.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPost.dart';

class PostWidget extends StatelessWidget {
  final String userName;
  final String picture;
  final String id;
  final String postId;
  final List<String> photoUrls;
  final DetailedPostData post;

  const PostWidget(
      {Key key,
      this.userName,
      this.picture,
      this.id,
      this.postId,
      this.post,
      this.photoUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedPost(
                  id: id, picture: picture, photoUrls: photoUrls, post: post)),
        )
      },
      child: Card(
          elevation: 8.0,
          child: PostWidgetStack(id: id, picture: picture, userName: userName)),
    );
  }
}
