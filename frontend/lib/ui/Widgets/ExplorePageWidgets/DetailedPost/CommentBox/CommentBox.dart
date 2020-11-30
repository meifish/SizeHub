import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Common/ScrollableCard.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/CommentBox/CommentList.dart';

class CommentBox extends StatefulWidget {
  CommentBox({Key key}) : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  var fakeData = [
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
    return ScrollableCard(child: CommentList(data: fakeData));
  }
}
