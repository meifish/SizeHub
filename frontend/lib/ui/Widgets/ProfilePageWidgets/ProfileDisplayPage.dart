import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:size_hub/ui/Widgets/ProfilePageWidgets/ProfileInfoCard.dart';

class ProfileDisPlay extends StatefulWidget {
  @override
  _ProfileDisPlayState createState() => _ProfileDisPlayState();
}

class _ProfileDisPlayState extends State<ProfileDisPlay> {
  var dummpy_profile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ProfileInfoCard(profileMap: dummpy_profile);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future _loadProfile() async {
    final profileContent = await DefaultAssetBundle.of(context)
        .loadString('assets/data/FakeProfileData.json');

    final Map<String, dynamic> profileMap = jsonDecode(profileContent);
    dummpy_profile = profileMap;

    return 1;
  }
}
