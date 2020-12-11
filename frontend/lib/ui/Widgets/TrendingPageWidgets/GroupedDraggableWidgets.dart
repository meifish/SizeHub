import 'dart:math';
import 'package:flutter/material.dart';
import 'package:size_hub/data/PostPreviewData.dart';
import 'package:size_hub/socket/TrendingPageSocketClient.dart';
import 'package:size_hub/ui/Widgets/TrendingPageWidgets/DraggableWidget.dart';

class GroupedDraggableWidgets extends StatefulWidget {
  GroupedDraggableWidgets({Key key}) : super(key: key);

  @override
  _GroupedDraggableWidgetsState createState() =>
      _GroupedDraggableWidgetsState();
}

class _GroupedDraggableWidgetsState extends State<GroupedDraggableWidgets> {

  List<DraggableWidget> children = [];
  TrendingPageSocketClient client = TrendingPageSocketClient();

  @override
  void initState() {
    super.initState();

    client.onPost = (post){
      print("Received post!");
      addChild(post);
    };
  }

  void addChild(PostPreviewData post){
    setState(() {
      children.add(DraggableWidget(
        screenHeight: MediaQuery.of(context).size.height,
        screenWidth: MediaQuery.of(context).size.width,
        image: post.photoUrls.first,
        imageHeight: 150,
        uKey: generateRandomString(20),
      ));
    });
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: children
    );
  }
}
