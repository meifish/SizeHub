import 'package:json_annotation/json_annotation.dart';
import 'package:size_hub/data/PublicUserProfileData.dart';

part 'CommentData.g.dart';

@JsonSerializable()
class CommentData{

  final String commentId;
  final String comment;
  final PublicUserProfileData publicUserProfileData;
  final String createdAt;
  final List<String> userIdLikes;
  final bool isLiked;

  CommentData(this.commentId, this.comment, this.publicUserProfileData,
      this.createdAt, this.userIdLikes, this.isLiked);

  @override
  String toString() {
    return 'CommentData{commentId: $commentId, comment: $comment, publicUserProfileData: $publicUserProfileData, createdAt: $createdAt}';
  }

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$CommentDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDataToJson(this);

}