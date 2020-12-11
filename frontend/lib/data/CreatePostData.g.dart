// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreatePostData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostData _$CreatePostDataFromJson(Map<String, dynamic> json) {
  return CreatePostData(
    json['clothingItemId'] as String,
    json['clothingItemSize'] as String,
    json['userMeasurementsData'] == null
        ? null
        : UserMeasurementsData.fromJson(
            json['userMeasurementsData'] as Map<String, dynamic>),
    (json['photoUrls'] as List)?.map((e) => e as String)?.toList(),
    json['location'] == null
        ? null
        : PostLocationData.fromJson(json['location'] as Map<String, dynamic>),
    json['comment'] as String,
    json['token'] as String,
  );
}

Map<String, dynamic> _$CreatePostDataToJson(CreatePostData instance) =>
    <String, dynamic>{
      'clothingItemId': instance.clothingItemId,
      'clothingItemSize': instance.clothingItemSize,
      'userMeasurementsData': instance.userMeasurementsData,
      'photoUrls': instance.photoUrls,
      'location': instance.location,
      'comment': instance.comment,
      'token': instance.token,
    };
