import 'package:flutter/material.dart';
import '../../data/temp/flutterfire.dart';

class FirebaseTest extends StatefulWidget {
  FirebaseTest({Key key}) : super(key: key);

  @override
  _FirebaseTestState createState() {
    return _FirebaseTestState();
  }
}

class _FirebaseTestState extends State<FirebaseTest> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Test\n"
            "It only prints to console", textAlign: TextAlign.center,),
      ),
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RaisedButton(
            child: Text('Create'),
            onPressed: () async {
              await create();
            }),
        RaisedButton(
            child: Text('Read'),
            onPressed: () async {
              await read();
            }),
        RaisedButton(
            child: Text('Update'),
            onPressed: () async {
              await update();
            }),
        RaisedButton(
            child: Text('Delete'),
            onPressed: () async {
              await delete();
            }),
      ],
    )));
  }
}
