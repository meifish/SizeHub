import 'package:flutter/material.dart';
import 'package:size_hub/data/UserMeasurementsData.dart';

import 'SizeWidget.dart';

class DetailedPostScrollableCardContent extends StatelessWidget {

  final UserMeasurementsData data;

  const DetailedPostScrollableCardContent({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizeWidget(typeSize: "Weight", size: "${data.weight}cm"),
                SizeWidget(typeSize: "Height", size: "${data.height}cm"),
              ],
            ),
          ],
        ));
  }
}
