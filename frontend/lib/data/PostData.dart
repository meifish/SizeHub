import 'package:json_annotation/json_annotation.dart';
import 'package:size_hub/data/UserMeasurementsData.dart';
import 'package:size_hub/data/database/Database.dart';

part 'PostData.g.dart';

@JsonSerializable()
class PostData {
  final String id;
  final String userId;
  final String clothingItemId;
  final List<String> photoUrls;
  final UserMeasurementsData userMeasurementsData;

  PostData(this.id, this.userId, this.clothingItemId, this.photoUrls,
      this.userMeasurementsData);

  factory PostData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);

  Future<String> getUsername(Database database) async {
    return await database.getUsername(userId);
  }

  @override
  String toString() {
    return 'PostData{id: $id, userId: $userId, photoUrls: $photoUrls, clothingItemId: $clothingItemId, userMeasurementData: $userMeasurementsData}';
  }
}
