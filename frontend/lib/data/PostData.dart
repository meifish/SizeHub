import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class PostData{
  final String id;
  final String author;
  final List<String> photoUrls;

  PostData(this.id, this.author, this.photoUrls);
}