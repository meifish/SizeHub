import 'package:json_annotation/json_annotation.dart';
import 'package:size_hub/data/PostLocationData.dart';
import 'package:size_hub/data/UserMeasurementsData.dart';

part 'CreatePostData.g.dart';

@JsonSerializable()
class CreatePostData {
  String clothingItemId;
  String clothingItemSize;
  UserMeasurementsData userMeasurementsData;
  List<String> photoUrls;
  PostLocationData location;
  String comment;
  String token;

  CreatePostData(
      this.clothingItemId,
      this.clothingItemSize,
      this.userMeasurementsData,
      this.photoUrls,
      this.location,
      this.comment,
      this.token);

  factory CreatePostData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$CreatePostDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostDataToJson(this);
}
