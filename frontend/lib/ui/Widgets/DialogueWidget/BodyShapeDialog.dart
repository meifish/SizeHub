import 'package:flutter/material.dart';

class BodyShapeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) {
    return Container(
        height: 500,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/pictures/bodyshape/female_all.jpg',
                    height: 350)),
            SizedBox(height: 10),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK I got it.')),
          ],
        ));
  }
}
