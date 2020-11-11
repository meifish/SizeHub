import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/ProfilePageWidgets/GridPhotoDisplay.dart';
import 'package:size_hub/ui/Widgets/ProfilePageWidgets/TextInfoPaddingBox.dart';
import 'package:size_hub/data/profileData.dart';

class ProfileDisPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Row(
            // info card
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // photo

              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/pictures/profile/profile_pic.jpeg'),
                            fit: BoxFit.cover))),
                // child: CircleAvatar(
                //   radius: 50.0,
                //   backgroundImage:
                //       AssetImage('assets/pictures/profile/profile_pic.jpeg'),
                //   backgroundColor: Colors.transparent,
              ),

              Column(
                // Name-height-weight
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  textInfoPaddingBox(
                      text: ProfileData.profile.usrName,
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      padding: 2.0),
                  // Height
                  Row(children: [
                    SizedBox(width: 5),
                    textInfoPaddingBox(text: "Height", padding: 2.0),
                    textInfoPaddingBox(
                        text: ProfileData.profile.height, padding: 2.0),
                  ]),
                  // Weight
                  Row(children: [
                    SizedBox(width: 5),
                    textInfoPaddingBox(text: "Weight", padding: 2.0),
                    textInfoPaddingBox(
                        text: ProfileData.profile.weight, padding: 2.0),
                  ])
                ],
              ),
              Flexible(fit: FlexFit.tight, child: SizedBox()),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 120,
                  width: 55,
                  child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Image.asset(
                          'assets/pictures/bodyshape/womanRectangle.jpg')),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: [
            textInfoPaddingBox(
              text: "\" " +
                  ProfileData.profile.introduction +
                  " and say something really really long and longer and longer \"",
              padding: [
                20.0,
                10.0,
                20.0,
                10.0,
              ],
              center: true,
            ),
          ],
        ),
        SizedBox(height: 20),
        GridPhotoDisplay(),
      ],
    );
    ;
  }
}
