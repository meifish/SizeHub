import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailedPost extends StatefulWidget {
  @override
  _DetailedPostState createState() => _DetailedPostState();
}

class _DetailedPostState extends State<DetailedPost> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Image.network(
                  'https://picsum.photos/id/206/2880/1800',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.1,
              maxChildSize: 0.8,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                    height: 1000,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            SizeWidget(typeSize: "Waist", size: "55cm"),
                            SizeWidget(typeSize: "Waist", size: "55cm"),
                          ],
                        )));
              },
            )
          ],
        ));
  }

  Widget SizeWidget({var typeSize, var size}) {
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
