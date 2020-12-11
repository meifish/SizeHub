import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/data/DetailedPostData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:size_hub/ui/Widgets/Common/LikeButton.dart';

class DetailedPostScrollableCardContent extends StatelessWidget {
  final List<String> photoUrls;
  final VoidCallback onCommentButtonPressed;
  final DetailedPostData post;

  const DetailedPostScrollableCardContent(
      {Key key, this.post, this.photoUrls, this.onCommentButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Lululemon',
                    textScaleFactor: 4,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/en/thumb/2/22/Lululemon_Athletica_logo.svg/600px-Lululemon_Athletica_logo.svg.png'),
                    radius: 35,
                  ),
                ]),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  post.clothingItem.name,
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 50, width: 50, child: LikeButton(liked: true)),
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Colors.black,
                ),
                onPressed: onCommentButtonPressed,
              )
            ],
          ),
          SizedBox(height: 10),

          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(post.caption),
                ),
                SizedBox(
                  height: 10,
                ),
                post.userMeasurementsData == null
                    ? Text("No Measurement Provided with this Post")
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          {
                            'icon': FontAwesomeIcons.rulerVertical,
                            'text':
                                'Height ${post.userMeasurementsData.height.toString()}'
                          },
                          {
                            'icon': FontAwesomeIcons.tshirt,
                            'text': 'Size ${post.clothingItemSize}'
                          },
                          {
                            'icon': FontAwesomeIcons.rulerHorizontal,
                            'text':
                                'Weight ${post.userMeasurementsData.weight.toString()}lbs'
                          },
                        ]
                            .map((e) => Chip(
                                  backgroundColor:
                                      Colors.purpleAccent.withAlpha(100),
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Icon(
                                      e['icon'],
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                  label: Text(e['text']),
                                ))
                            .toList(),
                      )
              ],
            ),
          ),
          //Image.network(photoUrls[1])
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: photoUrls.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(imageUrl: photoUrls[index]);
            },
          ),
        ],
      ),
    );
  }
}
