// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostLocationData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostLocationData _$PostLocationDataFromJson(Map<String, dynamic> json) {
  return PostLocationData(
    (json['latitude'] as num)?.toDouble(),
    (json['longitude'] as num)?.toDouble(),
    json['cityName'] as String,
  );
}

Map<String, dynamic> _$PostLocationDataToJson(PostLocationData instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'cityName': instance.cityName,
    };
