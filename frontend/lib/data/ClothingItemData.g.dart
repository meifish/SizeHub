// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClothingItemData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClothingItemData _$ClothingItemDataFromJson(Map<String, dynamic> json) {
  return ClothingItemData(
    json['clothingItemId'] as String,
    json['brand'] == null
        ? null
        : BrandData.fromJson(json['brand'] as Map<String, dynamic>),
    json['name'] as String,
    json['category'] as String,
  );
}

Map<String, dynamic> _$ClothingItemDataToJson(ClothingItemData instance) =>
    <String, dynamic>{
      'clothingItemId': instance.clothingItemId,
      'brand': instance.brand,
      'name': instance.name,
      'category': instance.category,
    };
