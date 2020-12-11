import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:size_hub/data/UserStats.dart';

class ChartPage extends StatefulWidget {
  ChartPage() : super();


  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<UserStats> posts = [
    UserStats("Likes and Comments", 50, 10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FlareActor('assets/animations/BackgroundPurpleFlow.flr', animation: 'Flow', fit: BoxFit.fill,),
          ),
          charts.BarChart(
            [
              charts.Series<UserStats, String>(
                id: "Likes",
                data: posts,
                domainFn: (UserStats post, _) => post.title,
                measureFn: (UserStats post, _) => post.likes,
                colorFn: (x, y) => charts.MaterialPalette.red.makeShades(1)[0],
              ),
              charts.Series<UserStats, String>(
                id: "Comments",
                data: posts,
                domainFn: (UserStats post, _) => post.title,
                measureFn: (UserStats post, _) => post.comments,
                colorFn: (x, y) => charts.MaterialPalette.green.makeShades(1)[0],
              )
            ],
            barGroupingType: charts.BarGroupingType.grouped,
            animate: true,
            domainAxis: new charts.OrdinalAxisSpec(
                renderSpec: new charts.SmallTickRendererSpec(

                  // Tick and Label styling here.
                    labelStyle: new charts.TextStyleSpec(
                        fontSize: 18, // size in Pts.
                        color: charts.MaterialPalette.black),

                    // Change the line colors to match text color.
                    lineStyle: new charts.LineStyleSpec(
                        color: charts.MaterialPalette.black))),
            primaryMeasureAxis: new charts.NumericAxisSpec(
                renderSpec: new charts.GridlineRendererSpec(

                  // Tick and Label styling here.
                    labelStyle: new charts.TextStyleSpec(
                        fontSize: 18, // size in Pts.
                        color: charts.MaterialPalette.black),

                    // Change the line colors to match text color.
                    lineStyle: new charts.LineStyleSpec(
                        color: charts.MaterialPalette.black))),
          ),
        ],
      ),
    );
  }
}