// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PublicUserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicUserData _$PublicUserDataFromJson(Map<String, dynamic> json) {
  return PublicUserData(
    json['userId'] as String,
    json['username'] as String,
  );
}

Map<String, dynamic> _$PublicUserDataToJson(PublicUserData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
    };
