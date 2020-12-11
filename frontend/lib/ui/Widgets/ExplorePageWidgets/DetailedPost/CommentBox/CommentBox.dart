import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:size_hub/api/ApiClient.dart';
import 'package:size_hub/api/args/CreateCommentArgs.dart';
import 'package:size_hub/data/CommentData.dart';
import 'package:size_hub/data/DetailedPostData.dart';
import 'package:size_hub/ui/Widgets/Common/ScrollableCard.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/CommentBox/CommentList.dart';
import 'package:size_hub/ui/animations/SlideInAnimation.dart';

class CommentBox extends StatefulWidget {
  CommentBox({Key key, this.onClose, this.comments, this.post})
      : super(key: key);
  final VoidCallback onClose;
  final List<CommentData> comments;
  final DetailedPostData post;

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ScrollableCard(
                child: CommentList(data: widget.comments, onPressed: widget.onClose),
                backgroundColor: Colors.grey[100])),
        SlideInAnimation(
          offset: Offset(0, 1000),
          child: TextField(
            controller: _commentController,
            cursorColor: Colors.black,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            decoration: InputDecoration(
                focusColor: Colors.black,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.add_comment,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    setState(() {
                      FirebaseAuth.instance.currentUser.getIdToken().then(
                              (token) =>
                              ApiClient().createComment(CreateCommentArgs(
                                  postId: widget.post.postId,
                                  token: token,
                                  comment: _commentController.text)).then((value) => print("VALUE "+ value.toString())));
                    });
                  },
                ),
                hintText: "Add a Comment",
                hintStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                filled: true,
                fillColor: Colors.white),
          ),
        )
      ],
    );
  }
}
