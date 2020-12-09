import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:size_hub/data/database/Database.dart';

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
              child: Image.file(
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: Colors.black,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print("IMAGE PATH: "+widget.imgPath);
                      Database().uploadFile(File(widget.imgPath)).then((value) => print("BOO YEA: "+value));
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
