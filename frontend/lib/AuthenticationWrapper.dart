import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:size_hub/ui/MainLayout/MainLayout.dart';
import 'package:size_hub/ui/Pages/SplashPage.dart';

class AuthenticationWrapper extends StatelessWidget {
  AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MainLayout();
    }
    return SplashPage();
  }
}
