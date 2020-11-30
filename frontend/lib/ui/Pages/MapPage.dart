import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/CommentBox/CommentBox.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPostScrollableCard.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
         // child: CommentBox(),
        ),
        CommentBox(),
      ],
    );
  }
}
