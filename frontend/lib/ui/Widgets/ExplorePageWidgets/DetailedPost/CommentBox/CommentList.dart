import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/CommentBox/Comment.dart';

class CommentList extends StatelessWidget {
  CommentList({Key key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Comment(data[index]);
            }),
      ],
    );
  }
}
