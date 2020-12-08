import 'package:json_annotation/json_annotation.dart';
import 'package:size_hub/data/PostPreviewData.dart';

import 'PublicUserData.dart';

part 'PublicUserProfileData.g.dart';

@JsonSerializable()
class PublicUserProfileData {

  final PublicUserData user;
  final List<PostPreviewData> posts;

  @override
  String toString() {
    return 'PublicUserProfileData{user: $user, posts: $posts}';
  }

  PublicUserProfileData(this.user, this.posts);

  factory PublicUserProfileData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$PublicUserProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$PublicUserProfileDataToJson(this);
}