import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:size_hub/api/ApiClient.dart';
import 'package:size_hub/data/CommentData.dart';
import 'package:size_hub/data/DetailedPostData.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/CommentBox/CommentBox.dart';
import 'DetailedPostScrollableCard.dart';

class DetailedPost extends StatefulWidget {
  final String id;
  final String picture;
  final List<String> photoUrls;
  final DetailedPostData post;

  const DetailedPost(
      {Key key, this.id, this.post, this.picture, this.photoUrls})
      : super(key: key);

  @override
  _DetailedPostState createState() => _DetailedPostState();
}

class _DetailedPostState extends State<DetailedPost> {
  bool _isCommentBoxOpen = false;
  List<CommentData> commentData;
  @override
  void initState() {
    ApiClient().getReplies(widget.post.postId).then((value) => commentData=value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
              child: Hero(
            tag: widget.id,
            child: InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: widget.picture,
                fit: BoxFit.cover,
              ),
            ),
          )),
        ),
        DetailedPostScrollableCard(
          post: widget.post,
          photoUrls: widget.photoUrls,
          onCommentBoxPressed: () =>
              setState(() => _isCommentBoxOpen = !_isCommentBoxOpen),
        ),
        _isCommentBoxOpen
            ? CommentBox(
          comments: commentData,
                post: widget.post,
                onClose: () => setState(() => _isCommentBoxOpen = false),
              )
            : Container()
      ],
    ));
  }
}
