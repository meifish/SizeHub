import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/Post/GroupedPosts.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupedPosts(),
    );
  }
}
