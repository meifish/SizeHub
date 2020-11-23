import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Common/SubtleGradientOverlay.dart';

class SearchPageCategories extends StatelessWidget {
  const SearchPageCategories({
    this.icon,
    this.image,
    this.text,
    this.firstColor,
    this.secondColor,
  });

  final String image;
  final IconData icon;
  final String text;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(image),
          SubtleGradientOverlay(
            firstColor: firstColor,
            secondColor: secondColor,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Text(
                  text,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
