import 'package:flutter/material.dart';
import 'package:size_hub/data/DetailedPostData.dart';
import 'package:size_hub/ui/Widgets/Common/ScrollableCard.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPostScrollableCardContent.dart';

class DetailedPostScrollableCard extends StatelessWidget {
  final List<String> photoUrls;
  final VoidCallback onCommentBoxPressed;
  final DetailedPostData post;

  const DetailedPostScrollableCard(
      {Key key, this.post, this.photoUrls, this.onCommentBoxPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableCard(
        child: DetailedPostScrollableCardContent(
      photoUrls: photoUrls,
      post: post,
      onCommentButtonPressed: onCommentBoxPressed,
    ));
  }
}
