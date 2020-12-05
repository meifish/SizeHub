import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileCardAppBar extends SliverPersistentHeaderDelegate {
  final double height;
  final String coverPhoto;
  final Widget child;

  ProfileCardAppBar(
      {@required this.height, @required this.coverPhoto, @required this.child});

  @override
  double get maxExtent => height + height / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = height - shrinkOffset;
    final cardPosition = height / 2 - shrinkOffset;
    final cardProportion = 2 - (height / size);
    final cardSize =
        cardProportion < 0 || cardProportion > 1 ? 0.0 : cardProportion;
    return SizedBox(
      height: height + height / 2,
      child: Stack(
        children: [
          SizedBox(
            height: size < kToolbarHeight ? kToolbarHeight : size,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: CachedNetworkImage(
                imageUrl: coverPhoto,
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: cardPosition > 0 ? cardPosition : 0,
            bottom: 0,
            child: Opacity(
              opacity: cardSize,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30 * cardSize),
                  child: child),
            ),
          ),
        ],
      ),
    );
  }
}
