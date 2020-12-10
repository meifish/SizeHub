import 'package:json_annotation/json_annotation.dart';
import 'PublicUserData.dart';

part 'PostPreviewData.g.dart';

@JsonSerializable()
class PostPreviewData {

  final String postId;
  final PublicUserData user;
  final List<String> photoUrls;

  @override
  String toString() {
    return 'PostPreviewData{postId: $postId, user: $user, photoUrls: $photoUrls}';
  }

  PostPreviewData(this.postId, this.user, this.photoUrls);

  factory PostPreviewData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$PostPreviewDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostPreviewDataToJson(this);
}