import 'package:json_annotation/json_annotation.dart';
import 'package:size_hub/data/BrandData.dart';

part 'ClothingItemData.g.dart';

@JsonSerializable()
class ClothingItemData {

  final String clothingItemId;
  final BrandData brand;
  final String name;

  @override
  String toString() {
    return 'ClothingItemData{clothingItemId: $clothingItemId, brand: $brand, name: $name, category: $category}';
  }

  final String category;

  ClothingItemData(this.clothingItemId, this.brand, this.name, this.category);

  factory ClothingItemData.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$ClothingItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$ClothingItemDataToJson(this);
}