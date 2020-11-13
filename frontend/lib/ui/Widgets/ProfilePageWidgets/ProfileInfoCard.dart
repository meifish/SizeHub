import 'package:flutter/material.dart';
import 'package:size_hub/ui/Pages/ProfileEditPage.dart';
import 'package:size_hub/ui/Widgets/ProfilePageWidgets/TextInfoPaddingBox.dart';
import 'package:size_hub/ui/Widgets/ProfilePageWidgets/GridPhotoDisplay.dart';

class ProfileInfoCard extends StatelessWidget {
  var profileMap;
  ProfileInfoCard({this.profileMap});

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
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(profileMap["imgURL"]),
                          fit: BoxFit.cover)),
                ),
              ),

              Column(
                // Name-height-weight
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3),
                  // Name
                  textInfoPaddingBox(
                      text: profileMap["usrName"],
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      padding: 2.0),
                  // Height
                  Row(children: [
                    SizedBox(width: 5),
                    textInfoPaddingBox(text: "Height", padding: 2.0),
                    textInfoPaddingBox(
                        text: profileMap["height"], padding: 2.0),
                  ]),
                  // Weight
                  Row(children: [
                    SizedBox(width: 5),
                    textInfoPaddingBox(text: "Weight", padding: 2.0),
                    textInfoPaddingBox(
                        text: profileMap["weight"], padding: 2.0),
                  ]),
                  SizedBox(height: 2),
                  Row(children: [
                    SizedBox(width: 7),
                    InkWell(
                        child: Text(
                          "edit profile",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 10,
                              color: Colors.blue),
                        ),
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProfileEditPage.fromMap(profileMap)));
                        }),
                  ])
                ],
              ),
              Flexible(fit: FlexFit.tight, child: SizedBox()),
              // body shape
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
                  profileMap["introduction"] +
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
  }
}
