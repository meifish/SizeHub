import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:size_hub/data/UserMeasurementsData.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/CommentBox/CommentBox.dart';
import 'DetailedPostScrollableCard.dart';

class DetailedPost extends StatefulWidget {
  final String id;
  final String picture;
  final UserMeasurementsData userMeasurementData;
  final List<String> photoUrls;

  const DetailedPost(
      {Key key,
      this.id,
      this.picture,
      this.userMeasurementData,
      this.photoUrls})
      : super(key: key);

  @override
  _DetailedPostState createState() => _DetailedPostState();
}

class _DetailedPostState extends State<DetailedPost> {
  bool _isCommentBoxOpen = false;

  @override
  void initState() {
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
          userMeasurementData: widget.userMeasurementData,
          photoUrls: widget.photoUrls,
          onCommentBoxPressed: () =>
              setState(() => _isCommentBoxOpen = !_isCommentBoxOpen),
        ),
        _isCommentBoxOpen
            ? CommentBox(
                onClose: () => setState(() => _isCommentBoxOpen = false),
              )
            : Container()
      ],
    ));
  }
}
