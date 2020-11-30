// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentData _$CommentDataFromJson(Map<String, dynamic> json) {
  return CommentData(
    id: json['id'] as String,
    postId: json['postId'] as String,
    userId: json['userId'] as String,
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$CommentDataToJson(CommentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'userId': instance.userId,
      'comment': instance.comment,
    };
