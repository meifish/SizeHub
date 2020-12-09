// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DetailedPostData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedPostData _$DetailedPostDataFromJson(Map<String, dynamic> json) {
  return DetailedPostData(
    json['postId'] as String,
    json['user'] == null
        ? null
        : PublicUserData.fromJson(json['user'] as Map<String, dynamic>),
    json['clothingItem'] == null
        ? null
        : ClothingItemData.fromJson(
            json['clothingItem'] as Map<String, dynamic>),
    json['clothingItemSize'] as String,
    json['userMeasurementsData'] == null
        ? null
        : UserMeasurementsData.fromJson(
            json['userMeasurementsData'] as Map<String, dynamic>),
    (json['photoUrls'] as List)?.map((e) => e as String)?.toList(),
    json['caption'] as String,
    (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : CommentData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DetailedPostDataToJson(DetailedPostData instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'user': instance.user,
      'clothingItem': instance.clothingItem,
      'clothingItemSize': instance.clothingItemSize,
      'userMeasurementsData': instance.userMeasurementsData,
      'photoUrls': instance.photoUrls,
      'caption': instance.caption,
      'comments': instance.comments,
    };
