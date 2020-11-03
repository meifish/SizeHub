import 'package:flutter/material.dart';
import 'package:size_hub/ui/animations/SlideInAnimation.dart';

import 'GalleryView.dart';

class GalleryViewScrollableSheet extends StatelessWidget {
  final VoidCallback onPressed;

  GalleryViewScrollableSheet({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SlideInAnimation(
        offset: Offset(0, 1000),
        child: DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.1,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Stack(children: [
                  GalleryView(scrollController),
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: onPressed))
                ]),
              );
            }));
  }
}
