import 'package:json_annotation/json_annotation.dart';

part 'CommentData.g.dart';

@JsonSerializable()
class CommentData{

  final String commentId;
  final String comment;

  @override
  String toString() {
    return 'CommentData{commentId: $commentId, comment: $comment}';
  }

  CommentData(this.commentId, this.comment);

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$CommentDataFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDataToJson(this);

}