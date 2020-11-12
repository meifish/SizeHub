import 'package:json_annotation/json_annotation.dart';

part 'UserMeasurementsData.g.dart';

@JsonSerializable()
class UserMeasurementsData{

  final int weight;
  final int height;

  UserMeasurementsData(this.weight, this.height);

  factory UserMeasurementsData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$UserMeasurementsDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserMeasurementsDataToJson(this);

  @override
  String toString() {
    return 'UserMeasurementsData{weight: $weight, height: $height}';
  }
}