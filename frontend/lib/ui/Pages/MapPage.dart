import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:size_hub/ui/Widgets/MapPageWidgets/MapDisplay.dart';
import 'package:size_hub/ui/Widgets/MapPageWidgets/Location.dart';
import 'package:size_hub/data/database/Database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Database _database;
  var _geolocator = Geolocator();
  List<Location> imgLoc = [];

  Location currentLocation;

  @override
  void initState() {
    _database = Database();
    _readLocFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _geolocator
        .checkGeolocationPermissionStatus()
        .then((GeolocationStatus status) {
      print('Geolocation status: $status');
    });

    return Scaffold(
        body: Map(
      currentLocation: currentLocation,
      imgLocs: imgLoc,
    ));
  }

  void _updatelocation() {
    Location location_info;

    // Obtain current latlong
    _geolocator
        .getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    )
        .then((Position userlocation) {
      // Obtain the location information provided latlong
      _geolocator
          .placemarkFromCoordinates(
              userlocation.latitude, userlocation.longitude)
          .then((List<Placemark> places) {
        location_info = Location(
            city: places[0].name,
            imgURL: null,
            latlng: LatLng(
                places[0].position.latitude, places[0].position.longitude));

        setState(() {
          currentLocation = location_info;
          print("new loc obtained");
          print("new loc" + location_info.city);
        });
      });
    });
  }

  _readLocFromFirebase() async {
    QuerySnapshot returnLocImg = await _database.getPostLoc();
    print("receive data from fb");

    for (int i = 0; i < returnLocImg.docs.length; i++) {
      var doc = returnLocImg.docs[i];
      String city = doc.data()["city"];
      LatLng cityLatLng;

      await _geolocator
          .placemarkFromAddress(city)
          .then((List<Placemark> places) {
        print('Forward geocoding results:');
        cityLatLng =
            LatLng(places[0].position.latitude, places[0].position.longitude);
      });

      Location loc = Location(
          city: city, imgURL: doc.data()["imgURL"], latlng: cityLatLng);
      print("cityLatLng: " + cityLatLng.toString());

      setState(() {
        imgLoc.add(loc);
      });
    }
  }
}
