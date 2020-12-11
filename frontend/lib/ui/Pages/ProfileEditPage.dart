import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ProfilePageWidgets/ProfileEditForm.dart';

class ProfileEditPage extends StatelessWidget {
  var existingUserMap;
  ProfileEditPage({this.existingUserMap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileEditForm.fromMap(existingUserMap),
    );
  }
}

