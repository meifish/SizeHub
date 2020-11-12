import 'package:size_hub/ui/Widgets/ExplorePageWidgets/Post/PostWidget/PostWidgetStack.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPost.dart';

class PostWidget extends StatelessWidget {
  final Future<String> userName;
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
          child: PostWidgetStack(id: id, picture: picture, userName: userName)),
    );
  }
}
