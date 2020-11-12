import 'package:json_annotation/json_annotation.dart';
import 'package:size_hub/data/UserMeasurementData.dart';
import 'package:size_hub/data/database/Database.dart';

part 'PostData.g.dart';

@JsonSerializable()
class PostData{
  final String id;
  final String userId;
  final List<String> photoUrls;
  final UserMeasurementData userMeasurementData;

  PostData(this.id, this.userId, this.photoUrls, this.userMeasurementData);

  Future<String> getUsername(Database database) async {
    return await database.getUsername(userId);
  }
}