import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String url;
  final VoidCallback onPressed;

  const SocialIcon({
    Key key,
    this.url,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          shape: BoxShape.circle,
        ),
        child: Image.network(
          url,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
