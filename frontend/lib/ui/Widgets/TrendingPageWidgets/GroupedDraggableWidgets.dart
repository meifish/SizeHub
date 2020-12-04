import 'dart:math';
import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/TrendingPageWidgets/DraggableWidget.dart';

class GroupedDraggableWidgets extends StatefulWidget {
  GroupedDraggableWidgets({Key key}) : super(key: key);

  @override
  _GroupedDraggableWidgetsState createState() =>
      _GroupedDraggableWidgetsState();
}

class _GroupedDraggableWidgetsState extends State<GroupedDraggableWidgets> {
  List<String> imgPaths = [];

  @override
  void initState() {
    for (int i = 0; i < 50; i++) {
      imgPaths.add('https://picsum.photos/id/$i/200/300');
    }
    super.initState();
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
      children: imgPaths
          .map((img) => DraggableWidget(
                screenHeight: MediaQuery.of(context).size.height,
                screenWidth: MediaQuery.of(context).size.width,
                image: img,
                imageHeight: 150,
                uKey: generateRandomString(20),
              ))
          .toList(),
    );
  }
}
