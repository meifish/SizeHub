import 'package:flutter/material.dart';
import 'package:size_hub/ui/Pages/SplashPage.dart';
import 'package:size_hub/ui/Pages/ProfileEditPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,

          // Button style
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.purple,
              textTheme: ButtonTextTheme.accent,
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(secondary: Colors.white),
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.purple))),

          //Input Field style
          inputDecorationTheme:
              InputDecorationTheme(labelStyle: TextStyle(color: Colors.purple)),

          // Font Style
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
            ),
          )),
      home: SplashPage(),
    );
  }
}
