import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/TrendingPageWidgets/GroupedDraggableWidgets.dart';

class TrendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Positioned.fill(child: GroupedDraggableWidgets())],
    );
  }
}
