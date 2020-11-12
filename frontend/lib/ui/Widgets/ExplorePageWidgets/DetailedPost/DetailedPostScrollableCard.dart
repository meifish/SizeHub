import 'package:flutter/material.dart';
import 'package:size_hub/data/UserMeasurementData.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPostScrollableCardContent.dart';
import 'package:size_hub/ui/animations/SlideInAnimation.dart';

class DetailedPostScrollableCard extends StatelessWidget {

  final UserMeasurementData data;

  const DetailedPostScrollableCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.1,
      maxChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: SlideInAnimation(
              offset: Offset(0, 1000),
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
                  child: DetailedPostScrollableCardContent(data: data,))),
        );
      },
    );
  }
}
