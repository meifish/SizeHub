import 'package:flutter/material.dart';
import 'dart:convert';

class GridPhotoDisplay extends StatefulWidget {
  @override
  _GridPhotoDisplayState createState() => _GridPhotoDisplayState();
}

class _GridPhotoDisplayState extends State<GridPhotoDisplay> {
  List<String> imgs_path = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
      children: [
        // Personal photos display
        for (int i = 0; i < imgs_path.length; i++)
          Container(
            height: MediaQuery.of(context).size.width / 3,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgs_path[i]), fit: BoxFit.cover),
              border: Border(
                bottom: BorderSide(
                    color: Colors.grey, width: 1, style: BorderStyle.solid),
                right: BorderSide(
                    color: Colors.grey.shade200,
                    width: 1,
                    style: BorderStyle.solid),
              ),
            ),
          )
      ],
    ));
  }

  Future _loadImages() async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('pictures/gallery'))
        .toList();

    setState(() {
      imgs_path = imagePaths;
      print(imgs_path);
    });
  }
}
