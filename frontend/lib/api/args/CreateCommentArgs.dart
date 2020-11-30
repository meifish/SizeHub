import 'package:json_annotation/json_annotation.dart';

part 'CreateCommentArgs.g.dart';

@JsonSerializable()
class CreateCommentArgs{

  final String postId;
  final String userId;
  final String comment;

  CreateCommentArgs({this.postId, this.userId, this.comment});

  factory CreateCommentArgs.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$CreateCommentArgsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommentArgsToJson(this);

}