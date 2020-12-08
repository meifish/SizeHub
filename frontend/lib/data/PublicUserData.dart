import 'package:json_annotation/json_annotation.dart';

part 'PublicUserData.g.dart';

@JsonSerializable()
class PublicUserData {

  final String userId;
  final String username;

  @override
  String toString() {
    return 'PublicUserData{userId: $userId, username: $username}';
  }

  PublicUserData(this.userId, this.username);

  factory PublicUserData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$PublicUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$PublicUserDataToJson(this);
}