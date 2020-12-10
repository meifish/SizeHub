import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  LikeButton({Key key, this.liked, this.likes, this.size = 40})
      : super(key: key);
  final bool liked;
  final String likes;
  final double size;

  @override
  _LikeButtonState createState() {
    return _LikeButtonState();
  }
}

class _LikeButtonState extends State<LikeButton> {
  String _animationName;
  bool _liked;

  @override
  void initState() {
    _liked = widget.liked;
    if (_liked)
      _animationName = 'Like';
    else
      _animationName = 'Unlike';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: widget.size,
          width: widget.size,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _liked = !_liked;
                if (_liked)
                  _animationName = 'Unlike';
                else
                  _animationName = 'Like';
              });
            },
            child: FlareActor(
              'assets/animations/Like.flr',
              animation: _animationName,
              fit: BoxFit.fill,
            ),
          ),
        ),
        widget.likes != null
            ? Text(
                widget.likes,
                textScaleFactor: 0.8,
                style: TextStyle(color: Colors.grey),
              )
            : Container()
      ],
    );
  }
}
