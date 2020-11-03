import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/CameraPageWidgets/GalleryView/ImageFileObject.dart';
import 'package:size_hub/ui/Widgets/CameraPageWidgets/PreviewImage.dart';
import 'package:storage_path/storage_path.dart';

class GalleryView extends StatefulWidget {
  dynamic controller;

  GalleryView(this.controller);

  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  List<FileObject> files;
  FileObject currentFileObject;

  getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    files = images.map<FileObject>((e) => FileObject.fromJson(e)).toList();
    if (files != null && files.length > 0)
      setState(() {
        currentFileObject = files[0];
      });
  }

  @override
  void initState() {
    getImagesPath();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            controller: widget.controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 4, mainAxisSpacing: 4),
            itemCount: currentFileObject.files.length,
            itemBuilder: (_, index) {
              var file = currentFileObject.files[index];
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreviewImage(
                                  imgPath: file,
                                )),
                      );
                    });
                  },
                  child: Image.file(
                    File(file),
                    fit: BoxFit.fitHeight,
                  ));
            }));
  }
}
