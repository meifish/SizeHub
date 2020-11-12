import 'package:json_annotation/json_annotation.dart';

part 'UserMeasurementData.g.dart';

@JsonSerializable()
class UserMeasurementData{

  final int weight;
  final int height;

  UserMeasurementData(this.weight, this.height);

}