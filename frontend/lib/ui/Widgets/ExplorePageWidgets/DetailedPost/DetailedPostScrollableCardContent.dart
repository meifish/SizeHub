import 'package:flutter/material.dart';
import 'package:size_hub/data/UserMeasurementData.dart';

import 'SizeWidget.dart';

class DetailedPostScrollableCardContent extends StatelessWidget {

  final UserMeasurementData data;

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
            Row(
              children: [
                SizeWidget(typeSize: "Waist", size: "55cm"),
                SizeWidget(typeSize: "Waist", size: "55cm"),
              ],
            )
          ],
        ));
  }
}
