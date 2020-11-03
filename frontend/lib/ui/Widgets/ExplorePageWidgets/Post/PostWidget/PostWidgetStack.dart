import 'package:cached_network_image/cached_network_image.dart';
import 'package:size_hub/ui/Widgets/Common/SubtleGradientOverlay.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class PostWidgetStack extends StatelessWidget {
  const PostWidgetStack({
    Key key,
    @required this.id,
    @required this.picture,
    @required this.userName,
  }) : super(key: key);

  final String id;
  final String picture;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: FlareActor(
          'assets/animations/Loading.flr',
          animation: 'Loading',
          fit: BoxFit.contain,
        ),
      ),
      Hero(
          tag: id,
          child: FadeInImage(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            image: CachedNetworkImageProvider(picture),
            fit: BoxFit.cover,
            placeholder: NetworkImage(
                'https://assets.corusent.com/wp-content/uploads/2015/09/slider-transparent-placeholder.png'),
          )),
      SubtleGradientOverlay(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            userName,
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
    ]);
  }
}
