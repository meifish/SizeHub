import 'package:flutter/material.dart';
import 'package:size_hub/ui/Pages/SplashPage.dart';

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
