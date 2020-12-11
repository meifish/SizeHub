import 'package:json_annotation/json_annotation.dart';

part 'RemoveLikeArgs.g.dart';

@JsonSerializable()
class RemoveLikeArgs {
  final String postId;
  final String token;

  RemoveLikeArgs(this.postId, this.token);

  factory RemoveLikeArgs.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$RemoveLikeArgsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveLikeArgsToJson(this);
}
