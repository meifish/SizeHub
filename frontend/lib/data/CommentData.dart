import 'package:json_annotation/json_annotation.dart';

part 'CommentData.g.dart';

@JsonSerializable()
class CommentData{

  final String id;
  final String postId;
  final String userId;
  final String comment;

  CommentData({this.id, this.postId, this.userId, this.comment});

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$CommentDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDataToJson(this);

  @override
  String toString() {
    return 'CommentData{id: $id, postId: $postId, userId: $userId, comment: $comment}';
  }
}