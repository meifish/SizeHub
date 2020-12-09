// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostPreviewData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPreviewData _$PostPreviewDataFromJson(Map<String, dynamic> json) {
  return PostPreviewData(
    json['postId'] as String,
    json['user'] == null
        ? null
        : PublicUserData.fromJson(json['user'] as Map<String, dynamic>),
    (json['photoUrls'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PostPreviewDataToJson(PostPreviewData instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'user': instance.user,
      'photoUrls': instance.photoUrls,
    };
