import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/data/PublicUserProfileData.dart';
import 'package:size_hub/ui/Pages/ProfileEditPage.dart';
import 'package:size_hub/ui/Widgets/ExplorePageWidgets/DetailedPost/SizeWidget.dart';

class ProfileCard extends StatelessWidget {

  final PublicUserProfileData profile;
  final dummyData;
  ProfileCard({Key key, this.profile, this.dummyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(profile);
    return Stack(
      overflow: Overflow.visible,
      children: [
        Card(
          color: Colors.white,
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileEditPage(existingUserMap: dummyData,)),
                          );
                    },
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    profile.user.username,
                    textScaleFactor: 1.5,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Ontario, Canada'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizeWidget(typeSize: "Followers", size: "24k"),
                      SizeWidget(typeSize: "Likes", size: "24k"),
                      SizeWidget(typeSize: "Comments", size: "24k"),
                    ],
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 150,
                child: Align(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            'https://images.lululemon.com/is/image/lululemon/LW9CZVS_032493_1?wid=1080&op_usm=0.5,2,10,0&fmt=webp&qlt=90,1&fit=constrain,0&op_sharpen=0&resMode=sharp2&iccEmbed=0&printRes=72')),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
