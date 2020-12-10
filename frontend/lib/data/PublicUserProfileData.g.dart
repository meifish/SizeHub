// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PublicUserProfileData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicUserProfileData _$PublicUserProfileDataFromJson(
    Map<String, dynamic> json) {
  return PublicUserProfileData(
    json['user'] == null
        ? null
        : PublicUserData.fromJson(json['user'] as Map<String, dynamic>),
    (json['posts'] as List)
        ?.map((e) => e == null
            ? null
            : PostPreviewData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PublicUserProfileDataToJson(
        PublicUserProfileData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'posts': instance.posts,
    };
