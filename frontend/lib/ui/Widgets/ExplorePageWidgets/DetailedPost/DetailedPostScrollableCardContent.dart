import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:size_hub/data/UserMeasurementsData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SizeWidget.dart';

class DetailedPostScrollableCardContent extends StatelessWidget {
  final UserMeasurementsData userMeasurementData;
  final List<String> photoUrls;

  const DetailedPostScrollableCardContent(
      {Key key, this.userMeasurementData, this.photoUrls})
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
                  Text('Lululemon', textScaleFactor: 4,),
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
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Perfectly Oversized Crew', textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20),
                child: SizeWidget(typeSize: "Size", size: "6"),
              ),
            ],
          ),
          SizedBox(height: 10),

          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                ),
                SizedBox(height: 10,),
                userMeasurementData==null ? Text("No Measurement Provided with this Post") :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    {
                      'icon': FontAwesomeIcons.rulerVertical,
                      'text': '${userMeasurementData.height}'
                    },
                    {
                      'icon': FontAwesomeIcons.rulerHorizontal,
                      'text': '${userMeasurementData.weight}lbs'
                    },
                    /*{
                      'icon': FontAwesomeIcons.rulerHorizontal,
                      'text': 'Size ${userMeasurementData.wearSize}'
                    },*/
                  ]
                      .map((e) => Chip(
                            backgroundColor: Colors.purpleAccent.withAlpha(100),
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
