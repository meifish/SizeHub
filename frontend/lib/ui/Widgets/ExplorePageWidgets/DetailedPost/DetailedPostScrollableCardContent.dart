import 'package:flutter/material.dart';

import 'SizeWidget.dart';

class DetailedPostScrollableCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizeWidget(typeSize: "Waist", size: "55cm"),
                SizeWidget(typeSize: "Waist", size: "55cm"),
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
