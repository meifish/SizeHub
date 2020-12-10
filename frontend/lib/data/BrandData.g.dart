// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BrandData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandData _$BrandDataFromJson(Map<String, dynamic> json) {
  return BrandData(
    json['brandId'] as String,
    json['name'] as String,
    json['websiteUrl'] as String,
  );
}

Map<String, dynamic> _$BrandDataToJson(BrandData instance) => <String, dynamic>{
      'brandId': instance.brandId,
      'name': instance.name,
      'websiteUrl': instance.websiteUrl,
    };
