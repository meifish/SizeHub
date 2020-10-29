import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/ui/animations/SlideInAnimation.dart';

class DetailedPost extends StatefulWidget {
  String id;
  String picture;

  DetailedPost({this.id, this.picture});

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
              child: Hero(
            tag: widget.id,
            child: CachedNetworkImage(
              imageUrl: widget.picture,
              fit: BoxFit.cover,
            ),
          )),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.2,
          minChildSize: 0.1,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
                controller: scrollController,

                  child: SlideInAnimation(
                    //duration: Duration(milliseconds: 1000),
                      offset: Offset(0,1000),
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizeWidget(
                                          typeSize: "Waist", size: "55cm"),
                                      SizeWidget(
                                          typeSize: "Waist", size: "55cm"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizeWidget(
                                          typeSize: "Waist", size: "55cm"),
                                      SizeWidget(
                                          typeSize: "Waist", size: "55cm"),
                                    ],
                                  )
                                ],
                              )))),
                );
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
