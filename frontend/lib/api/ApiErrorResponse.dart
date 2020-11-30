import 'package:json_annotation/json_annotation.dart';

part 'ApiErrorResponse.g.dart';

@JsonSerializable()
class ApiErrorResponse{

  final String error;

  ApiErrorResponse(this.error);

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      json == null ? null : _$ApiErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);

  @override
  String toString() {
    return error;
  }
}