// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateCommentArgs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCommentArgs _$CreateCommentArgsFromJson(Map<String, dynamic> json) {
  return CreateCommentArgs(
    postId: json['postId'] as String,
    token: json['token'] as String,
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$CreateCommentArgsToJson(CreateCommentArgs instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'token': instance.token,
      'comment': instance.comment,
    };
