import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/HomePageWidgets/Post/grouped_posts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupedPosts(),
    );
  }
}
