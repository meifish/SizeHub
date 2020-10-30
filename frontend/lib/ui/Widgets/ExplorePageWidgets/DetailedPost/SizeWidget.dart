import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  String typeSize;
  String size;

  SizeWidget({@required this.typeSize, @required this.size});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: Color(0xFFACACAC)),
          children: [
            TextSpan(text: "$typeSize Size\n"),
            TextSpan(
              text: size,
              style: TextStyle(
                  color: Color(0xFF535353),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
