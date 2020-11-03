// Implementing the camera code was helped from the youtube channel Dev Planet.
import 'dart:convert';
import 'dart:io';

import 'package:size_hub/ui/Widgets/CameraPageWidgets/GalleryView/GalleryViewScrollableSheet.dart';
import 'package:size_hub/ui/animations/RotateAnimation.dart';
import 'package:size_hub/ui/animations/SlideInAnimation.dart';
import 'package:storage_path/storage_path.dart';

import 'package:size_hub/ui/Widgets/CameraPageWidgets/GalleryView/ImageFileObject.dart';
import 'PreviewImage.dart';
import 'package:path/path.dart';
import 'CameraPreviewWidget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController controller;
  List cameras;
  int selectedCameraIndex;
  String imgPath;
  bool viewImages = false;
  String defaultImage;

  getFirstImagesPath() async {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    var files = images.map<FileObject>((e) => FileObject.fromJson(e)).toList();
    if (files != null && files.length > 0)
      setState(() {
        defaultImage = files[0].files[0];
      });
  }

  @override
  void initState() {
    super.initState();
    getFirstImagesPath();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
      } else {
        print('No camera available');
      }
    }).catchError((err) {
      print(err);
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) await controller.dispose();
    controller = CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }
    if (mounted) setState(() {});
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  void _onCapturePressed(context) async {
    try {
      final path =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
      await controller.takePicture(path);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PreviewImage(
                  imgPath: path,
                )),
      );
    } catch (e) {
      print(e);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    _initCameraController(selectedCamera);
  }

  Widget _cameraControlWidget(context) {
    return FloatingActionButton(
      heroTag: 'camera',
      child: RotateAnimation(
        rotateDirection: RotateDirection.right,
        duration: Duration(milliseconds: 500),
        child: Icon(
          Icons.camera,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      onPressed: () {
        _onCapturePressed(context);
      },
    );
  }

  Widget _cameraToggleRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return SlideInAnimation(
      duration: Duration(milliseconds: 500),
      offset: Offset(-100, 100),
      child: FlatButton.icon(
        onPressed: _onSwitchCamera,
        icon: Icon(
          _getCameraLensIcon(lensDirection),
          color: Colors.white,
          size: 24,
        ),
        label: Text(
          '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _galleryPreview() {
    return SlideInAnimation(
      duration: Duration(milliseconds: 500),
      offset: Offset(100, 100),
      child: InkWell(
          onTap: () {
            setState(() {
              viewImages = true;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Image.file(
              File(defaultImage),
              fit: BoxFit.scaleDown,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: CameraPreviewWidget(controller: controller),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _cameraToggleRowWidget(),
                      Padding( padding: EdgeInsets.only(right: 40),child: _cameraControlWidget(context)),
                      _galleryPreview(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        viewImages
            ? GalleryViewScrollableSheet(
                onPressed: () {
                  setState(() {
                    viewImages = false;
                  });
                },
              )
            : Container()
      ]),
    );
  }
}
