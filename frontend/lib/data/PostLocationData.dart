import 'package:json_annotation/json_annotation.dart';

part 'PostLocationData.g.dart';

@JsonSerializable()
class PostLocationData {
  double latitude;
  double longitude;
  String cityName;

  PostLocationData(this.latitude, this.longitude, this.cityName);

  factory PostLocationData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$PostLocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostLocationDataToJson(this);

  @override
  String toString() {
    return 'PostLocationData{latitude: $latitude, longitude: $longitude, cityName: $cityName}';
  }
}
