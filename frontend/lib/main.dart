import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:size_hub/AuthenticationWrapper.dart';
import 'package:size_hub/api/ApiClient.dart';
import 'package:size_hub/api/args/CreateCommentArgs.dart';
import 'package:size_hub/model/AuthenticationService.dart';
import 'package:size_hub/socket/TrendingPageSocketClient.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
              create: (_) => AuthenticationService(FirebaseAuth.instance)),
          StreamProvider(
              create: (context) =>
                  context.read<AuthenticationService>().authStateChanges)
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,

              //Input Field style
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.purple)),

              // Font Style
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                ),
              )),
          home: AuthenticationWrapper(),
        ));
  }
}
