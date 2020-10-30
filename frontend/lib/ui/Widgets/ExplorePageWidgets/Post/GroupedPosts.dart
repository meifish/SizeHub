import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:size_hub/data/PostData.dart';

import 'PostWidget/PostWidget.dart';

class GroupedPosts extends StatefulWidget {
  GroupedPosts({Key key}) : super(key: key);

  @override
  _GroupedPostsState createState() => _GroupedPostsState();
}

class _GroupedPostsState extends State<GroupedPosts> {
  var posts = [];

  Future loadPostList() async {
    String content =
        await rootBundle.loadString('assets/data/FakeHomePageData.json');
    List collection = json.decode(content);
    List<PostData> _posts =
        collection.map((json) => PostData.fromJson(json)).toList();
    setState(() {
      posts = _posts;
    });
  }

  @override
  void initState() {
    loadPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        PostData post = posts[index];
        return PostWidget(id: post.id, userName: post.author, picture: post.picture);
      },
      staggeredTileBuilder: (index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
