import 'package:size_hub/data/UserMeasurementsData.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/Post/PostWidget/PostWidgetStack.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/DetailedPost.dart';

class PostWidget extends StatelessWidget {
  final Future<String> userName;
  final String picture;
  final String id;
  final UserMeasurementsData userMeasurementData;
  final List<String> photoUrls;

  const PostWidget(
      {Key key,
      this.userName,
      this.picture,
      this.id,
      this.userMeasurementData,
      this.photoUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedPost(
                  id: id,
                  picture: picture,
                  userMeasurementData: userMeasurementData,
                  photoUrls: photoUrls)),
        )
      },
      child: Card(
          elevation: 8.0,
          child: PostWidgetStack(id: id, picture: picture, userName: userName)),
    );
  }
}
