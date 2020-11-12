import 'package:json_annotation/json_annotation.dart';
import 'package:size_hub/data/UserMeasurementData.dart';

part 'PostData.g.dart';

@JsonSerializable()
class PostData{
  final String id;
  final Future<String> author;
  final List<String> photoUrls;
  final UserMeasurementData userMeasurementData;

  PostData(this.id, this.author, this.photoUrls, this.userMeasurementData);
}