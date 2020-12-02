// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserMeasurementsData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMeasurementsData _$UserMeasurementsDataFromJson(Map<String, dynamic> json) {
  return UserMeasurementsData(
    json['weight'] as int,
    json['wearSize'] as String,
    json['height'] as String,
  );
}

Map<String, dynamic> _$UserMeasurementsDataToJson(
        UserMeasurementsData instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'wearSize': instance.wearSize,
      'height': instance.height,
    };
