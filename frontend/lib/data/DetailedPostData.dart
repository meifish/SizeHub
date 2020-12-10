import 'package:json_annotation/json_annotation.dart';
import 'package:size_hub/data/ClothingItemData.dart';
import 'package:size_hub/data/CommentData.dart';
import 'package:size_hub/data/UserMeasurementsData.dart';

import 'PublicUserData.dart';

part 'DetailedPostData.g.dart';

@JsonSerializable()
class DetailedPostData {

  final String postId;
  final PublicUserData user;
  final ClothingItemData clothingItem;
  final String clothingItemSize;
  final UserMeasurementsData userMeasurementsData;
  final List<String> photoUrls;
  final String caption;
  final List<CommentData> comments;

  DetailedPostData(
      this.postId,
      this.user,
      this.clothingItem,
      this.clothingItemSize,
      this.userMeasurementsData,
      this.photoUrls,
      this.caption,
      this.comments);

  @override
  String toString() {
    return 'DetailedPostData{postId: $postId, user: $user, clothingItem: $clothingItem, clothingItemSize: $clothingItemSize, userMeasurementsData: $userMeasurementsData, photoUrls: $photoUrls, caption: $caption, comments: $comments}';
  }

  factory DetailedPostData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$DetailedPostDataFromJson(json);

  Map<String, dynamic> toJson() => _$DetailedPostDataToJson(this);
}