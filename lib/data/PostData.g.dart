// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return PostData(
    json['id'] as String,
    json['author'] as String,
    json['width'] as int,
    json['height'] as int,
    json['url'] as String,
    json['picture'] as String,
  );
}

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'picture': instance.picture,
    };
