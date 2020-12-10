import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Common/ScrollableCard.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/CommentBox/CommentList.dart';
import 'package:size_hub/ui/animations/SlideInAnimation.dart';

class CommentBox extends StatelessWidget {
  CommentBox({Key key, this.onClose}) : super(key: key);
  final VoidCallback onClose;
  final fakeData = [
    {
      "name": "Joe",
      "profilePic":
          "https://images.lululemon.com/is/image/lululemon/LW9CZVS_032493_1?wid=1080&op_usm=0.5,2,10,0&fmt=webp&qlt=90,1&fit=constrain,0&op_sharpen=0&resMode=sharp2&iccEmbed=0&printRes=72",
      "comment": "YE GOOD",
      "like": true,
      "likes": '25k'
    },
    {
      "name": "Kyle",
      "profilePic":
          "https://images.lululemon.com/is/image/lululemon/LW9CWWS_030437_1?wid=1080&op_usm=0.5,2,10,0&fmt=webp&qlt=90,1&fit=constrain,0&op_sharpen=0&resMode=sharp2&iccEmbed=0&printRes=72",
      "comment": "I Dont like",
      "like": false,
      "likes": '25k'
    },
    {
      "name": "Janice",
      "profilePic":
          "https://images.lululemon.com/is/image/lululemon/LW9DGES_032493_1?wid=1080&op_usm=0.5,2,10,0&fmt=webp&qlt=90,1&fit=constrain,0&op_sharpen=0&resMode=sharp2&iccEmbed=0&printRes=72",
      "comment": "FAKE",
      "like": true,
      "likes": '25k'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ScrollableCard(
                child: CommentList(data: fakeData, onPressed: onClose),
                backgroundColor: Colors.grey[100])),
        SlideInAnimation(
          offset: Offset(0, 1000),
          child: TextField(
            cursorColor: Colors.black,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            decoration: InputDecoration(
                focusColor: Colors.black,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.add_comment,
                  color: Colors.black,
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
