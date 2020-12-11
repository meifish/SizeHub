import 'package:json_annotation/json_annotation.dart';

part 'CreateCommentArgs.g.dart';

@JsonSerializable()
class CreateCommentArgs{

  final String postId;
  final String token;
  final String comment;

  CreateCommentArgs({this.postId, this.token, this.comment});

  factory CreateCommentArgs.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$CreateCommentArgsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCommentArgsToJson(this);

}