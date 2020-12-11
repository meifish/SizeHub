import 'package:json_annotation/json_annotation.dart';

part 'AddLikeArgs.g.dart';

@JsonSerializable()
class AddLikeArgs {
  final String postId;
  final String token;

  AddLikeArgs(this.postId, this.token);

  factory AddLikeArgs.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$AddLikeArgsFromJson(json);

  Map<String, dynamic> toJson() => _$AddLikeArgsToJson(this);
}
