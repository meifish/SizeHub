import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:size_hub/ui/Widgets/CreatePostWidgets/GroupedCreatePostWidgets.dart';

class PreviewImage extends StatefulWidget {
  final String imgPath;

  PreviewImage({this.imgPath});

  @override
  _PreviewImageState createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  Future<ByteData> getBytesFromFile() async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync();
    return ByteData.view(bytes.buffer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Hero(
                  tag: widget.imgPath,
                  child: InteractiveViewer(
                    child: Image.file(
                      File(widget.imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: Colors.black,
                child: Align(

                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.arrowRight,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>
                          GroupedCreatePostWidgets(widget.imgPath)));


                      // getBytesFromFile().then((bytes) {
                      //   Share.file('Share via', basename(widget.imgPath),
                      //       bytes.buffer.asUint8List(), 'image/path');
                      // });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
