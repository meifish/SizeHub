import 'package:json_annotation/json_annotation.dart';

part 'BrandData.g.dart';

@JsonSerializable()
class BrandData {

  final String brandId;
  final String name;

  @override
  String toString() {
    return 'BrandData{brandId: $brandId, name: $name, websiteUrl: $websiteUrl}';
  }

  final String websiteUrl;

  BrandData(this.brandId, this.name, this.websiteUrl);

  factory BrandData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$BrandDataFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDataToJson(this);
}