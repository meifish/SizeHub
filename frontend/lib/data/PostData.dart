import 'package:json_annotation/json_annotation.dart';

part 'PostData.g.dart';

@JsonSerializable()
class PostData{
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String picture;

  PostData(this.id, this.author, this.width, this.height, this.url,
      this.picture);
  factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);
}