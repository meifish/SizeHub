import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:size_hub/ui/Widgets/MapPageWidgets/Location.dart';

class Map extends StatelessWidget {
  LatLng centre = LatLng(43.9549519, -79.396926);
  List<Location> imgLocs;

  Map({currentLocation: Location, this.imgLocs}) {
    // if (currentLocation != null) {
    //   centre = currentLocation.latlng;
    // }
    if (imgLocs != null) {
      print("new loc received");
      for (int i = 0; i < imgLocs.length; i++) {
        print("City:" + i.toString());
        print(imgLocs[i].city);
        print(imgLocs[i].latlng.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(imgLocs);
    return FlutterMap(
      options: MapOptions(
        zoom: 7.0,
        minZoom: 7.0,
        center: centre,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/meifish/ckiexgr4329vj1an3k0fnha8s/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWVpZmlzaCIsImEiOiJja2lld2g1Z2sxZXZ3MnJsNnEweThueDAzIn0.y9leC1MZn3Y18NluqD9-6A',
            additionalOptions: {
              'accessToken':
                  'sk.eyJ1IjoibWVpZmlzaCIsImEiOiJja2lld3F2aXkxNW01MzBsZ3B1eDZrdTV3In0.ZUX02GEzi3cwWcNJBnnzZQ',
              'id': 'mapbox.mapbox-streets-v8',
            }),
        MarkerLayerOptions(
            markers: (imgLocs != null)
                ? imgLocs.map((value) => Marker(
                    width: 45.0,
                    height: 45.0,
                    point: value.latlng,
                    builder: (context) => Container(
                            child: Container(
                                child: CachedNetworkImage(
                          imageUrl:
                              value.imgURL,
                        ))))).toList()
                : [
                    Marker(
                        width: 45.0,
                        height: 45.0,
                        point: centre,
                        builder: (context) => Container(
                                child: IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              icon: Icon(Icons.location_on),
                            )))
                  ]
            // : imgLocs.map((loc) {
            //     print("mapping");
            //     print(loc.city);
            //     print(loc.latlng);
            //     Marker(
            //         width: 45.0,
            //         height: 45.0,
            //         point: loc.latlng,
            //         builder: (context) => Container(
            //               child: SizedBox(
            //                   width: 45.0,
            //                   height: 45.0,
            //                   child: Image.network(loc.imgURL)),
            //             ));
            //   }).toList()),
            )
      ],
    );
  }
}
