import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:size_hub/api/ApiClient.dart';
import 'package:size_hub/data/CreatePostData.dart';
import 'package:size_hub/data/PostLocationData.dart';
import 'package:size_hub/data/UserMeasurementsData.dart';
import 'package:size_hub/data/database/Database.dart';
import 'package:size_hub/ui/MainLayout/MainLayout.dart';
import 'package:size_hub/ui/Widgets/Common/PurpleRaisedButton.dart';
import 'package:size_hub/ui/Widgets/CreatePostWidgets/CreatePostForm.dart';
import 'package:size_hub/ui/animations/BounceInAnimation.dart';

class GroupedCreatePostWidgets extends StatefulWidget {
  final String imgPath;

  GroupedCreatePostWidgets(this.imgPath);

  @override
  _GroupedCreatePostWidgetsState createState() =>
      _GroupedCreatePostWidgetsState();
}

class _GroupedCreatePostWidgetsState extends State<GroupedCreatePostWidgets> {
  var _geolocator = Geolocator()..forceAndroidLocationManager = true;
  LatLng _currentLatLng;
  var _cityName;
  TextEditingController clothingNameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _updateLocationOneTime() {
    _geolocator
        .getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    )
        .then((Position userLocation) {
      setState(() {
        _currentLatLng = LatLng(userLocation.latitude, userLocation.longitude);
        print(_currentLatLng);
        Geocoder.local
            .findAddressesFromCoordinates(
                Coordinates(_currentLatLng.latitude, _currentLatLng.longitude))
            .then((value) => _cityName = value.first.locality);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _geolocator
        .checkGeolocationPermissionStatus()
        .then((GeolocationStatus status) {
      print('Geolocation status: $status');
    });

    return Scaffold(
      body: Stack(children: [
        SizedBox.expand(
            child: InteractiveViewer(
                child: Image.file(
          File(widget.imgPath),
          fit: BoxFit.cover,
        ))),
        BounceInAnimation(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: IntrinsicHeight(
                    child: Card(
                        child: Center(
                            child: CreatePostForm(
                  clothingNameController: clothingNameController,
                  brandController: brandController,
                  captionController: captionController,
                  sizeController: sizeController,
                  weightController: weightController,
                  heightController: heightController,
                ))))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 20),
          child: Align(
              alignment: Alignment.topRight,
              child: PurpleRaisedButton(
                onPressed: () {
                  _updateLocationOneTime();
                  Database().uploadFile(File(widget.imgPath)).then((value) {
                    FirebaseAuth.instance.currentUser.getIdToken().then(
                        (token) => ApiClient()
                            .createPost(CreatePostData(
                                null,
                                sizeController.text,
                                UserMeasurementsData(
                                    int.parse(weightController.text),
                                    heightController.text),
                                [value],
                                PostLocationData(_currentLatLng.latitude,
                                    _currentLatLng.longitude, _cityName),
                                captionController.text,
                                token))
                            .then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainLayout()),
                                )));
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
