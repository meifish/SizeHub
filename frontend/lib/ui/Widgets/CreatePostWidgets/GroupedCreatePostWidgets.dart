import 'dart:io';
import 'package:flutter/material.dart';
import 'package:size_hub/data/database/Database.dart';
import 'package:size_hub/ui/MainLayout/MainLayout.dart';
import 'package:size_hub/ui/Widgets/Common/PurpleRaisedButton.dart';
import 'package:size_hub/ui/Widgets/CreatePostWidgets/CreatePostForm.dart';
import 'package:size_hub/ui/animations/BounceInAnimation.dart';

class GroupedCreatePostWidgets extends StatelessWidget {
  final String imgPath;

  GroupedCreatePostWidgets(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox.expand(
            child: InteractiveViewer(
                child: Image.file(
          File(imgPath),
          fit: BoxFit.cover,
        ))),
        BounceInAnimation(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: IntrinsicHeight(
                    child: Card(child: Center(child: CreatePostForm())))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 20),
          child: Align(
              alignment: Alignment.topRight,
              child: PurpleRaisedButton(
                onPressed: () {
                  Database().uploadFile(File(imgPath)).then((value) {
                    print(value);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainLayout()),
                    );
                  });
                },
                child: IntrinsicWidth(
                  child: Row(
                    children: [
                      Text('Submit'),
                      SizedBox(width: 10),
                      Icon(Icons.send),
                    ],
                  ),
                ),
              )),
        )
      ]),
    );
  }
}
