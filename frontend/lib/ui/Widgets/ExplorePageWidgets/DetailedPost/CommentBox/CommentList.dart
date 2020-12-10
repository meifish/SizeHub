import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/CommentBox/Comment.dart';

class CommentList extends StatelessWidget {
  CommentList({Key key, this.data, this.onPressed}) : super(key: key);
  final data;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                'Comments',
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Comment(data[index]);
            }),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: onPressed)),
      ],
    );
  }
}
