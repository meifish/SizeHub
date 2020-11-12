// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return PostData(
    json['id'] as String,
    json['userId'] as String,
    (json['photoUrls'] as List)?.map((e) => e as String)?.toList(),
    json['userMeasurementsData'] == null
        ? null
        : UserMeasurementsData.fromJson(
            json['userMeasurementsData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'photoUrls': instance.photoUrls,
      'userMeasurementsData': instance.userMeasurementsData,
    };
