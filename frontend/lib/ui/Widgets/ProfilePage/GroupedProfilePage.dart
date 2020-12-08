import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Common/Point.dart';
import 'package:size_hub/ui/Widgets/ProfilePage/ProfileCard.dart';
import 'package:size_hub/ui/Widgets/ProfilePage/ProfilePictureGrid.dart';

import 'Collection.dart';
import 'ProfileCardAppBar.dart';

class GroupedProfilePageWidgets extends StatefulWidget {
  GroupedProfilePageWidgets({Key key}) : super(key: key);

  @override
  _GroupedProfilePageWidgetsState createState() =>
      _GroupedProfilePageWidgetsState();
}

class _GroupedProfilePageWidgetsState extends State<GroupedProfilePageWidgets> {
  var imgPaths;

  Future _loadImages() async {
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('pictures/gallery'))
        .toList();

    setState(() {
      imgPaths = imagePaths;
    });
  }

  @override
  void initState() {
    _loadImages();
    super.initState();
  }

  Widget _profilePictureGrid = ProfilePictureGrid(
    images: [],
    point: Point(0,0),
  );

  Widget _getCollection({image, firstColor, secondColor, text}) {
    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        setState(() {
          _profilePictureGrid = _getProfilePictureGrid(image,
              Point(details.globalPosition.dx, details.globalPosition.dy));
        });
      },
      child: Collection(
        image: image,
        firstColor: firstColor,
        secondColor: secondColor,
        text: text,
      ),
    );
  }

  ProfilePictureGrid _getProfilePictureGrid(images, point) {
    return ProfilePictureGrid(
      point: point,
      images: imgPaths,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      _getCollection(
          image:
              'https://images.lululemon.com/is/image/lululemon/LW1CVGS_046707_1?wid=1080&op_usm=0.5,2,10,0&fmt=webp&qlt=90,1&fit=constrain,0&op_sharpen=0&resMode=sharp2&iccEmbed=0&printRes=72',
          firstColor: Colors.purpleAccent,
          secondColor: Colors.purple,
          text: 'Most Recent'),
      _getCollection(
          image:
              'https://images.lululemon.com/is/image/lululemon/LW1CVDS_040694_2?wid=1080&op_usm=0.5,2,10,0&fmt=webp&qlt=90,1&fit=constrain,0&op_sharpen=0&resMode=sharp2&iccEmbed=0&printRes=72',
          firstColor: Colors.redAccent,
          secondColor: Colors.red,
          text: 'Most Favoured'),
      _getCollection(
          image:
              'https://images.lululemon.com/is/image/lululemon/LW3DUTS_029610_2?wid=1080&op_usm=0.5,2,10,0&fmt=webp&qlt=90,1&fit=constrain,0&op_sharpen=0&resMode=sharp2&iccEmbed=0&printRes=72',
          firstColor: Colors.greenAccent,
          secondColor: Colors.green,
          text: 'Most Commented'),
    ];
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: false,
          floating: false,
          delegate: ProfileCardAppBar(
            height: 200,
            coverPhoto:
                "https://static.wikia.nocookie.net/kpop/images/9/9c/TWICE_Better_group_concept_photo_3.png/revision/latest?cb=20201005130428",
            child: ProfileCard(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Collections',
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(children: [
              for (var i = 0; i < children.length; i++) ...[
                children[i],
                if (i != children.length - 1) SizedBox(width: 10),
              ],
            ]),
          ),
        )),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Posts',
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _profilePictureGrid
      ],
    );
  }
}
